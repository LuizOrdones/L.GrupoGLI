package br.com.iesb.produto.modelo;

import javax.validation.constraints.NotNull;

public class Usuario {
	@NotNull
	private String login;
	@NotNull
	private String senha;

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
}
