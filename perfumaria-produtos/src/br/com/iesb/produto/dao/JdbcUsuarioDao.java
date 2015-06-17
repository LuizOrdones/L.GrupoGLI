package br.com.iesb.produto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.iesb.produto.ConnectionFactory;
import br.com.iesb.produto.modelo.Usuario;

public class JdbcUsuarioDao {
	private Connection connection;

	public JdbcUsuarioDao() {
		try {
			connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public boolean existeUsuario(Usuario usuario) {

		if (usuario == null) {
			throw new IllegalArgumentException("Usuário não deve ser nulo");
		}

		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from usuarios where login = ? and senha = ?");
			stmt.setString(1, usuario.getLogin());
			stmt.setString(2, usuario.getSenha());
			ResultSet rs = stmt.executeQuery();

			boolean encontrado = rs.next();
			rs.close();
			stmt.close();

			return encontrado;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void adicionaUsuario(br.com.iesb.produto.modelo.Usuario usuario){
		String sql = "insert into usuarios (login, senha) values (?,?)";
		PreparedStatement stmt;
		try{
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getLogin());
			stmt.setString(2, usuario.getSenha());
			stmt.execute();
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public void revomeUsuario(Usuario usuario){
		if (usuario == null){
			throw new IllegalStateException ("usuário não deve ser nulo");
		}
		String sql = "delete from usuario where login = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getLogin());
			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Usuario> lista(){
		try {
			List<Usuario> usuario = new ArrayList<Usuario>();
			PreparedStatement stmt = this.connection.prepareStatement("select * from usuarios");
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				usuario.add(populaUsuario(rs));				
			}
			
			rs.close();
			stmt.close();
				
			return usuario;
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
						
	}
	
	public Usuario buscaPorLogib(String login) {

		if (login == null) {
			throw new IllegalStateException("login de usuario não deve ser nulo.");
		}

		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from usuarios where login = ?");
			stmt.setString(1, login);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				return populaUsuario(rs);
			}

			rs.close();
			stmt.close();

			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	private Usuario populaUsuario(ResultSet rs) throws SQLException {
		Usuario usuario = new Usuario();

		// popula o objeto produto
		usuario.setLogin(rs.getString("login"));
		usuario.setSenha(rs.getString("senha"));

		return usuario;
	}
}
