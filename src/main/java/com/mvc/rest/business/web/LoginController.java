package com.mvc.rest.business.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.mvc.rest.beans.UserLoginForm;
import com.mvc.rest.business.domain.User;
import com.mvc.rest.business.service.ILoginService;
import com.mvc.rest.business.service.IUserService;

@Controller
@SessionAttributes("login") 
public class LoginController {
	private Logger logger = Logger.getLogger(LoginController.class.getName());
	
	@Autowired
	private ILoginService loginService;
	
	@Autowired
	private IUserService userService;
	
    @ModelAttribute("login")  
    public UserLoginForm initForm() {  
    	logger.info("============ initLoginForm() ===========");  
        return new UserLoginForm();  
    } 
    
    @RequestMapping(value = "/login", method = {RequestMethod.GET})  
    public String login(@ModelAttribute("login") UserLoginForm form) {  
    	logger.info("======== login page ==========="); 
        return "login";  
    } 
    
    @RequestMapping(value = "/login", method = {RequestMethod.POST})  
    public String processLogin(HttpServletRequest request,HttpServletResponse response, @ModelAttribute("login") UserLoginForm form) {  
    	logger.info("======== process login ==========="); 
    	
    	//logger.info("======== " + form.getUsername() + " ==========="); 
    	
    	    	
    	int usr_id = loginService.Login(form);
    	
    	switch(usr_id)
    	{
    		case -1:
    			logger.info("======== 密码不正确==========="); 
    			break;
    		case 0:
    			logger.info("======== 用户不存在   ==========="); 
    			break;
    		default:
    			logger.info("======== 登录成功 ==========="); 
    			User u = userService.getUser(usr_id);
        		request.getSession().setAttribute("loginUserInfo", u);
    			break;    		
    	}
    	
    	return "redirect:home";
    }
}
