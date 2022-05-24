package com.min.edu.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DaoLoggerAop {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void before(JoinPoint j) {
		logger.info("메소드 실행 전 입니다");
		
		Object[] obsj = j.getArgs();
		if(obsj != null) {
			for (int i = 0; i < obsj.length; i++) {
				logger.info( (i+1) + "번 째 Argument : " + obsj[i]);
			}
		}
	}
	
	public void afterThrowing(JoinPoint j, Exception e) {
		logger.info("오류 발생 메소드 : " + j.getSignature().getName());
		logger.info("오류 메시지 : " + e.getMessage());
	}
}
