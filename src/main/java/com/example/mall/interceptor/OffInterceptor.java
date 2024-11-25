package com.example.mall.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class OffInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginCustomer") == null && session.getAttribute("loginStaff") == null) {
			log.debug(request.getRequestURL().toString() + ", session doesnt exist, offInterceptor run");
			response.sendRedirect(request.getContextPath() + "/off/login");
			return false;
		}
		return true;
	}
	
}
