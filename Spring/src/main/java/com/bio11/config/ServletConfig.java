package com.bio11.config;

import java.io.IOException;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.FileSystemResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;


@EnableWebMvc
@ComponentScan(basePackages= {"com.bio11.controller"})
// servlet-context.xml 역할
@ComponentScan(basePackages= {"com.bio11.*"})
public class ServletConfig implements WebMvcConfigurer {
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		registry.viewResolver(bean);
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**")
				.addResourceLocations("/resources/");
		
	}
	
	@Bean(name="multipartResolver")
	public CommonsMultipartResolver getResolver() throws IOException{
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setMaxUploadSize(1024*1024*10);
		resolver.setMaxUploadSizePerFile(1024*1024*2);
		resolver.setMaxInMemorySize(1024*1024);
		resolver.setUploadTempDir(new FileSystemResource("e:/upload"));
		resolver.setDefaultEncoding("UTF-8");
		return resolver;
	}
	

}
