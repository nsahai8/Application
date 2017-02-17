package ai.niki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ai.niki.model.User;
import ai.niki.service.AppService;

@Controller
public class AppController {
	
	@Autowired
	private AppService appService;
	
	@RequestMapping("/")
	public ModelAndView welcomePage() {
		System.out.println("in index hit ");
		return new ModelAndView("welcome");
	}
	
	@RequestMapping("/welcome")
	public ModelAndView helloWorld() {
 
		System.out.println("hi");
		String message = "<br><div style='text-align:center;'>"
				+ "<h3>********** Hello World, Spring MVC Tutorial</h3>This message is coming from CrunchifyHelloWorld.java **********</div><br><br>";
		return new ModelAndView("welcome1", "message", message);
	}
	@RequestMapping("/createUser")
	public ModelAndView createUser() {
		User user = new User();
		user.setEmailId("123@gmail.com");
		user.setName("123");
		appService.save(user);
		System.out.println("done");
		return new ModelAndView("welcome1", "message","hi");
	}
	
	@RequestMapping("/getAllContacts")
	public ModelAndView getAllContacts() {
		List<User> allUsers = appService.getAllUsers();
		for(User user :allUsers){
			System.out.println(user.getEmailId());
		}
		return new ModelAndView("welcome1", "message","hi");
	}
	
}
