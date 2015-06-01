package br.com.iesb.produto.modelo;

import java.util.Date;

public class Funcionario {
	
	private int matricula;
	private String nome;
	private String cpf;
	private String rg;
	private double salario;
	private Date dataAdmicao;
	private String cargo;
	private boolean atividadeFuncionario;
	
	public boolean isAtividadeFuncionario() {
		return atividadeFuncionario;
	}
	public void setAtividadeFuncionario(boolean atividadeFuncionario) {
		this.atividadeFuncionario = atividadeFuncionario;
	}
	public String getCargo() {
		return cargo;
	}
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
	public int getMatricula() {		
		return matricula;
	}
	public void setMatricula(int matricula) {
		this.matricula = matricula;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	public double getSalario() {
		return salario;
	}
	public void setSalario(double salario) {
		this.salario = salario;
	}
	public Date getDataAdmicao() {
		return dataAdmicao;
	}
	public void setDataAdmicao(Date dataAdmicao) {
		this.dataAdmicao = dataAdmicao;
	}

}
