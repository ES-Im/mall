package com.example.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.mall.service.AddressService;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Address;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AddressController {
	
	@Autowired AddressService addressService;
	
	// /customer/getAddressList : 배송지 리스트 
	@GetMapping("/customer/getAddressList")
	public String getAddressList(HttpSession session, Model model) {
		log.debug(TeamColor.KMJ + "[AddressController]");
		log.debug(TeamColor.KMJ + "[GET - getAddressList]");
		
		String customerEmail = (String)session.getAttribute("loginCustomer");
		log.debug(TeamColor.KMJ + "customerEmail" + customerEmail + TeamColor.RESET);
		
		// customer/getCartListByChecked 에서 동일한 service를 이용. 
		List<Address> addressList = addressService.getAddressList(customerEmail);
		log.debug(TeamColor.KMJ + "customerEmail" + addressList.toString() + TeamColor.RESET);
		
		model.addAttribute("addressList", addressList);
		
		return "/customer/getAddressList";
	}
	
	// /customer/addAddress : 배송지 등록
	@PostMapping("/customer/addAddress")
	public String addAddress(@RequestParam String addressDetail, HttpSession session, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.KMJ + "[AddressController]");
		log.debug(TeamColor.KMJ + "[Post - addAddress]");
		
		String customerEmail = (String) session.getAttribute("loginCustomer");
		log.debug(TeamColor.KMJ + "customerEmail : " + customerEmail + TeamColor.RESET);
		log.debug(TeamColor.KMJ + "addressDetail : " + addressDetail + TeamColor.RESET);
		
		
		// 등록된 주소지가 5개 이상이면 등록 불가.
		// 현재 등록된 주소지의 수 확인
		Integer addressCount = addressService.getAddressCount(customerEmail);
		log.debug(TeamColor.KMJ + "addressCount" + addressCount + TeamColor.RESET);
		

			// 배송지 등록 불가
			if(addressCount >= 5) { 
				
				redirectAttributes.addFlashAttribute("addressMsg", "주소는 최대 5개까지 입력 가능합니다.");
				log.debug(TeamColor.KMJ + "주소는 최대 5개까지 입력 가능합니다." + TeamColor.RESET);
	           return "redirect:/customer/getAddressList";	
	        }
			
			// 배송지 등록 가능
			Address address = new Address();
			address.setAddressDetail(addressDetail);
			address.setCustomerEmail(customerEmail);
			
			Integer result = addressService.addAddress(address);
			log.debug(TeamColor.KMJ + "result" + result + TeamColor.RESET);

			return "redirect:/customer/getAddressList";

	}
	

	// /customer/addAddress : 배송지 삭제
	@GetMapping("/customer/removeAddress")
	public String removeAddress(@RequestParam Integer addressNo, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.KMJ + "[AddressController]");
		log.debug(TeamColor.KMJ + "[Get - removeAddress]");
		
		log.debug(TeamColor.KMJ + "addressNo : " + addressNo + TeamColor.RESET);
		
		// 배송지 삭제
		Integer result = addressService.removeAddress(addressNo);
		
		// 삭제 실패
		if(result == 0) {
			redirectAttributes.addFlashAttribute("addressMsg", "삭제에 실패했습니다. 잠시후 시도해주세요.");
			log.debug(TeamColor.KMJ + "삭제에 실패했습니다. 잠시후 시도해주세요." + TeamColor.RESET);
           return "redirect:/customer/getAddressList";	
		}
		
		return "redirect:/customer/getAddressList";
	}
	
	
	
	
	
	
}
