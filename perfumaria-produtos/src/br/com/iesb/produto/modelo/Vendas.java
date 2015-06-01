package br.com.iesb.produto.modelo;

import java.util.Calendar;

import org.springframework.format.annotation.DateTimeFormat;

public class Vendas {
	
	private int numVenda;
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Calendar dataVenda;
	private double valorVenda;
	private double desconto;
	private double lucro;
	
	public int getNumVenda() {
		return numVenda;
	}
	public void setNumVenda(int numVenda) {
		this.numVenda = numVenda;
	}
	
	public Calendar getDataVenda() {
		return dataVenda;
	}
	public void setDataVenda(Calendar dataVenda) {
		this.dataVenda = dataVenda;
	}
	public double getValorVenda() {
		return valorVenda;
	}
	public void setValorVenda(double valorVenda) {
		this.valorVenda = valorVenda;
	}
	public double getDesconto() {
		return desconto;
	}
	public void setDesconto(double desconto) {
		this.desconto = desconto;
	}
	public double getLucro() {
		return lucro;
	}
	public void setLucro(double lucro) {
		this.lucro = lucro;
	}

	
}