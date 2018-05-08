package com.scmaster.web7.reserve.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.web7.reserve.vo.Reserve;


@Repository
public class ReserveDAO {
	
	
	
	@Autowired
	SqlSession sqlSession;
	
	
	//예약입력
	public int reservation (Reserve reserve){
		int result = 0;
		ReserveMapper mapper = sqlSession.getMapper(ReserveMapper.class);
		
		try{
			result = mapper.reservation(reserve);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	

	
	//예약조회
	public ArrayList<Reserve> selectOne(String id){
	
		ArrayList<Reserve> list = null;
		ReserveMapper mapper = sqlSession.getMapper(ReserveMapper.class);
		
		try{			
			list = mapper.selectOne(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}	
		
}

