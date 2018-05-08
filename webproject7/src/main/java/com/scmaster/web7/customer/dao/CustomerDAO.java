package com.scmaster.web7.customer.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.web7.customer.vo.Customer;

@Repository
public class CustomerDAO {
	
	@Autowired
	SqlSession sqlSession;

	public Customer searchCustomerOne(String id){
		CustomerMapper mapper= sqlSession.getMapper(CustomerMapper.class);
		Customer customer = null;
		try{
			customer = mapper.searchCustomerOne(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return customer;
	}
	
	public int joinCustomer(Customer customer){
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		int result = 0;
		try {
			result = mapper.joinCustomer(customer);
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return result;
	}
	
	public int updateCustomer(Customer customer){
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		int result=0;
		try {			
			result=mapper.updateCustomer(customer);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
