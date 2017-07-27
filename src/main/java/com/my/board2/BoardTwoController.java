package com.my.board2;

import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("mid")
public class BoardTwoController {
	Logger logger = Logger.getLogger(this.getClass());
    
    @Resource(name="boardTwoService")
    private BoardTwoService boardTwoService;
     
    @RequestMapping(value="/QnA_board/openBoardList.do")
    public ModelAndView openSampleBoardList(BoardBean2 boardBean, HttpServletRequest request, HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView("/QnA_board/QnA_boardList");
        int mid = Integer.parseInt((String) session.getAttribute("mid"));
        List<BoardBean2> list = null;
        String admin = boardTwoService.selectAdmin(mid);
        if(admin.equals("N")){
        	boardBean.setMid(mid);
        	list = boardTwoService.selectBoardList(boardBean);
        }else if(admin.equals("Y")){
        	list = boardTwoService.selectBoardListForAdmin(boardBean);
        }else {
        	System.out.println(admin);
        	System.out.println("error : admin");
        }
        
        System.out.println(mid);
         boardBean.setMid(mid);
        mv.addObject("list", list);
        
        return mv;
    }
    
    @RequestMapping(value="/QnA_board/openBoardWrite.do")
    public ModelAndView openBoardWrite(BoardBean2 boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("/QnA_board/QnA_boardWrite");
         
        return mv;
    }
    
    @RequestMapping(value="/QnA_board/insertBoard.do")
    public ModelAndView insertBoard(BoardBean2 boardBean,HttpSession session, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/QnA_board/openBoardList.do");
        int mid = Integer.parseInt((String) session.getAttribute("mid"));
        String member_id = request.getParameter("session_member_id");
        System.out.println(mid);
         boardBean.setMid(mid);
         boardBean.setMember_id(member_id);
         
        boardTwoService.insertBoard(boardBean);
        System.out.println(boardBean.getQid());
        return mv;
    }
    
    @RequestMapping(value="/QnA_board/openBoardDetail.do", method=RequestMethod.GET)
    public ModelAndView openBoardDetail(@RequestParam("qid")int qid,HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView("/QnA_board/QnA_boardDetail");
        Map<String, Object> map = boardTwoService.selectBoardDetail(qid);
        int mid = Integer.parseInt((String) session.getAttribute("mid"));
        String adminNY = boardTwoService.selectAdmin(mid);
        mv.addObject("adminNY",adminNY);
        mv.addObject("map", map); 
         
        return mv;
    }
    
    @RequestMapping(value="/QnA_board/openBoardUpdate.do", method=RequestMethod.GET)
    public ModelAndView openBoardUpdate(@RequestParam("qid")int qid) throws Exception{
        ModelAndView mv = new ModelAndView("/QnA_board/QnA_boardUpdate");
         
        Map<String,Object> map = boardTwoService.selectBoardDetail(qid);
        mv.addObject("map", map);
         
        return mv;
    }

    @RequestMapping(value="/QnA_board/updateBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView updateBoard(BoardBean2 boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/QnA_board/openBoardDetail.do");
        System.out.println("updateBoard!!!!!!!!!!!!!!1");
  
        
        boardTwoService.updateBoard(boardBean);
        System.out.println(boardBean.getQid());
        System.out.println(boardBean.getQna_subject());
        System.out.println(boardBean.getQna_contents());
        mv.addObject("qid", boardBean.getQid());
    
        return mv;
        
    }
    
    
    @RequestMapping(value="/QnA_board/deleteBoard.do")
    public ModelAndView deleteBoard(int qid) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/QnA_board/openBoardList.do");

        boardTwoService.deleteBoard(qid);
        
        return mv;
    }    
    
    @RequestMapping(value="/QnA_board/insertComment.do")
    public ModelAndView insertComment(HttpServletRequest request) throws Exception {
    	String requestqid = request.getParameter("qid");
    	String requestComment = request.getParameter("comment");
    	
    	ModelAndView mv = new ModelAndView("redirect:/QnA_board/openBoardDetail.do?qid="+requestqid);
    	BoardBean2 boardBean2 = new BoardBean2();
    	
    	boardBean2.setQid(Integer.parseInt(requestqid));
    	boardBean2.setQna_comment(requestComment);
    	
    	boardTwoService.insertComment(boardBean2);
    	
    	
    	return mv;
    }
    @RequestMapping(value="/QnA_board/deleteComment.do")
    public ModelAndView deleteComment(@RequestParam("qid") int qid) throws Exception {
    	ModelAndView mv = new ModelAndView("redirect:/QnA_board/openBoardDetail.do?qid="+qid);
    	BoardBean2 boardBean2 = new BoardBean2();
    	boardBean2.setQid(qid);
    	boardTwoService.updateCommentNY(boardBean2.getQid());
    	
    	
    	return mv;
    }
}