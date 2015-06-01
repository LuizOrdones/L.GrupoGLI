package br.com.iesb.produto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.iesb.produto.ConnectionFactory;
import br.com.iesb.produto.modelo.Produto;

public class JdbcProdutosDao {
	private final Connection connection;

	public JdbcProdutosDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void adiciona(br.com.iesb.produto.modelo.Produto produto) {
		String sql = "insert into produtos (descricao, marcaProduto, generoProduto, valorDeCustoProduto, qtdProduto, qtdMlProduto, dataInclusaoProduto, atividadeProduto) values (?,?,?,?,?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, produto.getDescricao());
			stmt.setString(2, produto.getMarcaProduto());
			stmt.setString(3, produto.getGeneroProduto());
			stmt.setDouble(4, produto.getValorDeCustoProduto());
			stmt.setInt(5, produto.getQtdProduto());
			stmt.setDouble(6, produto.getQtdMlProduto());
			stmt.setTimestamp(7, new java.sql.Timestamp((produto.getDataInclusaoProduto()!= null ? 
					produto.getDataInclusaoProduto() : Calendar.getInstance()).getTimeInMillis()));
			stmt.setBoolean(8, produto.isAtividadeProduto());
			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remove(Produto produto) {
		if (produto == null) {			
			throw new IllegalStateException("Id do produto não deve ser nulo.");
		}

		String sql = "delete from produtos where id = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setLong(1, produto.getId());
			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void altera(Produto produto) {
		String sql = "update produtos set descricao = ?, marcaProduto = ?, generoProduto = ?, qtdMlProduto = ? where id = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, produto.getDescricao());
			stmt.setString(2, produto.getMarcaProduto());
			stmt.setString(3, produto.getGeneroProduto());
			/*stmt.setDouble(4, produto.getValorDeCustoProduto());
			stmt.setInt(5, produto.getQtdProduto());*/
			stmt.setDouble(4, produto.getQtdMlProduto());
			/*stmt.setDate(7, produto.getDataInclusaoProduto() != null ? new Date(
					produto.getDataInclusaoProduto().getTimeInMillis()) : null);
			stmt.setBoolean(8, produto.isAtividadeProduto());*/
			stmt.setLong(5, produto.getId());
			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Produto> lista() {
		try {
			List<Produto> produto = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from produtos");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				// adiciona o produto na lista
				produto.add(populaProduto(rs));
			}

			rs.close();
			stmt.close();

			return produto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Produto buscaPorId(Long id) {

		if (id == null) {
			throw new IllegalStateException("Id da produto não deve ser nulo.");
		}

		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from produtos where id = ?");
			stmt.setLong(1, id);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				return populaProduto(rs);
			}

			rs.close();
			stmt.close();

			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private Produto populaProduto(ResultSet rs) throws SQLException {
		Produto produto = new Produto();

		// popula o objeto produto
		produto.setId(rs.getInt("id"));
		produto.setDescricao(rs.getString("descricao"));
		produto.setMarcaProduto(rs.getString("marcaProduto"));
		produto.setGeneroProduto(rs.getString("generoProduto"));
		produto.setValorDeCustoProduto(rs.getDouble("valorDeCustoProduto"));
		produto.setQtdProduto(rs.getInt("qtdProduto"));
		produto.setQtdMlProduto(rs.getDouble("qtdMlProduto"));
		produto.setAtividadeProduto(rs.getBoolean("atividadeProduto"));
		
		// popula a data de inclusao do produto, fazendo a conversao
		Timestamp data = rs.getTimestamp("dataInclusaoProduto");
		if (data != null) {
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			Calendar dataInclusaoProduto = Calendar.getInstance();
			dataInclusaoProduto.setTime(data);
			System.out.println(">>" + dateFormat.format(data));
			produto.setDataInclusaoProduto(dataInclusaoProduto);
		} else produto.setDataInclusaoProduto(null);
		return produto;
	}
}
