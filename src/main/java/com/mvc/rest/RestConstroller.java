package com.mvc.rest;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse; 

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;  
import org.springframework.web.bind.annotation.PathVariable;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;  
import org.springframework.web.servlet.ModelAndView;

//@Controller
@RequestMapping("/test")
public class RestConstroller {
    public RestConstroller() {}  
    private Logger logger = Logger.getLogger(RestConstroller.class.getName());
    
    @Autowired
    private HelloImpl helloApi;
    
    @Autowired
    private UserBean userBean;
    
    @RequestMapping(value = "/login/{user}", method = RequestMethod.GET)  
    public ModelAndView myMethod(HttpServletRequest request,HttpServletResponse response,   
            @PathVariable("user") String user, ModelMap modelMap) throws Exception {   
    	logger.info("Entering contorller.");
    	modelMap.put("userBean", userBean);
        modelMap.put("loginUser", user);  
        modelMap.put("loginUserId", "abc"); 
        modelMap.put("loginUserSay", helloApi.getHello()); 
        
        return new ModelAndView("/login/hello", modelMap);  
    }  
    @RequestMapping(value = "/welcome", method = RequestMethod.GET)  
    public String registPost() {  
        return "/welcome";  
    }  

	/**
	 * 
	 * 无参数返回的是根据 prefix前缀+@RequestMapping value +suffix后缀组成
	 * 
	 * 
	 **/

	@RequestMapping("/novoid")
	public void novoid() {
		logger.info(this.getClass().getSimpleName() + "novoid方法被调用");
	}

	/**
	 * 
	 * 根据String字符串返回对应的地址 prefix前缀+返回值+suffix后缀组成
	 * 
	 * */

	@RequestMapping("/string")
	public String string() {

		logger.info("String 方法调用");

		return "/success";

	}

	/**
	 * 
	 * spring2.5的方法,返回一个ModelAndView 对象,通过setViewName方法跳转到指定的页面 调用addObject
	 * 
	 * 相当于调用request.setAttribute方法
	 * 
	 * */

	@RequestMapping("/modelview")
	public ModelAndView view(Model model) {

		logger.info("view 方法调用");

		ModelAndView andView = new ModelAndView();

		andView.setViewName("/success");

		return andView;

	}
	
	/**
	 * 
	 * @see 使用map作为返回值的时候 是以prefix前缀+requestMapping的value+suffix后缀组成 返回一个map
	 * 
	 *      ,map的put方法调用相当于request.setAttribute方法
	 * 
	 * */

	@RequestMapping("/mapa")
	public Map<String, Object> mapa(ModelMap map1) {
		logger.info("Map 方法调用");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hello", "world key");
		map.put("user", userBean);

		return map;

	}

}
