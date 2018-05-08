package com.scmaster.web7.customer.controller;

import javax.servlet.http.HttpSession;

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
@SessionAttributes("customer")
public class CustomerUpdateController {
	
	@Autowired
	CustomerDAO dao;
	
	@RequestMapping(value="updateForm", method = RequestMethod.GET)
	public String updateForm(HttpSession session, Model model){
		String loginId = (String)session.getAttribute("loginId");
		
		Customer customer = dao.searchCustomerOne(loginId);
		model.addAttribute("customer", customer);
		
		return "customer/updateForm";
	}
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(
			@ModelAttribute("customer") Customer customer,
			Model model, HttpSession session){	
		
		int result = dao.updateCustomer(customer);
		
		if(result != 1){
			model.addAttribute("errorMsg", "수정 실패");
			return "customer/updateForm";
		}
		
		return "redirect:updateComplete";
	}
	
	@RequestMapping(value="updateComplete", method = RequestMethod.GET)
	public String updateComplete(SessionStatus status,
			Model model,
			@ModelAttribute("customer") Customer customer,
			HttpSession session){
		
		session.setAttribute("loginName", customer.getName());
		model.addAttribute("id", customer.getId());
		status.setComplete();
		
		return "customer/updateComplete";
	}
	
}
