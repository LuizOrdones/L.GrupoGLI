package br.com.iesb.produto.modelo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class Produto {
	
	private int id;
	@DateTimeFormat(pattern="dd/MM/yyyy HH:mm:ss")
	private Calendar dataInclusaoProduto;
	@Size(min=4)
	@NotNull (message="{produto.nome.vazio}")
	private String descricao;
	private String marcaProduto;
	private String generoProduto;
	private double valorDeCustoProduto;
	private int qtdProduto;
	private double qtdMlProduto;
	private boolean atividadeProduto;
	
	public boolean isAtividadeProduto() {
		return atividadeProduto;
	}
	public void setAtividadeProduto(boolean atividadeProduto) {
		this.atividadeProduto = atividadeProduto;
	}
	public long getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public Calendar getDataInclusaoProduto() {
		return dataInclusaoProduto;
	}
	
	public String getDataInclusaoProdutoAsString() {
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Calendar cal = getDataInclusaoProduto();
		String dataStr = dateFormat.format(cal.getTime());
		return dataStr;
	}
	public void setDataInclusaoProduto(Calendar dataInclusaoProduto) {
		this.dataInclusaoProduto = dataInclusaoProduto;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getMarcaProduto() {
		return marcaProduto;
	}
	public void setMarcaProduto(String marcaProduto) {
		this.marcaProduto = marcaProduto;
	}
	public String getGeneroProduto() {
		return generoProduto;
	}
	public void setGeneroProduto(String generoProduto) {
		this.generoProduto = generoProduto;
	}
	public double getValorDeCustoProduto() {
		return valorDeCustoProduto;
	}
	public void setValorDeCustoProduto(double valorDeCustoProduto) {
		this.valorDeCustoProduto = valorDeCustoProduto;
	}
	
	public int getQtdProduto() {
		return qtdProduto;
	}
	public void setQtdProduto(int qtdProduto) {
		this.qtdProduto = qtdProduto;
	}
	public double getQtdMlProduto() {
		return qtdMlProduto;
	}
	public void setQtdMlProduto(double qtdMlProduto) {
		this.qtdMlProduto = qtdMlProduto;
	}
	
}
