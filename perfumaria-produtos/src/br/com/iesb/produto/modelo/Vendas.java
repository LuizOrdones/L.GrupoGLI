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
	private int qtdVenda;
	private int estoqueAtualizado;
	private boolean atividadeVenda;
	private Produto produto;

	public Vendas(){
		this.produto = new Produto();
	}
	public void calculaEstoque(){
		Produto produto = new Produto();
		estoqueAtualizado = qtdVenda - produto.getQtdProduto();
		produto.setQtdProduto(estoqueAtualizado) ;
	}
	
	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public int getEstoqueAtualizado() {
		return estoqueAtualizado;
	}

	public void setEstoqueAtualizado(int estoqueAtualizado) {
		this.estoqueAtualizado = estoqueAtualizado;
	}
	
	public int getEstoqueAtualizadoAsString() {
		Produto produto = new Produto ();
		estoqueAtualizado = produto.getQtdProduto() - qtdVenda;
		return estoqueAtualizado;
	}
	
	public int getQtdVenda() {
		return qtdVenda;
	}
	public void setQtdVenda(int qtdVenda) {
		this.qtdVenda = qtdVenda;
	}
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
	public boolean isAtividadeVenda() {
		return atividadeVenda;
	}
	public void setAtividadeVenda(boolean atividadeVenda) {
		this.atividadeVenda = atividadeVenda;
	}

	
}