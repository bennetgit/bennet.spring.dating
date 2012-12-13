package com.mvc.cron;

import org.apache.log4j.Logger;

public class TestCron {
	private Logger logger = Logger.getLogger(TestCron.class.getName());
	
	public void doBiz() {
		logger.info("------------ Do Cron task ---------- ");
	}
}
