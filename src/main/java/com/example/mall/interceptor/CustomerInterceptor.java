package com.example.mall.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CustomerInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		HttpSession session = request.getSession();
		if(session.getAttribute("loginCustomer") != null) {
			log.debug(request.getRequestURL().toString() + ", Customer session exist");
			response.sendRedirect(request.getContextPath() + "/customer/getGoodsList");
			return false;
		}
		
		return true;
	}
	

}