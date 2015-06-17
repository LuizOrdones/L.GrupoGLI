package br.com.iesb.produto.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.iesb.produto.dao.JdbcUsuarioDao;
import br.com.iesb.produto.modelo.Usuario;

@Controller
public class LoginController {
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "formulario-login";
	}
	
	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Usuario usuario, HttpSession session) {
		if(new JdbcUsuarioDao().existeUsuario(usuario)) {
			session.setAttribute("usuarioLogado", usuario);
			return "index";
		}
		return "redirect:loginForm";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm";
	}
	
	@RequestMapping("listaUsuarios")
	public String lista(Model model){
		JdbcUsuarioDao dao = new JdbcUsuarioDao();
		model.addAttribute("usuarios", dao.lista());
		return "listaUsuarios";
	}
	
	@RequestMapping("adicionaUsuario")
	public String adicionaUsuario(@Valid Usuario usuario, BindingResult result){
		
		if(result.hasFieldErrors("login")) {
		    return "formulario-usuario";		
		}
		
		if(result.hasFieldErrors("senha")) {
		    return "formulario-usuario";		
		}

		JdbcUsuarioDao dao = new JdbcUsuarioDao();
		dao.adicionaUsuario(usuario);
		return "adicionado";		
	}
}
