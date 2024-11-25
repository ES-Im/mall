package com.example.mall.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class StaffInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		HttpSession session = request.getSession();
		
		// 직원 세션이 
		if(session.getAttribute("loginStaff") != null) {
			log.debug(request.getRequestURL().toString() + ", Staff session exist");
			response.sendRedirect(request.getContextPath() + "/staff/getGoodsList");
			return false;
		}
		
		return true;
	}
	

}

