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
    public ModelAndView insertBoard(BoardBean2 boardBean,HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/QnA_board/openBoardList.do");
        int mid = Integer.parseInt((String) session.getAttribute("mid"));
        System.out.println(mid);
         boardBean.setMid(mid);
        boardTwoService.insertBoard(boardBean);
        System.out.println(boardBean.getQid());
        return mv;
    }
    
    @RequestMapping(value="/QnA_board/openBoardDetail.do", method=RequestMethod.GET)
    public ModelAndView openBoardDetail(@RequestParam("qid")int qid) throws Exception{
        ModelAndView mv = new ModelAndView("/QnA_board/QnA_boardDetail");
        Map<String, Object> map = boardTwoService.selectBoardDetail(qid);
        Map<String, Object> answerMap = boardTwoService.selectAnswerBoard(qid);
        if(answerMap==null){
        	String result = "조회된 답변이 없습니다.";
        	mv.addObject("resultString", result);
        }else{
        	mv.addObject("answerMap",answerMap);
        }
        
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
    
    @RequestMapping(value="/QnA_board/insertAnswer.do")
    public ModelAndView insertAnswer(HttpServletRequest request) throws Exception {
    	ModelAndView mv = new ModelAndView("redirect:/QnA_board/openBoardDetail.do");
    	AnswerBean answerBean = new AnswerBean();
    	String qid_s = request.getParameter("qid");
    	String answer = request.getParameter("answer");
    	int qid = Integer.parseInt(qid_s);
    	
    	answerBean.setAnswer(answer);
    	answerBean.setQid(qid);
    	boardTwoService.insertAnswer(answerBean);
    	return mv;
    }
    
}