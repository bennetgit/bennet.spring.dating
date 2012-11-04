package com.mvc.rest.business.web;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Controller
public class LocaleController {
	
	private Logger logger = Logger.getLogger(UserController.class.getName());
	
	private Locale localeSession;
	
	@RequestMapping(value="/setlocale/{locale}",method=RequestMethod.GET)
	public String setLocale(HttpServletRequest request, HttpServletResponse response, @PathVariable("locale") String locale) {
		logger.info(this.getClass().getSimpleName() + " - setLocale 方法被调用");
		if (locale != null) {
			logger.info(locale);
			localeSession = setLocal(locale);
			request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, localeSession);
		}
		return "/welcome";
	}
	
	private Locale setLocal(String locale) {
		// TODO Auto-generated method stub
		switch (locale) 
		{
			case "en_US" : return new Locale("en","US");
			case "zh_CN" : return new Locale("zh","CN");
			default : return new Locale("en","US");
		}
	}
	
}
