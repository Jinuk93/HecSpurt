package com.bio11.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
		}
	}
	
	@Test
	public void testConnection() {
		try (Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@211.204.195.197:11521:direadb",
				"scott",
				"tiger")){
			log.info(conn);
		} catch (Exception e) {
		}
	}
	
}
