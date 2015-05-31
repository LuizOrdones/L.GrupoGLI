package br.com.iesb.produto.modelo;

import java.util.Date;

public class Vendas {
	
	private int num_venda;
	private Date data_venda;
	private double valor_venda;
	private double desconto;
	private double lucro;
	
	public int getNum_venda() {
		return num_venda;
	}
	public void setNum_venda(int num_venda) {
		this.num_venda = num_venda;
	}
	public Date getData_venda() {
		return data_venda;
	}
	public void setData_venda(Date data_venda) {
		this.data_venda = data_venda;
	}
	public double getValor_venda() {
		return valor_venda;
	}
	public void setValor_venda(double valor_venda) {
		this.valor_venda = valor_venda;
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
	public int getQtd_venda() {
		return qtd_venda;
	}
	public void setQtd_venda(int qtd_venda) {
		this.qtd_venda = qtd_venda;
	}
	private int qtd_venda;	

}
