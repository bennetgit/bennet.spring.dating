package com.mvc.cron;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

public class TestCron {
	private Logger logger = Logger.getLogger(TestCron.class.getName());
	
	public void doBiz() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		logger.info("------------ Do Cron task: " + df.format(new Date()) + " ---------- ");
	}
}
