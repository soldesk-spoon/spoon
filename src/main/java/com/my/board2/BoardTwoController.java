package com.my.board2;

import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.annotation.Resource;

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
     
    @RequestMapping(value="/boardTwo/openBoardList.do")
    public ModelAndView openSampleBoardList(BoardBean2 boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("/board2/boardList");
         
        List<BoardBean2> list = boardTwoService.selectBoardList(boardBean);
        mv.addObject("list", list);
         
        return mv;
    }
    
    @RequestMapping(value="/boardTwo/openBoardWrite.do")
    public ModelAndView openBoardWrite(BoardBean2 boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("/board2/boardWrite");
         
        return mv;
    }
    
    @RequestMapping(value="/boardTwo/insertBoard.do")
    public ModelAndView insertBoard(BoardBean2 boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/boardTwo/openBoardList.do");
        
        boardTwoService.insertBoard(boardBean);
        System.out.println(boardBean.getBid());
        return mv;
    }
    
    @RequestMapping(value="/boardTwo/openBoardDetail.do", method=RequestMethod.GET)
    public ModelAndView openBoardDetail(@RequestParam("bid")int bid) throws Exception{
        ModelAndView mv = new ModelAndView("/board2/boardDetail");
        Map<String, Object> map = boardTwoService.selectBoardDetail(bid);
        mv.addObject("map", map); 
         
        return mv;
    }
    
    @RequestMapping(value="/boardTwo/openBoardUpdate.do", method=RequestMethod.GET)
    public ModelAndView openBoardUpdate(@RequestParam("bid")int bid) throws Exception{
        ModelAndView mv = new ModelAndView("/board2/boardUpdate");
         
        Map<String,Object> map = boardTwoService.selectBoardDetail(bid);
        mv.addObject("map", map);
         
        return mv;
    }

    @RequestMapping(value="/boardTwo/updateBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView updateBoard(BoardBean2 boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/boardTwo/openBoardDetail.do");
        System.out.println("updateBoard!!!!!!!!!!!!!!1");
  
        
        boardTwoService.updateBoard(boardBean);
        System.out.println(boardBean.getBid());
        System.out.println(boardBean.getBoard_subject());
        System.out.println(boardBean.getBoard_contents());
        mv.addObject("bid", boardBean.getBid());
    
        return mv;
        
    }
    
    
    @RequestMapping(value="/boardTwo/deleteBoard.do")
    public ModelAndView deleteBoard(int bid) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/boardTwo/openBoardList.do");

        boardTwoService.deleteBoard(bid);
        
        return mv;
    }
    
}