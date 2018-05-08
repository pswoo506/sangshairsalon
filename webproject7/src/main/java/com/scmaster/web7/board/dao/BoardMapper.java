package com.scmaster.web7.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.scmaster.web7.board.vo.Board;
import com.scmaster.web7.board.vo.Reply;

public interface BoardMapper {
	
	//글 쓰기
	public void insertBoard(Board board);
	
	//글목록
	public ArrayList<Board> selectBoardAll(HashMap<String, Object>searchMap, RowBounds rb);
	
	//글 조회
	public Board selectBoardOne(int boardnum);
	
	//조회수 증가
	public void updateHits(int boardnum);
	
	//글 삭제
	public int deleteBoard(Board board);
	
	//글 수정
	public int updateBoard(Board board);
	
	//글 갯수 조회(검색어포함)
	public int getTotal(HashMap<String, Object> searchMap);
	
	//댓글 등록
	public void insertReply(Reply reply);
	
	//댓글조회
	public ArrayList<Reply> selectReplyAll(int boardnum);
	
	//댓글 삭제
	public void deleteReply(Reply reply);
	
	//댓글 수정
	public void updateReply(Reply reply);
}
