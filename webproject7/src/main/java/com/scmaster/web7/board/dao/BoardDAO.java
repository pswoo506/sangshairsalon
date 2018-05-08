package com.scmaster.web7.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.web7.board.vo.Board;
import com.scmaster.web7.board.vo.Reply;

@Repository
public class BoardDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);
	
	@Autowired
	SqlSession sqlSession;
	
	
	//글 쓰기
	public void insertBoard(Board board){
		logger.info("글쓰기 시작");
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		try{
			mapper.insertBoard(board);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("글쓰기 종료");
	}
	
	//글목록
	public ArrayList<Board> selectBoardAll(HashMap<String, Object>searchMap, int startRecord, int countPerPage){
		logger.info("글목록 시작");
		ArrayList<Board> boardlist = null;		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		try{
			boardlist = mapper.selectBoardAll(searchMap, rb);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("글목록 종료");
		return boardlist;
	}
	
	//글 조회
	public Board selectBoardOne(int boardnum){
		logger.info("글조회 시작");
		Board board = null;
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		try{
			mapper.updateHits(boardnum);
			board = mapper.selectBoardOne(boardnum);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("글조회 종료");
		return board;
	}
	
	public int deleteBoard(Board board){
		logger.info("글삭제 시작");
		int result = 0;
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		try{			
			result = mapper.deleteBoard(board);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("글삭제 종료");
		return result;	
		}
	//글 수정
		public int updateBoard(Board board){
			logger.info("글수정 시작");
			int result = 0;
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			
			try{
				result = mapper.updateBoard(board);
			}catch(Exception e){
				e.printStackTrace();
			}
			logger.info("글수정 종료");
			return result;
		}
		public int getTotal(HashMap<String, Object> searchMap){
			logger.info("글 개수 조회 시작");
			int count = 0;
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			
			try{
				count = mapper.getTotal(searchMap);
			}catch(Exception e){
				e.printStackTrace();
			}
			logger.info("글 개수조회 종료");
			return count;
		}
		public void insertReply(Reply reply){
			logger.info("댓글 등록시작");
	
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			
			try{
				 mapper.insertReply(reply);
			}catch(Exception e){
				e.printStackTrace();
			}
			logger.info("댓글 등록종료");
			
		}
		
		public ArrayList<Reply> selectReplyAll(int boardnum){
			logger.info("댓글 조회 시작");
		
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			ArrayList<Reply> replyList= null;
			try{
				replyList = mapper.selectReplyAll(boardnum);
			}catch(Exception e){
				e.printStackTrace();
			}
			logger.info("댓글조회 종료");
			return replyList;
		}
		public void deleteReply(Reply reply){
			logger.info("댓글 삭제 시작");
			
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
			try{
				mapper.deleteReply(reply);
			}catch(Exception e){
				e.printStackTrace();
			}
			logger.info("댓글 삭제 종료");		
		}
		public void updateReply(Reply reply){
			logger.info("댓글수정 시작");
			
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
			try{
				mapper.updateReply(reply);
			}catch(Exception e){
				e.printStackTrace();
			}
			logger.info("댓글수정 종료");			
		}
}

