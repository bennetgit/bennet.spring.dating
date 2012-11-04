package com.mvc.rest.business.web;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.mvc.rest.beans.WebConfig;
import com.mvc.uitls.SpringContextUtil;

@Controller
public class IndexController {
	private Logger logger = Logger.getLogger(IndexController.class.getName());
	
	@RequestMapping(value="/",method=RequestMethod.GET)	
	public String default_() { 
		logger.info("------------ redirect to index page ---------- ");
		return "redirect:index";
	}
	
	@RequestMapping(value="/index",method=RequestMethod.GET)	
	public String index() { 
		logger.info("------------ index page ---------- ");
		WebConfig webConfig = (WebConfig) SpringContextUtil.getBean("webConfig");
		logger.info("------------ imageUploadPath: " + webConfig.getParams().get("imageUploadPath") + " ----------");
		logger.info("------------ imageRoot: " + webConfig.getParams().get("imageRoot") + " ----------");
		return "/index";
	}
}
