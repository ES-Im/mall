package com.example.mall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.CartMapper;
import com.example.mall.mapper.PaymentMapper;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Customer;
import com.example.mall.vo.Payment;

import lombok.extern.slf4j.Slf4j;

//Author : 김은서 
@Slf4j
@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;
	@Autowired CartMapper cartMapper;
	
	// customer/addPayment에서 사용 : 1)Payment 인스턴스 추가 2)Orders 인스턴스 추가 트랜잭션 처리 3)Cart 테이블에서에서 해당 인스턴스들 삭제
	public void addPayment(Payment payment, Integer[] cartNo) {
		// 디버깅용 변수
		int checkAddPaymentQuery = 0;
		int checkAddOrdersQuery = 0;
		int checkDeleteCartQuery = 0;

		// (1) payment insert
		checkAddPaymentQuery = paymentMapper.insertPayment(payment);
		Integer paymentNo = payment.getPaymentNo();
		log.debug(TeamColor.KES + "트랜잭션(payment) 결과로그 : checkAddPaymentQuery : " + checkAddPaymentQuery + " / payment_no : " + paymentNo);
		
		// (2) orders insert
		for(Integer c : cartNo) {
			Map<String, Integer> target = new HashMap<>();
			target.put("paymentNo", paymentNo);
			target.put("cartNo", c);
			checkAddOrdersQuery += paymentMapper.insertOrders(target);
		}
		log.debug(TeamColor.KES + "트랜잭션(orders) 결과로그 : checkAddOrdersQuery " + checkAddOrdersQuery);
		
		// (3) cart delete
		for(Integer c : cartNo) {
			checkDeleteCartQuery += cartMapper.deleteCart(c);
		}
		log.debug(TeamColor.KES + "트랜잭션(cart) 결과로그 : checkDeleteCartQuery" + checkDeleteCartQuery);
				
	}
	
	// payment 기준 리스트 출력시 사용 (결제번호 리스트 간략 출력)
	// 파라미터값(Customer)에 customerEmail가 있으면 /customer/getPaymentList 에서 사용
	public List<Payment> getPaymentList(String customerEmail) {
		Customer customer = new Customer(); 
		customer.setCustomerEmail(customerEmail);
		
		return paymentMapper.paymentList(customer);
	}
	// 파라미터값(Customer)에 customerEmail가 없으면 /staff/getPaymentListByStaff 에서 사용
	public List<Payment> getPaymentList() {
		return paymentMapper.paymentList(new Customer());
	}
 	

}
