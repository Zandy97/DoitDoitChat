package com.min.edu.unitTest;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//@RunWith(SpringJUnit4ClassRunner.class)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/*.xml" })
public class Dummy {

	@Test
	public void test() {
		for(int i = 0; i < 50; i++) {
			String room = "{\"0\":\"0\"";
			int much = (int) ((Math.random() * 6) + 2);
			int per = (int) (Math.random() * 12 + 1);
			for(int j = 0; j < much; j++) {
				
			}
		}
	}
	
}
