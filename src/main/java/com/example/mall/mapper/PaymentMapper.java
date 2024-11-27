package com.example.mall.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Orders;
import com.example.mall.vo.Payment;

@Mapper
public interface PaymentMapper {
	
	// Author : 김은서
	// /customer/addPayment 에서 사용 AutoIncreasement 인 PaymentNo 반환 
	Integer insertPayment(Payment payment);
	
	// Author : 김은서
	// /customer/addPayment 에서 사용, insertPayment 반환값(PaymentNo) 대상으로 orders 인스턴스 생성 / 파라미터 : cartNo, paymentNo
	Integer insertOrders(Map<String, Integer> orders);
}
