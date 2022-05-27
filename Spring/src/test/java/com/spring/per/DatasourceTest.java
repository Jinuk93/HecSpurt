package com.spring.per;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.config.RootConfig;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={RootConfig.class})
@Log4j
public class DatasourceTest {
	@Setter(onMethod_ = {@Autowired})
	private DataSource ds;
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testConnection() {
		try(Connection conn = ds.getConnection()){
			log.info(conn);
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}
	
	@Test
	public void testMyBatis() {
		try(SqlSession session = sqlSessionFactory.openSession();
				Connection con = session.getConnection();){
			log.info(session);
			log.info(con);
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}
}
