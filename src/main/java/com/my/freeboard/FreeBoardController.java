package com.my.freeboard;

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
public class FreeBoardController {
	Logger logger = Logger.getLogger(this.getClass());
    
    @Resource(name="freeBoardService")
    private FreeBoardService freeBoardService;
     
    @RequestMapping(value="/freeboard/openBoardList.do")
    public ModelAndView openSampleBoardList(BoardBeanF boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("/freeboard/boardList");
         
        List<BoardBeanF> list = freeBoardService.selectBoardList(boardBean);
        mv.addObject("list", list);
        
        return mv;
    }
    
    @RequestMapping(value="/freeboard/openBoardWrite.do")
    public ModelAndView openBoardWrite(BoardBeanF boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("/freeboard/boardWrite");
         
        return mv;
    }
    
    @RequestMapping(value="/freeboard/insertBoard.do")
    public ModelAndView insertBoard(BoardBeanF boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/freeboard/openBoardList.do");
        
        freeBoardService.insertBoard(boardBean);
        System.out.println(boardBean.getFbid());
        return mv;
    }
    
    @RequestMapping(value="/freeboard/openBoardDetail.do", method=RequestMethod.GET)
    public ModelAndView openBoardDetail(@RequestParam("fbid")int fbid) throws Exception{
        ModelAndView mv = new ModelAndView("/freeboard/boardDetail");
        Map<String, Object> map = freeBoardService.selectBoardDetail(fbid);
        mv.addObject("map", map); 
         
        return mv;
    }
    
    @RequestMapping(value="/freeboard/openBoardUpdate.do", method=RequestMethod.GET)
    public ModelAndView openBoardUpdate(@RequestParam("fbid")int fbid) throws Exception{
        ModelAndView mv = new ModelAndView("/freeboard/boardUpdate");
         
        Map<String,Object> map = freeBoardService.selectBoardDetail(fbid);
        mv.addObject("map", map);
         
        return mv;
    }

    @RequestMapping(value="/freeboard/updateBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView updateBoard(BoardBeanF boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/freeboard/openBoardDetail.do");
        System.out.println("updateBoard!!!!!!!!!!!!!!1");
  
        
        freeBoardService.updateBoard(boardBean);
        System.out.println(boardBean.getFbid());
        System.out.println(boardBean.getFree_subject());
        System.out.println(boardBean.getFree_contents());
        mv.addObject("fbid", boardBean.getFbid());
    
        return mv;
        
    }
    
    
    @RequestMapping(value="/freeboard/deleteBoard.do")
    public ModelAndView deleteBoard(int fbid) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/freeboard/openBoardList.do");

        freeBoardService.deleteBoard(fbid);
        
        return mv;
    }    
}