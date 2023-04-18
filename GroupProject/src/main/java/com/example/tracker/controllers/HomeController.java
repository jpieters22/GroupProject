package com.example.tracker.controllers;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.tracker.models.Job;
import com.example.tracker.models.User;
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
	public String createJob(@Valid @ModelAttribute("jobForm") Job job, BindingResult result,  HttpSession session, Model model) {
		if(result.hasErrors()) {
			return "addJob.jsp";
		} else {
			model.addAttribute("theUser", userService.findUser((Long)session.getAttribute("user_id")));
			jobService.createJob(job);
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/allJobs")
    public String allJobs(HttpSession session, Model model) {
        if(session.getAttribute("user_id") == null) {
            return "redirect:/";
        } else {
        	model.addAttribute("theUser", userService.findUser((Long)session.getAttribute("user_id")));
            return "allJobs.jsp";
        }
    }

	@GetMapping("/view/{id}/edit")
	public String editPerson(HttpSession session, @PathVariable("id") Long id, @ModelAttribute("person") User person, Model model) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		} else {
			
			model.addAttribute("person", userService.findUser(id));
			return "editUser.jsp";
		}
	}

	@PutMapping("/views/{id}")
	public String updatePerson(HttpSession session, @PathVariable("id") Long id, @Valid @ModelAttribute("person") User person,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "editUser.jsp";
		} else {
			
			userService.updateOne(person);
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/job/{id}")
	public String viewJob(HttpSession session, @PathVariable("id") Long id,
			Model model) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		} else {
			model.addAttribute("theUser", userService.findUser((Long)session.getAttribute("user_id")));
			Job oneJob = jobService.findJob(id);
			model.addAttribute("oneJob", oneJob);
			return "viewJob.jsp";
		}
	}
	
	@GetMapping("/job/{id}/edit")
	public String editJob(HttpSession session, @PathVariable("id") Long id, Model model) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		} else {
			
			Job oneJob = jobService.findJob(id);
			model.addAttribute("oneJob", oneJob);
			return "editJob.jsp";
		}
	}

	@PutMapping("/job/{id}")
	public String updateJob(@Valid @ModelAttribute("oneJob") Job oneJob,
			BindingResult result, Model model, @PathVariable("id") Long id, HttpSession session) {
		if (result.hasErrors()) {
			return "editJob.jsp";
		} else {
			model.addAttribute("theUser", userService.findUser((Long)session.getAttribute("user_id")));
			jobService.updateJob(oneJob);
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/search")
	public String searchJobs(@RequestParam("query") String query, Model model, HttpSession session) {
		model.addAttribute("theUser", userService.findUser((Long)session.getAttribute("user_id")));
		List<Job> jobs = jobService.searchJobs(query);
		model.addAttribute("jobs", jobs);
		return "allJobs.jsp";
	}
	
	@GetMapping("/delete/{id}")
	public String destroy(@PathVariable("id") Long id) {
		jobService.deleteJob(id);
		return "redirect:/allJobs";
	}
	
	@GetMapping("/get-data")
    public ResponseEntity<Map<String, Integer>> getPieChart() {
        Map<String, Integer> graphData = new TreeMap<>();
        graphData.put("Declined", 7);
        graphData.put("Pending", 6);
        graphData.put("Interview", 9);
        graphData.put("Total", 22);
        return new ResponseEntity<>(graphData, HttpStatus.OK);
    }

}
