package com.example.mall;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.mall.interceptor.CustomerInterceptor;
import com.example.mall.interceptor.OffInterceptor;
import com.example.mall.interceptor.StaffInterceptor;


@SpringBootApplication
public class MallApplication {
	@Autowired StaffInterceptor adminInterceptor;
	@Autowired CustomerInterceptor customerInterceptor;
	@Autowired OffInterceptor offInterceptor;
	
	public static void main(String[] args) {
		SpringApplication.run(MallApplication.class, args);
	}

//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		//staffSession
//		registry.addInterceptor(adminInterceptor).addPathPatterns("/member/**").addPathPatterns("/off/**");
//		//customerSession
//		registry.addInterceptor(customerInterceptor).addPathPatterns("/admin/**").addPathPatterns("/off/**");
//		//offSession
//		registry.addInterceptor(offInterceptor).addPathPatterns("/admin/**").addPathPatterns("/member/**");
//		
//		
////		WebMvcConfigurer.addInterceptors(registry);
//	}
	
	

}