package com.scmaster.web7.customer.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.scmaster.web7.customer.dao.CustomerDAO;
import com.scmaster.web7.customer.vo.Customer;

@Controller
public class CustomerLoginController {

	@Autowired
	CustomerDAO dao;		
		
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Customer customer, Model model, HttpSession session){
		Customer mfind = dao.searchCustomerOne(customer.getId());
		if(mfind == null){
			model.addAttribute("error","잘못된 비밀번호입니다. 다시 확인 해주세요");
			return "home";
		}
		else{
			session.setAttribute("loginId", mfind.getId());
			session.setAttribute("loginName", mfind.getName());
			session.setAttribute("phoneNum", mfind.getPhonenum() );
		}
		return "home";		
	}
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
}

