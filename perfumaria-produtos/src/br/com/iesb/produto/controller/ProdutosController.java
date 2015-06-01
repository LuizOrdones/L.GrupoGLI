package br.com.iesb.produto.controller;

import java.util.Calendar;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.iesb.produto.dao.JdbcProdutosDao;
import br.com.iesb.produto.modelo.Produto;

@Controller
public class ProdutosController {
		
	@RequestMapping("adicionaProduto")
	public String adiciona(@Valid Produto produto, BindingResult result){
		
		if(result.hasFieldErrors("descricao")) {
		    return "formulario";		
		}
		
		produto.setDataInclusaoProduto(Calendar.getInstance());
		JdbcProdutosDao dao = new JdbcProdutosDao();
		dao.adiciona(produto);
		return "adicionado";		
	}
	
	@RequestMapping("listaProdutos")
	public String lista(Model model) {
		JdbcProdutosDao dao = new JdbcProdutosDao();
	  	model.addAttribute("produtos", dao.lista());
	  	return "lista";
	}
	
	@RequestMapping("removeProduto")
	public String remove(Produto produto) {
		JdbcProdutosDao dao = new JdbcProdutosDao();
	  	dao.remove(produto);
	  	return "redirect:listaProdutos";
	}
	
	@RequestMapping("mostraProduto")
	public String mostra(Long id, Model model) {
		JdbcProdutosDao dao = new JdbcProdutosDao();
		model.addAttribute("produto", dao.buscaPorId(id));
		return "mostra";
	}
	
	@RequestMapping("alteraProduto")
	public String altera(Produto produto) {
		JdbcProdutosDao dao = new JdbcProdutosDao();
		dao.altera(produto);
		return "redirect:listaProdutos";
	}
	
	@RequestMapping ("home")
	public String paginaInicial() {
		return "index";
	}
		
}
