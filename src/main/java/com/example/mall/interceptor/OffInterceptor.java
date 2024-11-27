package com.example.mall.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
//Author : 김은서
@Slf4j
@Component
public class OffInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		// 세션이 없는 경우 다른 세션고유 URL에 접근시, 로그인 페이지로 이동  
		HttpSession session = request.getSession();
		if(session.getAttribute("loginCustomer") == null && session.getAttribute("loginStaff") == null) {
			log.debug(request.getRequestURL().toString() + ", session doesnt exist, offInterceptor run");
			response.sendRedirect(request.getContextPath() + "/off/login");
			return false;
		}
		return true;
	}
	
}
