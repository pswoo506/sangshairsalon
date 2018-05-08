package com.scmaster.web7.reserve.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.scmaster.web7.customer.vo.Customer;
import com.scmaster.web7.reserve.vo.Reserve;


public interface ReserveMapper {
	
	public int reservation (Reserve register); //예약입력	
	public ArrayList<Reserve> selectOne(String id); //예약정보확인
	
	
	
}
