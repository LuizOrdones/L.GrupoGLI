package br.com.iesb.produto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.iesb.produto.dao.JdbcVendasDao;
import br.com.iesb.produto.modelo.Vendas;

@Controller
public class VendasController {
	
	@RequestMapping("adicionaVendas")
	public String adiconaVendas(Vendas vendas){
		
		JdbcVendasDao dao = new JdbcVendasDao();
		dao.adicionaVendas(vendas);

		return "formularioVendas";
		
	}

}
