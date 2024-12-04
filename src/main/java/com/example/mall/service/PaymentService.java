package com.example.mall.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.CartMapper;
import com.example.mall.mapper.PaymentMapper;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Cart;
import com.example.mall.vo.Customer;
import com.example.mall.vo.Page;
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
			Cart cart = new Cart();
			cart.setCartNo(c);
			checkDeleteCartQuery += cartMapper.deleteCart(cart);
		}
		log.debug(TeamColor.KES + "트랜잭션(cart) 결과로그 : checkDeleteCartQuery" + checkDeleteCartQuery);
				
	}
	
	// # payment 기준 리스트 출력시 사용 (결제번호 리스트 간략 출력)
		// (1) 직원용 : /staff/getPaymentList : 파라미터값(map)에 customerEmail가 없으면 스태프용 PaymentList 출력
	public List<Map<String,Object>> getPaymentList(Page page) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", page.getBeginRow());
		paramMap.put("rowPerPage", page.getRowPerPage());
		
		return paymentMapper.selectPaymentList(paramMap);
	}

		
		// (2) 고객용 : 파라미터값(map)에 customerEmail가 있으면 /customer/getPaymentList 에서 사용
	public List<Map<String,Object>> getPaymentList(Page page, String customerEmail) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", page.getBeginRow());
		paramMap.put("rowPerPage", page.getRowPerPage());
		paramMap.put("customerEmail", customerEmail);
		
		return paymentMapper.selectPaymentList(paramMap);
	}
	
	// # payment 기준 마지막 페이지 구하기
		// (1) 직원용 : 라스트 페이지 넘기기 :  /staff/getPaymentList : 파라미터값(map)에 customerEmail가 없으면 스태프용 라스트페이지 값 반환
	public Integer getlastPageOnPaymentList(Page page) {
		Integer totalNum = paymentMapper.selectTotalRowOnPaymentList(new HashMap<>());
		Integer lastPage = totalNum / page.getRowPerPage();
		if(totalNum % page.getRowPerPage() != 0)  {
			lastPage++;
		}
		
		return lastPage;
	}
		// (2) 고객용 : 라스트 페이지 넘기기 :  /staff/getPaymentList : 파라미터값(map)에 customerEmail가 있으면 직원용 라스트페이지 값 반환
	public Integer getlastPageOnPaymentList(Page page, String customerEmail) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("customerEmail", customerEmail);
		
		Integer totalNum = paymentMapper.selectTotalRowOnPaymentList(paramMap);
		Integer lastPage = totalNum / page.getRowPerPage();
		if(totalNum % page.getRowPerPage() != 0)  {
			lastPage++;
		}
		return lastPage;
	}
	// # getOrdersNoByPaymentNo : 특정 페이먼트 넘어 하나에 딸린 ordersNo들 출력하여 배열로 추출
		// 직원용 + 고객용
	public String[] getOrdersNoByPaymentNo(Integer paymentNo) {
		return paymentMapper.selectOrdersNoByPaymentNo(paymentNo).split(",");
	}

	
	// # selectPayInfoListByPaymentNo : Payment_No 별 Order + goods + category 정보 출력 
		//  직원용 + 고객용 
	public Map<String,Object> getPayInfoListByPaymentNo(Integer ordersNo) {
		return paymentMapper.selectPayInfoListByOrders(ordersNo);
	}
	
	// # payment status 변경
		// (1) 직원용 /staff/modifyPaymentStatus
	public Integer modifyPaymentStatus(Payment payment) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("paymentStatus", payment.getPaymentStatus());
		paramMap.put("paymentNo", payment.getPaymentNo());
		
		return paymentMapper.updatePaymentStatus(paramMap);
	}
		// (2) 고객용 /customer/modifyPaymentStatus 용
	public Integer modifyPaymentStatus(Payment payment, String customerEmail) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("paymentStatus", payment.getPaymentStatus());
		paramMap.put("paymentNo", payment.getPaymentNo());
		paramMap.put("customerEmail", customerEmail);
		
		return paymentMapper.updatePaymentStatus(paramMap);
	}
	
 	

}
