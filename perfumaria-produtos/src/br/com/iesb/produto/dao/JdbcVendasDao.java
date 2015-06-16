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
import br.com.iesb.produto.modelo.Vendas;

public class JdbcVendasDao {
	private Connection connection;
	
	public JdbcVendasDao(){
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void adicionaVendas(br.com.iesb.produto.modelo.Vendas vendas){
		String sql = "insert into vendas (valorVenda, estoqueAtualizado, dataVenda, qtdVenda) values (?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setDouble(1, vendas.getValorVenda());
			stmt.setInt(2, vendas.getEstoqueAtualizado());
			stmt.setTimestamp(3, new java.sql.Timestamp((vendas.getDataVenda()!= null ? 
					vendas.getDataVenda() : Calendar.getInstance()).getTimeInMillis()));
			stmt.setInt(4, vendas.getQtdVenda());
			stmt.execute();
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void altera(Vendas vendas) {
		String sql = "update vendas set valorVenda = ?, qtdVenda = ? where numVenda = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setDouble(1, vendas.getValorVenda());
			stmt.setInt(2, vendas.getQtdVenda());
			stmt.setInt(3, vendas.getNumVenda());
			stmt.execute();
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Vendas> lista() {
		try {
			List<Vendas> vendas = new ArrayList<Vendas>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from vendas");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				// adiciona a venda na lista
				vendas.add(populaVendas(rs));
			}

			rs.close();
			stmt.close();

			return vendas;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Vendas buscaPorNumVendas(Long numVenda) {

		if (numVenda == null) {
			throw new IllegalStateException("numVenda da venda não deve ser nulo.");
		}

		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from vendas where numVendas = ?");
			stmt.setLong(1, numVenda);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				return populaVendas(rs);
			}

			rs.close();
			stmt.close();

			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	private Vendas populaVendas(ResultSet rs) throws SQLException {
		Vendas vendas = new Vendas();

		// popula o objeto vendas
		vendas.setNumVenda(rs.getInt("numVenda"));
		vendas.setValorVenda(rs.getDouble("valorVenda"));
		vendas.setQtdVenda(rs.getInt("qtdVenda"));
		vendas.setEstoqueAtualizado(rs.getInt("estoqueAtualizado"));
		vendas.setProduto(new JdbcProdutosDao().buscaPorId(rs.getLong("produtos_id")));
				
		// popula a data de inclusao da venda, fazendo a conversao
		Timestamp data = rs.getTimestamp("dataVenda");
		if (data != null) {
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			Calendar dataVenda = Calendar.getInstance();
			dataVenda.setTime(data);
			System.out.println(">>" + dateFormat.format(data));
			vendas.setDataVenda(dataVenda);
		} else vendas.setDataVenda(null);
		return vendas;
	}
	
}

