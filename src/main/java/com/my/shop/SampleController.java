package com.my.shop;

import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.my.shop.BoardBean;

 
@Controller
@SessionAttributes("mid")
public class SampleController {
    Logger logger = Logger.getLogger(this.getClass());
     
    @Resource(name="sampleService")
    private SampleService sampleService;
     
    @RequestMapping(value="/sample/openBoardList.do", method=RequestMethod.GET)
    public ModelAndView openSampleBoardList(BoardBean boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardList");
         
        List<BoardBean> list = sampleService.selectBoardList(boardBean);
        mv.addObject("list", list);
         
        return mv;
    }
   
    
    @RequestMapping(value="/sample/openBoardWrite.do")
    public ModelAndView openBoardWrite(@RequestParam("subway_linenumber") String subway_linenumber, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardWrite");
        BoardBean boardBean = new BoardBean();
        
        String board_subject = request.getParameter("board_subject");
        String board_contents = request.getParameter("board_contents");
        mv.addObject("board_subject",board_subject);
        mv.addObject("board_contents",board_contents);
        
        List<BoardBean> list = sampleService.selectSubway(subway_linenumber);
         mv.addObject("subList",list);
         mv.addObject("subway_linenumber",subway_linenumber);
        return mv;
    }
    
    @RequestMapping(value="/sample/insertBoard.do")
    public ModelAndView insertBoard(BoardBean boardBean, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
        int mid = Integer.parseInt(request.getParameter("session_mid"));
        String member_id = request.getParameter("session_member_id");
        boardBean.setMember_id(member_id);
        boardBean.setMid(mid);
        boardBean.setSubway_linenumber( request.getParameter("subway_linenumber1"));
        System.out.println(boardBean.getSubway_name());
        System.out.println(boardBean.getSubway_linenumber());
        sampleService.insertBoard(boardBean);
        System.out.println(boardBean.getBid());
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

    @RequestMapping(value="/sample/updateBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView updateBoard(BoardBean boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do");
        System.out.println("updateBoard!!!!!!!!!!!!!!1");
  
        
        sampleService.updateBoard(boardBean);
        System.out.println(boardBean.getBid());
        System.out.println(boardBean.getBoard_subject());
        System.out.println(boardBean.getBoard_contents());
        mv.addObject("bid", boardBean.getBid());
    
        return mv;
        
    }
    
    
    @RequestMapping(value="/sample/deleteBoard.do")
    public ModelAndView deleteBoard(int bid) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");

        sampleService.deleteBoard(bid);
        
        return mv;
    }
    
}