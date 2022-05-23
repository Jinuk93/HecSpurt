package com.bio11.config;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
@Log4j
public class DataSourceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private DataSource ds;
	
	@Setter(onMethod_ = {@Autowired})
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testConnection() {
		try (Connection conn = ds.getConnection()) {
			log.info(conn);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	@Test
	public void testMyBatis() {
		try (SqlSession session = sqlSessionFactory.openSession();
				Connection con = session.getConnection();) {
			
			log.info(session);
			log.info(con);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}
