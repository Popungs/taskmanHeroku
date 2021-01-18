package com.hcl.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.dao.TaskDaoImpl;
import com.hcl.dao.UserDaoImpl;
import com.hcl.exceptions.TaskExceptions;
import com.hcl.model.Task;

@Controller
public class TaskManagerController {
	@Autowired
	private TaskDaoImpl taskDao;
	

	
	@GetMapping("/displaytask")
	public ModelAndView displaytask(HttpServletRequest request) throws TaskExceptions {
		String sessName = (String) request.getSession().getAttribute("name sess");
		System.out.println(sessName);
		if (sessName == null) {	
			Task t = new Task();
			
			List<Task> dumtask = new ArrayList<>();
			dumtask.add(t);
			return new ModelAndView("displaytask","tasklist",dumtask);
			//return ("redirect:/login");
		}
		List<Task> alltask = taskDao.loadTask();
		return new ModelAndView("displaytask","tasklist",alltask);
	}

	@GetMapping("/edittask")
	public ModelAndView taskDetail(HttpServletRequest request,@RequestParam("id") int id) {
		String sessName = (String) request.getSession().getAttribute("name sess");
		if (sessName == null) {	
			Task t = new Task();
			t.setTaskName("this is dummy task you because do not have right to see task");
			ModelAndView mav = new ModelAndView("edittask");
			mav.addObject("task", t);
			return mav;
		}
		Task t = taskDao.findTask(id);
		ModelAndView mav = new ModelAndView("edittask");
		mav.addObject("task", t);
		return mav;
	}
	@PostMapping("/edit")
	public String edittask(HttpServletRequest request, @ModelAttribute("task") Task t) {
		String sessName = (String) request.getSession().getAttribute("name sess");
		if (sessName == null) {	
			return "errorpage";
		}
		taskDao.updateTask(t);
		return ("redirect:/displaytask");
	}
	@GetMapping("/deletetask")
	public ModelAndView deleteTaskPage(HttpServletRequest request,@RequestParam("id") int id) {
		String sessName = (String) request.getSession().getAttribute("name sess");
		if (sessName == null) {	
			Task t = new Task();
			t.setTaskName("this is dummy task you because do not have right to see task");
			ModelAndView mav = new ModelAndView("deletetask");
			mav.addObject("task", t);
			return mav;
		}
		Task t = taskDao.findTask(id);
		ModelAndView mav = new ModelAndView("deletetask");
		mav.addObject("task", t);
		return mav;
	}
	@PostMapping("/delete")
	public String deleteTask(HttpServletRequest request, @RequestParam("id") int id) {
		String sessName = (String) request.getSession().getAttribute("name sess");
		if (sessName == null) {	
			 return "errorpage";
		}

		System.out.println(id);
		taskDao.deleteTask(id);
		return ("redirect:/displaytask");
	}
	
	@GetMapping("/addtask")
	public String addtask(HttpServletRequest request, Model model) {
		String sessName = (String) request.getSession().getAttribute("name sess");
		System.out.println(sessName);
		if (sessName == null) {	
			 return "errorpage";
		}
		return "addtask";
	}

	@PostMapping("/addtask")
	public String addtaskPost(HttpServletRequest request,
			@RequestParam("taskName") String taskName,
			@RequestParam("description") String desc,
			@RequestParam("email") String email,
			@RequestParam("severe") String severe,
			@RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
			@RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) throws TaskExceptions {
		String sessName = (String) request.getSession().getAttribute("name sess");
		System.out.println(sessName);
		if (sessName == null) {	
			return "errorpage";
		}
		taskDao.CreateNewTask(taskName, desc, email, severe, startDate, endDate);
		return ("redirect:/displaytask");
	}
	@GetMapping("/errorpage")
	public String errorpage() {
		return "errorpage";
	}


	
		

	
}
