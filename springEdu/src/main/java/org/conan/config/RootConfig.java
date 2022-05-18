package org.conan.config;

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
@ComponentScan(basePackages = {"org.conan.sample"})
@MapperScan(basePackages = {"org.conan.mapper"})
public class RootConfig {
   
   @Bean // 메소드의 실행 결과로 반환된 객체는 스프링 객체로 등록
   public DataSource dataSource() {
      HikariConfig hikariConfig = new HikariConfig();
      hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
      hikariConfig.setJdbcUrl("jdbc:log4jdbc:oracle:thin:@localhost:1521:XE");
      hikariConfig.setUsername("scott");
      hikariConfig.setPassword("tiger");
      HikariDataSource dataSource = new HikariDataSource(hikariConfig);
      return dataSource;
   }
   
   @Bean
   public SqlSessionFactory sqlSessionFactory() throws Exception{
      SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
      sqlSessionFactory.setDataSource(dataSource());
      return (SqlSessionFactory)sqlSessionFactory.getObject();
   }
}