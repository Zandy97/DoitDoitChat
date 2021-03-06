package com.min.edu.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AccessFilter implements Filter{

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		logger.info("==== Filter Init() ====");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		
		String query = req.getQueryString();
		
		String fullUrl = req.getRequestURL().toString() + StringUtils.defaultIfBlank((query != null)?"?"+query:"","");
		logger.info("==== fullUrl : {} ====",fullUrl);
		
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		logger.info("==== Filter Destroy ====");
	}
}
