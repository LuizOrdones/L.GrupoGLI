package br.com.iesb.produto.dao;

import java.sql.Connection;
import java.sql.SQLException;

import br.com.iesb.produto.ConnectionFactory;

public class JdbcVendasDao {
	private Connection connection;
	
	public JdbcVendasDao(){
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
