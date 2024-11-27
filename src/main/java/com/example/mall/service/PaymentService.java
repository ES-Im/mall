package com.example.mall.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.CartMapper;
import com.example.mall.mapper.PaymentMapper;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Payment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;
	@Autowired CartMapper cartMapper;
	
	// Author : 김은서 
	// customer/addPayment에서 사용 : 1)Payment 인스턴스 추가 2)Orders 인스턴스 추가 트랜잭션 처리 3)Cart 테이블에서에서 해당 인스턴스들 삭제
	public void addPayment(Payment payment, Integer[] cartNo) {
		int checkAddPaymentQuery = 0;
		int checkAddOrdersQuery = 0;
		int checkDeleteCartQuery = 0;
		
		Integer paymentNo = paymentMapper.insertPayment(payment);

		if(paymentNo != null) {
			
			for(Integer c : cartNo) {
				Map<String, Integer> target = new HashMap<>();
				target.put("paymentNo", paymentNo);
				target.put("cartNo", c);
				checkAddPaymentQuery += paymentMapper.insertOrders(target);
			}
			
			log.debug(TeamColor.KES + "트랜잭션 실패테스트 결과로그 : checkAddPaymentQuery" + checkAddPaymentQuery );
			if(checkAddPaymentQuery != cartNo.length) {
				
				for(Integer c : cartNo) {
					checkAddOrdersQuery += cartMapper.deleteCart(c);
				}
				
				if(checkAddOrdersQuery == 0) {
					throw new RuntimeException("Cart delete문 쿼리 실행 실패");
				}
				
				log.debug(TeamColor.KES + "트랜잭션 실패테스트 결과로그 : checkAddOrdersQuery " + checkAddOrdersQuery);
			} else {
				throw new RuntimeException("orders insert문 생성 실패");
			}
			
		} else {
			throw new RuntimeException("payment insert문 쿼리 실패");
		}
		
		log.debug(TeamColor.KES + "트랜잭션 실패테스트 결과로그 : checkDeleteCartQuery" + checkDeleteCartQuery);
		
	}
	

}
