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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.example.tracker.models.Job;
import com.example.tracker.models.User;
import com.example.tracker.services.JobService;
import com.example.tracker.services.UserService;

@Controller
public class HomeController {

	@Autowired
	private JobService jobService;
	
	@Autowired
	private UserService userService;
	
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        if(session.getAttribute("user_id") == null) {
            return "redirect:/";
        } else {
        model.addAttribute("theUser", userService.findUser((Long)session.getAttribute("user_id")));

        List<Job> getAll = jobService.allJobs();
        model.addAttribute("getAll", getAll);
        return "home.jsp";
        }
    }
    
    @GetMapping("/addJob")
    public String addJob(HttpSession session, @ModelAttribute("jobForm") Job job, Model model) {
    	if(session.getAttribute("user_id") == null) {
    		return "redirect:/";
    	} else {
    		model.addAttribute("theUser", userService.findUser((Long)session.getAttribute("user_id")));
    		return "addJob.jsp";
    	}
    }
    
    @PostMapping("/createJob")
    public String createSticker(@Valid @ModelAttribute("jobForm") Job job, BindingResult result, Model model, HttpSession session) {
    	if(result.hasErrors()) {
    		model.addAttribute("theUser", userService.findUser((Long)session.getAttribute("user_id")));
    		return "addJob.jsp";
    	} else {
    		jobService.createItem(job);
    		return "redirect:/allJobs";
    	}
    }
    
    @GetMapping("/allJobs")
    public String allJobs(HttpSession session, @ModelAttribute("job") Job job, Model model) {
    	if(session.getAttribute("user_id") == null) {
    		return "redirect:/";
    	} else {
    		model.addAttribute("theUser", userService.findUser((Long)session.getAttribute("user_id")));
    		List<Job> getAll = jobService.allJobs();
    		model.addAttribute("getAll", getAll);
            return "allJobs.jsp";
    	}
    }
    
    @GetMapping("/view/{id}/edit")
    public String editUser(HttpSession session, @PathVariable("id") Long id, @ModelAttribute("theUser")User user, Model model) {
    	if(session.getAttribute("user_id") == null) {
    		return "redirect:/";
    	} else {
    		model.addAttribute("theUser", userService.findUser(id));
    		return "editUser.jsp";
    	}
    }
    
    @PutMapping("/views/{id}")
    public String updateUser(@PathVariable("id") Long id, @Valid @ModelAttribute("theUser")User user, BindingResult result, Model model) {
    	if(result.hasErrors()) {
    		model.addAttribute("theUser", userService.findUser(id));
    		return "editUser.jsp";
    	} else {
    		userService.updateOne(user);
    		return "redirect:/dashboard";
    	}
    }
    
    @GetMapping("/job/{id}/edit")
    public String editJob(HttpSession session, @PathVariable("id") Long id, @ModelAttribute("job")Job job, Model model) {
    	if(session.getAttribute("user_id") == null) {
    		return "redirect:/";
    	} else {
    		model.addAttribute("job", jobService.findJob(id));
    		return "editJob.jsp";
    	}
    }
    
    @PutMapping("/jobs/{id}")
    public String updateJob(@PathVariable("id") Long id, @Valid @ModelAttribute("Job")Job job, BindingResult result, Model model) {
    	if(result.hasErrors()) {
    		model.addAttribute("job", jobService.findJob(id));
    		return "editJob.jsp";
    	} else {
    		jobService.updateJob(job);
    		return "redirect:/dashboard";
    	}
    }
    
}
