package com.my.shop;

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
import org.springframework.web.servlet.ModelAndView;

import com.my.shop.BoardBean;

 
@Controller
public class SampleController {
    Logger logger = Logger.getLogger(this.getClass());
     
    @Resource(name="sampleService")
    private SampleService sampleService;
     
    @RequestMapping(value="/sample/openBoardList.do")
    public ModelAndView openSampleBoardList(BoardBean boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardList");
         
        List<BoardBean> list = sampleService.selectBoardList(boardBean);
        mv.addObject("list", list);
         
        return mv;
    }
    
    @RequestMapping(value="/sample/openBoardWrite.do")
    public ModelAndView openBoardWrite(BoardBean boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardWrite");
         
        return mv;
    }
    
    @RequestMapping(value="/sample/insertBoard.do")
    public ModelAndView insertBoard(BoardBean boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");

        System.out.println(boardBean.getBoard_subject());
        sampleService.insertBoard(boardBean);
        
        return mv;
    }
    
    @RequestMapping(value="/sample/openBoardDetail.do", method=RequestMethod.GET)
    public ModelAndView openBoardDetail(@RequestParam("bid")int bid) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardDetail");
        Map<String, Object> map = sampleService.selectBoardDetail(bid);
        mv.addObject("map", map); 
         
        return mv;
    }
    
    @RequestMapping(value="/sample/openBoardUpdate.do", method=RequestMethod.GET)
    public ModelAndView openBoardUpdate(@RequestParam("bid")int bid) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardUpdate");
         
        Map<String,Object> map = sampleService.selectBoardDetail(bid);
        mv.addObject("map", map);
         
        return mv;
    }
     
    @RequestMapping(value="/sample/updateBoard.do")
    public ModelAndView updateBoard(BoardBean boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do");
         
        sampleService.updateBoard(boardBean);
         
        mv.addObject("BID", boardBean.getBid());
        return mv;
    }    
    
    @RequestMapping(value="/sample/deleteBoard.do")
    public ModelAndView deleteBoard(int bid) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");

        sampleService.deleteBoard(bid);
        
        return mv;
    }
    
}