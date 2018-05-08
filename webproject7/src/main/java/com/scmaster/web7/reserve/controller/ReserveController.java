package com.scmaster.web7.reserve.controller;


import java.util.ArrayList;
import java.util.HashMap;


import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.scmaster.web7.reserve.dao.ReserveDAO;
import com.scmaster.web7.reserve.vo.Reserve;
import com.scmaster.web7.common.util.PageNavigator;
import com.scmaster.web7.customer.vo.Customer;

@Controller
@RequestMapping(value="reserve")
@SessionAttributes("reserve")
public class ReserveController {

	@Autowired
	ReserveDAO dao;	
	
	
	//예약폼 이동
	@RequestMapping(value="reserveForm", method = RequestMethod.GET)
	public String reserveForm(Model model){
		Reserve reserve = new Reserve();
		model.addAttribute("reserve", reserve);
		return "reserve/reserveForm";
	}
	
	//예약하기
	@RequestMapping(value="reserve", method=RequestMethod.POST)
	public String reserve(@ModelAttribute("reserve") Reserve reserve, Model model,HttpSession session){		
		String id = (String)session.getAttribute("loginId");
		reserve.setId(id);
		int result = dao.reservation(reserve);
		if(result != 1){
			//예약실패
			model.addAttribute("errorMsg","예약실패");
			
			return "reserve/reserveForm";
		}
	
		return "redirect:/";
	}		
	
	@RequestMapping(value="reserveConfirm", method = RequestMethod.GET)
	public String confirm(HttpSession session, Model model){
		String id = (String)session.getAttribute("loginId");
		ArrayList<Reserve> list = dao.selectOne(id);
		model.addAttribute("reserveList", list);
		return "reserve/reserveConfirm";
	}
}
