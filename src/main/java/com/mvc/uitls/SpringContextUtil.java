package com.mvc.uitls;

import java.util.Locale;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * 获取Spring上下文及国际化
 * 
 */
public final class SpringContextUtil implements ApplicationContextAware {
	private static ApplicationContext context;

	@SuppressWarnings("static-access")
	public void setApplicationContext(ApplicationContext contex)
			throws BeansException {
		this.context = contex;
	}

	public static ApplicationContext getApplicationContext() {
		return context;
	}

	public static Object getBean(String beanName) {
		return context.getBean(beanName);
	}

	public static Object getBean(String name, Class requiredType)
			throws BeansException {
		return context.getBean(name, requiredType);
	}

	public static String getMessage(String key) {
		return context.getMessage(key, null, Locale.getDefault());
	}

	public static boolean containsBean(String name) {
		return context.containsBean(name);
	}

	public static boolean isSingleton(String name)
			throws NoSuchBeanDefinitionException {
		return context.isSingleton(name);
	}

	public static Class getType(String name)
			throws NoSuchBeanDefinitionException {
		return context.getType(name);
	}

	public static String[] getAliases(String name)
			throws NoSuchBeanDefinitionException {
		return context.getAliases(name);
	}
}