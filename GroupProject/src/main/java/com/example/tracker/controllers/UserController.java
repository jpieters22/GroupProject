package com.example.tracker.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.tracker.models.LoginUser;
import com.example.tracker.models.User;
import com.example.tracker.services.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;	
	

	
	@GetMapping("/")
	public String index(HttpSession session, Model model) {
		if(session.getAttribute("user_id") != null) {
			return "redirect:/dashboard";
		} else {
			model.addAttribute("newUser", new User());
	        model.addAttribute("newLogin", new LoginUser());
	        	return "index.jsp";
		}
	}
	
	@GetMapping("/register")
	public String register(HttpSession session, Model model) {
		if(session.getAttribute("user_id") != null) {
			return "redirect:/dashboard";
		} else {
			model.addAttribute("newUser", new User());
	        model.addAttribute("newLogin", new LoginUser());
	        	return "register.jsp";
		}
	}
	
	 @PostMapping("/register")
	   public String registerUser(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
	   	userService.register(newUser, result);
	       if(result.hasErrors()) {
	           model.addAttribute("newLogin", new LoginUser());
	           return "register.jsp";
	       }
	       session.setAttribute("user_id", newUser.getId());
	       return "redirect:/dashboard";
	   }
	
	 // Login User Process
	   @PostMapping("/login")
	   public String loginUser(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
	       User user = userService.login(newLogin, result);
	       if(result.hasErrors()) {
	           model.addAttribute("newUser", new User());
	           return "index.jsp";
	       }
	       session.setAttribute("user_id", user.getId());
	       return "redirect:/dashboard";
	   }
	   
	   // Logout User
		@GetMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}

}
