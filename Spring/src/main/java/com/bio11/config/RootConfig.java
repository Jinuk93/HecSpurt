//package com.bio11.config;
//
//import javax.sql.DataSource;
//
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.mybatis.spring.SqlSessionFactoryBean;
//import org.mybatis.spring.annotation.MapperScan;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.ComponentScan;
//import org.springframework.context.annotation.Configuration;
//
//import com.zaxxer.hikari.HikariConfig;
//import com.zaxxer.hikari.HikariDataSource;
//
//@Configuration
//@ComponentScan(basePackages= {"com.bio11.sample"})
//@MapperScan(basePackages = {"com.bio11.mapper"})
//// root-context.xml 역할
//public class RootConfig {
//
//	
//	@Bean //메소드의 실행 결과로 반환된 객체는 스프링 객체로 등록
//	public DataSource dataSource() {
//		HikariConfig hikariConfig = new HikariConfig();
//		
////		hikariConfig.setDriverClassName("oracle.jdbc.driver.OracleDriver");
////		hikariConfig.setJdbcUrl("jdbc:oracle:thin:@211.204.195.197:11521:direadb");
//		
//		hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
//		hikariConfig.setJdbcUrl("jdbc:log4jdbc:oracle:thin:@211.204.195.197:11521:direadb");
//		
//		hikariConfig.setUsername("scott");
//		hikariConfig.setPassword("tiger");
//		HikariDataSource dataSource =  new HikariDataSource(hikariConfig);
//		
//		return dataSource;
//	}
//	
//	
//	@Bean
//	public SqlSessionFactory sqlSessionFactory() throws Exception {
//		SqlSessionFactoryBean sqlSessionFactory  = new SqlSessionFactoryBean();
//		sqlSessionFactory.setDataSource(dataSource());
//		return (SqlSessionFactory)sqlSessionFactory.getObject();
//	}
//	
//}


package com.bio11.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@ComponentScan(basePackages= {"com.bio11.sample", "com.bio11.controller", "com.bio11.service"})
@MapperScan(basePackages={"com.bio11.mapper"})
public class RootConfig {
	
	@Bean//메소드의 실행 결과로 반환된 객체는 스프일 객체로 등록
	public DataSource dataSource() {
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		hikariConfig.setJdbcUrl("jdbc:log4jdbc:oracle:thin:@localhost:1521:XE");
		hikariConfig.setUsername("scott");
		hikariConfig.setPassword("tiger");
		HikariDataSource dataSource = new HikariDataSource(hikariConfig);
		return dataSource;
	}
	
	@Bean //SQL Session 관련 설정
	public SqlSessionFactory sqlSessionFactory() throws Exception{
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(dataSource());
		return (SqlSessionFactory)sqlSessionFactory.getObject();
	}
	
}
