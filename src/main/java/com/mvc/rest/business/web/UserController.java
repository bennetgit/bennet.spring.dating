package com.mvc.rest.business.web;


import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.mvc.rest.beans.Ethnicity;
import com.mvc.rest.beans.Relationship;
import com.mvc.rest.business.domain.User;
import com.mvc.rest.business.service.IUserService;

@Controller
public class UserController {
	
	private Logger logger = Logger.getLogger(UserController.class.getName());
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private Ethnicity ethnicity;	
	
	@Autowired
	private Relationship relationship;	
	
    // Master Data  
    @ModelAttribute("t_relationship")  
    public HashMap<Integer, String> relationship() {  
    	return (HashMap<Integer, String>) relationship.getItems(); 
    }
    
    @ModelAttribute("t_ethnicity")  
    public HashMap<Integer, String> ethnicity() {  
        return (HashMap<Integer, String>) ethnicity.getItems();  
    }
	
	@RequestMapping(value="/user/{id}",method=RequestMethod.GET)	
	public ModelAndView getUser(HttpServletRequest request,HttpServletResponse response,   
            @PathVariable("id") int id, ModelMap modelMap) throws Exception {   
		logger.info("------------ getUser ---------- ");

		
		modelMap.put("user", userService.getUser(id));
		ModelAndView andView = new ModelAndView();

		andView.setViewName("/user");

		return andView;
	}

	@RequestMapping("/userlist")
	public List<User> getUserList(HttpServletRequest request,HttpServletResponse response) {

		logger.info("getuserList 方法调用");
		
		List<User> list = userService.getUsers();
        for( User u : list){ 
        	logger.info(u.getUsername());
        } 
        return list;
	}

	/*
	@RequestMapping("/userlist")
	public List<UserInfo> getUserList(HttpServletRequest request,HttpServletResponse response) {

		logger.info("getuserList ��������");
		
		List<User> list = userService.getUsers();
        for( User u : list){ 
        	logger.info(u.getUsername());
        } 
        List<UserInfo> list2 = new ArrayList<UserInfo>();
        for( User u : list){ 
        	list2.add(new UserInfo(u));
        } 
        return list2;
	}
	*/
	
	@RequestMapping(value="/adduser",method=RequestMethod.GET)
	public String add(User user){
		logger.info("------------ add ---------- ");
		return "/adduser";
	}		
	
	@RequestMapping(value="/adduser",method=RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user){
		logger.info("------------ addUser ---------- " + user.getUsername() + "------" + user.getPassword());
		userService.saveUser(user);
		return "forward:userlist";
	}	
	
	@RequestMapping("/photo")
	public String addUser(){
		logger.info("------------ upload photo ---------- ");
		return "photoupload";
	}
}
