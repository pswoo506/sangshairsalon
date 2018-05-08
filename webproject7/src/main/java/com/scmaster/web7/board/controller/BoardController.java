package com.scmaster.web7.board.controller;

import java.awt.PageAttributes.OriginType;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.scmaster.web7.board.dao.BoardDAO;
import com.scmaster.web7.board.vo.Board;
import com.scmaster.web7.board.vo.Reply;
import com.scmaster.web7.common.util.FileService;
import com.scmaster.web7.common.util.PageNavigator;

@Controller
@RequestMapping(value="board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardDAO dao;
	
	final String uploadPath="/boardfile";
	final int countPerPage = 5;
	final int pagePerGroup= 5;
	
	@RequestMapping(value="list", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(value = "searchText", defaultValue="")String searchText
		,@RequestParam(value="searchSelect", defaultValue="title")String searchSelect		
		,@RequestParam(value="page", defaultValue="1")int page){
		
		logger.info("글 목록 시작");
		
		HashMap<String, Object>searchMap = new HashMap<>();
		searchMap.put("searchSelect", searchSelect);
		searchMap.put("searchText", searchText);
		
		int total = dao.getTotal(searchMap);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		ArrayList<Board> boardlist = dao.selectBoardAll(searchMap, navi.getStartRecord(), navi.getCountPerPage());
		model.addAttribute("boardlist", boardlist);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		model.addAttribute("lastGroup", ((navi.getTotalPageCount()-1)/navi.getPagePerGroup()));
		logger.info("글 목록 종료");
		return "board/list";
	}
	
	@RequestMapping(value="writeForm", method = RequestMethod.GET)
	public String writeForm(){
		return "board/writeForm";
	}
	
	@RequestMapping(value="write", method = RequestMethod.POST)
	public String write(Board board, HttpSession session, MultipartFile upload){
		String id = (String)session.getAttribute("loginId");
		
		board.setId(id);
		
		if(!upload.isEmpty()){
			
			String savedfilename= FileService.saveFile(upload, uploadPath);
			
			board.setSavedfile(savedfilename);
			board.setOriginalfile(upload.getOriginalFilename());
		}
		
		
		dao.insertBoard(board);
		
		
		return "redirect:list";
	}
	
	@RequestMapping(value="readForm", method = RequestMethod.GET)
	public String read(int boardnum,Model model){
		
		Board board = dao.selectBoardOne(boardnum);
		
		ArrayList<Reply> replyList= dao.selectReplyAll(boardnum);
		
		model.addAttribute("board", board);
		model.addAttribute("replyList", replyList);
		return "board/readForm";
	}	
	@RequestMapping(value="deleteBoard", method=RequestMethod.GET)
	public String deleteBoard(int boardnum, HttpSession session, Model model){
		String id=(String)session.getAttribute("loginId");
		Board board = new Board();
		board.setId(id);
		board.setBoardnum(boardnum);
		
		Board vo = dao.selectBoardOne(boardnum);
		int result= dao.deleteBoard(board);
		if(result != 1){
			model.addAttribute("boardnum", boardnum);
			return "board/readForm";
		}
		boolean flag = FileService.deleteFile(uploadPath+"/"+vo.getSavedfile());
		return"redirect: list";
	}
	
	@RequestMapping(value = "updateBoardForm", method = RequestMethod.GET)
	public String updateBoardForm(int boardnum, HttpSession session, Model model){
		Board board = dao.selectBoardOne(boardnum);
		String id = (String)session.getAttribute("loginId");
		
		if(!board.getId().equals(id)){
			
			model.addAttribute("boardnum", boardnum);
			return "board/readForm";
		}
		
		model.addAttribute("board", board);
		
		return "board/updateForm";
	}
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(Board board,HttpSession session, MultipartFile upload){
		String id = (String)session.getAttribute("loginId");
		board.setId(id);
		
		Board vo = dao.selectBoardOne(board.getBoardnum());
		if(vo.getOriginalfile()!=null){
		FileService.deleteFile(uploadPath+"/"+vo.getSavedfile());
		}			
		String savedFileName = FileService.saveFile(upload, uploadPath);		
		board.setSavedfile(savedFileName);
		board.setOriginalfile(upload.getOriginalFilename());
				
		int result = dao.updateBoard(board);
		
		if(result != 1){
			
			return "board/updateForm";
		}
		
		return "redirect:readForm?boardnum="+board.getBoardnum();
	}
	
	@RequestMapping(value="download", method=RequestMethod.GET)
	public void download(int boardnum, HttpServletResponse response){
		
		Board board = dao.selectBoardOne(boardnum);
		String originalFileName= board.getOriginalfile();
		if(originalFileName==null){			
			return;
		}
		
		
		try {
			response.setHeader("content-disposition", "attachment;filename="+URLEncoder.encode(originalFileName, "utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		String fullPath=uploadPath+"/"+board.getSavedfile();
		
		FileInputStream fis = null;
		ServletOutputStream sos = null;
		
		try {
			fis= new FileInputStream(fullPath);
			sos= response.getOutputStream();
			FileCopyUtils.copy(fis, sos);
			fis.close();
			sos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	@RequestMapping(value="insertReply", method=RequestMethod.POST)
	public String insertReply(Reply reply, HttpSession session){
		String id=(String)session.getAttribute("loginId");		
		reply.setId(id);
		dao.insertReply(reply);
		return"redirect: readForm?boardnum="+reply.getBoardnum();
	}
	@RequestMapping(value="deleteReply", method=RequestMethod.GET)
	public String deleteReply(Reply reply, HttpSession session){
		String id=(String)session.getAttribute("loginId");
		reply.setId(id);
		dao.deleteReply(reply);
		return"redirect: readForm?boardnum="+reply.getBoardnum();
	}
	@RequestMapping(value="updateReply", method = RequestMethod.POST)
	public String updateReply(Reply reply, HttpSession session){
		String id=(String)session.getAttribute("loginId");
		reply.setId(id);
		dao.updateReply(reply);		
		return"redirect: readForm?boardnum="+reply.getBoardnum();
	}
}
