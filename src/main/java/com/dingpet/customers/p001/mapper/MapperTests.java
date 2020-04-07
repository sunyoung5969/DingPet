package com.dingpet.customers.p001.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dingpet.customers.p001.vo.Customers_P001_VO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MapperTests {
	
	private Customers_P001_Mapper mapper;
	
	@Test
	public void testInsert1() {
		
		Customers_P001_VO cust = new Customers_P001_VO();
		
		cust.setMember_id("heoinhye");
		cust.setMember_pwd("123456789");
		cust.setMember_nickname("허이네");
		cust.setMember_email("heoinhye@naver.com");
		log.info(cust);
		mapper.insert1(cust);

	}
	

	

}
