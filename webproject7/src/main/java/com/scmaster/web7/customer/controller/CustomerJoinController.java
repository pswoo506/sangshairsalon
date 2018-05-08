package com.scmaster.web7.customer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import com.scmaster.web7.customer.dao.CustomerDAO;
import com.scmaster.web7.customer.vo.Customer;

@Controller
@RequestMapping(value="customer")
@SessionAttributes("customer") //customer란 모델이란 함수안에 add attribute로 값을 넣는 순간 세션에도 저장이됨.
public class CustomerJoinController {
	
	@Autowired
	CustomerDAO dao;		
	
	@RequestMapping(value="joinForm", method=RequestMethod.GET)	
	public String joinForm(Model model ){
	
		Customer customer = new Customer(); //정보를 저장할 빈객체 생성
		model.addAttribute("customer", customer);
	
		return "customer/joinForm"; //회원가입
	}
	
	@RequestMapping(value="idCheck", method=RequestMethod.GET)
	public String idCheck(Model model ){
		//검색유무 확인하는 데이터를 들구감.
	
		model.addAttribute("search", false); //이 창이 검색을 눌러서 열린것이 아닐경우
	
		return "customer/idCheckForm";
	}
	@RequestMapping(value="idSearch", method=RequestMethod.POST)
	public String idSearch(String searchId, Model model){
	
		Customer customer = dao.searchCustomerOne(searchId);
		model.addAttribute("searchId", searchId);
		model.addAttribute("searchResult", customer);
		model.addAttribute("search", true);
	
		return"customer/idCheckForm";
	}
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(@ModelAttribute("customer") Customer customer, Model model){		
	
		int result = dao.joinCustomer(customer);
		if(result != 1){
			//등록실패
			model.addAttribute("errorMsg","등록실패");
			
			return "customer/joinForm";
		}
	
		return"redirect:/";
	}
		
}
