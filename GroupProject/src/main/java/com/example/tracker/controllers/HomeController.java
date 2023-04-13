package com.example.tracker.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.tracker.models.Job;
import com.example.tracker.services.JobService;
import com.example.tracker.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private JobService jobService;
	
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		} else {
		model.addAttribute("theUser", userService.findUser((Long)session.getAttribute("user_id")));
		
		List<Job> getAll = jobService.allJobs();
		model.addAttribute("getAll", getAll);
		return "dashboard.jsp";
		}
	}
	
	@GetMapping("/addJob")
	public String addJob(HttpSession session, @ModelAttribute("jobForm") Job job,Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		} else {
			model.addAttribute("theUser", userService.findUser((Long)session.getAttribute("user_id")));
			return "addJob.jsp";
		}
	}
	
	@PostMapping("/createJob")
	public String createJob(@Valid @ModelAttribute("jobForm") Job job, BindingResult result,  Model model) {
		if(result.hasErrors()) {
			return "addJob.jsp";
		} else {
			jobService.createJob(job);
			return "redirect:/dashboard";
		}
	}

}
