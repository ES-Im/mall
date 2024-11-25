package com.example.mall;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.mall.interceptor.CustomerInterceptor;
import com.example.mall.interceptor.OffInterceptor;
import com.example.mall.interceptor.StaffInterceptor;


@SpringBootApplication
public class MallApplication implements WebMvcConfigurer {
	@Autowired StaffInterceptor staffInterceptor;
	@Autowired CustomerInterceptor customerInterceptor;
	@Autowired OffInterceptor offInterceptor;
	
	public static void main(String[] args) {
		SpringApplication.run(MallApplication.class, args);
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//staffSession registry 설정
		registry.addInterceptor(staffInterceptor).addPathPatterns("/customer/**", "/off/**");
		//customerSession registry 설정
		registry.addInterceptor(customerInterceptor).addPathPatterns("/staff/**", "/off/**");
		//offSession registry 설정
		registry.addInterceptor(offInterceptor).addPathPatterns("/staff/**", "/customer/**");
		
		WebMvcConfigurer.super.addInterceptors(registry);
		
	}
	
}