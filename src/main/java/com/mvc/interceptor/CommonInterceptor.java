package com.mvc.interceptor;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.mvc.rest.business.web.UserController;

public class CommonInterceptor implements HandlerInterceptor {

	private Logger logger = Logger.getLogger(CommonInterceptor.class.getName());
	
    public CommonInterceptor() {  
        // TODO Auto-generated constructor stub  
    }
	
	private String mappingURL;// 利用正则映射到需要拦截的路径

	public void setMappingURL(String mappingURL) {
		this.mappingURL = mappingURL;
	}
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		logger.info("==============执行顺序: 3、afterCompletion================");  
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		logger.info("==============执行顺序: 2、postHandle================"); 
	}

	
    /** 
     * 在业务处理器处理请求之前被调用 
     * 如果返回false 
     *     从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链 
     *  
     * 如果返回true 
     *    执行下一个拦截器,直到所有的拦截器都执行完毕 
     *    再执行被拦截的Controller 
     *    然后进入拦截器链, 
     *    从最后一个拦截器往回执行所有的postHandle() 
     *    接着再从最后一个拦截器往回执行所有的afterCompletion() 
     */  
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		// TODO Auto-generated method stub
		logger.info("==============执行顺序: 1、preHandle================");  
		if (request.getParameter("locale") != null) {
			setLocale(request);
		}
		return true;
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
	
	public void setLocale(HttpServletRequest request) {
		logger.info(this.getClass().getSimpleName() + " - setLocale 方法被调用");
		String locale = request.getParameter("locale");
		logger.info("设置locale: " + locale);
		Locale localeSession = setLocal(locale);
		request.getSession().setAttribute(
				SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,
				localeSession);
	}

}
