package com.hcl.controller;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hcl.dao.UserDaoImpl;

@Controller
public class UserController {
	@Autowired
	private UserDaoImpl userDao;

	@GetMapping("/register")
	public String getRegister() {
		return "register";
	}

	@PostMapping("/register")
	public String postRegister(@RequestParam("uname") String name, @RequestParam("pass") String pass, Model model) {

		if (userDao.registerUser(name, pass)) {
			System.out.println("user register successful");
			return ("redirect:/login");
		} else {
			model.addAttribute("error","same credential exists on db");
			System.out.println("user register unsuccessful");
			return "register";
		}

	}

	@GetMapping("/login")
	public String getLogin(HttpServletRequest request) {
		request.getSession().invalidate();
		return "login";
	}

	@PostMapping("/login")
	public String login(@RequestParam("uname") String name, @RequestParam("pass") String pass,
			HttpServletRequest request,Model model) {
		if (userDao.loginUser(name, pass)) {
			System.out.println("user login successful");
			request.getSession().setAttribute("name sess", name);
			return ("redirect:/displaytask");
		} else {
			model.addAttribute("error","No matching credential found on db");
			System.out.println("user login unsuccessful");
			return "login";
		}
	}
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {
		request.getSession().invalidate();
		return ("redirect:/login");
	}
}
