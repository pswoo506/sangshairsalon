package com.scmaster.web7.customer.dao;

import com.scmaster.web7.customer.vo.Customer;

public interface CustomerMapper {
	public Customer searchCustomerOne(String id);
	public int joinCustomer(Customer customer);
	public int updateCustomer(Customer customer);
}
