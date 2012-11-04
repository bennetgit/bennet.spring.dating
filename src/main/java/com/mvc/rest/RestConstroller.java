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
	 * �޲������ص��Ǹ��� prefixǰ׺+@RequestMapping value +suffix��׺���
	 * 
	 * 
	 **/

	@RequestMapping("/novoid")
	public void novoid() {
		logger.info(this.getClass().getSimpleName() + "novoid����������");
	}

	/**
	 * 
	 * ����String�ַ������ض�Ӧ�ĵ�ַ prefixǰ׺+����ֵ+suffix��׺���
	 * 
	 * */

	@RequestMapping("/string")
	public String string() {

		logger.info("String ��������");

		return "/success";

	}

	/**
	 * 
	 * spring2.5�ķ���,����һ��ModelAndView ����,ͨ��setViewName������ת��ָ����ҳ�� ����addObject
	 * 
	 * �൱�ڵ���request.setAttribute����
	 * 
	 * */

	@RequestMapping("/modelview")
	public ModelAndView view(Model model) {

		logger.info("view ��������");

		ModelAndView andView = new ModelAndView();

		andView.setViewName("/success");

		return andView;

	}
	
	/**
	 * 
	 * @see ʹ��map��Ϊ����ֵ��ʱ�� ����prefixǰ׺+requestMapping��value+suffix��׺��� ����һ��map
	 * 
	 *      ,map��put���������൱��request.setAttribute����
	 * 
	 * */

	@RequestMapping("/mapa")
	public Map<String, Object> mapa(ModelMap map1) {
		logger.info("Map ��������");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hello", "world key");
		map.put("user", userBean);

		return map;

	}

}
