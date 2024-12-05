package com.example.mall.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mall.service.StatisticalService;
import com.example.mall.util.TeamColor;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class StatisticalController {
	
	@Autowired StatisticalService statisticalService;
	
	@GetMapping("/staff/statistical") // intercepter'/staff'
	public String getStatistical(@RequestParam(defaultValue = "2024") Integer salesYear, Model model) {
		
		// 매출	
		Map<String, Object> getDailySales = statisticalService.getDailySales();
		model.addAttribute("getDailySales", getDailySales);
		log.debug(TeamColor.KDH + "getDailySales : " + getDailySales.toString() + TeamColor.RESET); //
		
		
		// 성비
        List<Map<String, Object>> list = statisticalService.getGenderRatio();
		Map<String, Object> maleMap = list.get(0);		
		Map<String, Object> femaleMap = list.get(1);
		
		log.debug(TeamColor.KDH + "male : " + maleMap.toString() + TeamColor.RESET); //
		log.debug(TeamColor.KDH + "female : " + femaleMap.toString() + TeamColor.RESET); //
		
		
		// 이번달 매출
		Map<String, Object> monthlySales = statisticalService.getMonthlySales();
		log.debug(TeamColor.KDH + "monthlySales : " + monthlySales.toString() + TeamColor.RESET); //
		
		model.addAttribute("monthlySales", monthlySales);
		
		// 당해 월별 매출 그래프
		List<Map<String, Object>> monthSalesList =   statisticalService.getMonthSalesByYear(salesYear);
		log.debug(TeamColor.KDH + "monthSalesList : " + monthSalesList.toString() + TeamColor.RESET);
		
		Map<String, Object> twelveSales = monthSalesList.get(11);
		model.addAttribute("year",Integer.parseInt(String.valueOf(monthSalesList.get(11).get("todayYear"))) );
		log.debug(TeamColor.KDH + "monthSalesList12 : " + twelveSales.toString() + TeamColor.RESET);
		
		
		// 베스트 셀러
		List<Map<String, Object>> bestSeller = statisticalService.getBestSeller();
		model.addAttribute("bestSeller", bestSeller);
		log.debug(TeamColor.KDH + "bestSeller : " + bestSeller.toString() + TeamColor.RESET);
		
		// 당일 상품 주문량
		Map<String, Object> dailyGoodsCount = statisticalService.getDailySalesGoodsCount();
		model.addAttribute("dailyGoodsCount", dailyGoodsCount);
		log.debug(TeamColor.KDH + "goodsCount : " + dailyGoodsCount.toString() + TeamColor.RESET);
		
		
		
		
		return "staff/statistical"; // view로 이동 
	}
	
	// 가입자 성비 데이터 JSON으로 변환하기
	@GetMapping("/getGenderRation")
	@ResponseBody
    public Map<String, Object> getGenderRation() {

        List<Map<String, Object>> list =   statisticalService.getGenderRatio();
		Map<String, Object> maleMap = list.get(0);		
		Map<String, Object> femaleMap = list.get(1);		

        Map<String, Object> data = new HashMap<>();
        data.put("male", maleMap.get("genderPer"));
        data.put("female", femaleMap.get("genderPer"));
        
        return data;  // JSON으로 자동 변환
    }
	
	
	// 
	@GetMapping("/getMonthSalesByYear")
	@ResponseBody
    public Map<String, Object> getMonthSalesByYear(@RequestParam(defaultValue = "2024") Integer salesYear) {

        List<Map<String, Object>> monthSalesList =   statisticalService.getMonthSalesByYear(salesYear);
		Map<String, Object> oneSales = monthSalesList.get(0);		
		Map<String, Object> twoSales = monthSalesList.get(1);
		Map<String, Object> threeSales = monthSalesList.get(2);
		Map<String, Object> fourSales = monthSalesList.get(3);
		Map<String, Object> fiveSales = monthSalesList.get(4);
		Map<String, Object> sixSales = monthSalesList.get(5);
		Map<String, Object> sevenSales = monthSalesList.get(6);
		Map<String, Object> eightSales = monthSalesList.get(7);
		Map<String, Object> nineSales = monthSalesList.get(8);
		Map<String, Object> tenSales = monthSalesList.get(9);		
		Map<String, Object> elevenSales = monthSalesList.get(10);
		Map<String, Object> twelveSales = monthSalesList.get(11);

        Map<String, Object> data = new HashMap<>();
        data.put("Jan", oneSales.get("monthSales"));
        data.put("Feb", twoSales.get("monthSales"));
		data.put("Mar", threeSales.get("monthSales"));
		data.put("Apr", fourSales.get("monthSales"));
		data.put("May", fiveSales.get("monthSales"));
		data.put("Jun", sixSales.get("monthSales"));
		data.put("Jul", sevenSales.get("monthSales"));
		data.put("Aug", eightSales.get("monthSales"));
		data.put("Sep", nineSales.get("monthSales"));
		data.put("Oct", tenSales.get("monthSales"));
		data.put("Nov", elevenSales.get("monthSales"));
		data.put("Dec", twelveSales.get("monthSales"));

        
        return data;  // JSON으로 자동 변환
    }
}
