package com.mvc.uitls;

import java.io.*;
import java.util.Properties;

import org.apache.log4j.Logger;

import com.mvc.interceptor.CommonInterceptor;

public class PropertyUtils {

	public static Properties get(String path) {
		Properties pro = new Properties(); 
		try {
			// 这是文件流，我一直怕的操作，不过，以后就多点面对它，认真看了，就应该不会难的
			FileInputStream in = new FileInputStream(path
					+ "/conf/webconfig.properties");
			pro.load(in);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return pro;
	}
}
