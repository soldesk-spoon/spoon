package com.my.shop;

import java.util.List;
import java.util.Map;
 
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

 
@Controller
public class SampleController {
    Logger logger = Logger.getLogger(this.getClass());
     
    @Resource(name="sampleService")
    private SampleService sampleService;
     
    @RequestMapping(value="/sample/openSampleBoardList.do")
    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardList");
         
        List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
        mv.addObject("list", list);
         
        return mv;
    }
    
	@RequestMapping(value="/sample/show_write_form.do", method=RequestMethod.GET)
	public String show_write_form( Model model){
		logger.info("show_write_form called!!");
		model.addAttribute("boardBeanObjToWrite", new BoardBean());
		
		return "board/writeBoard";
	}
	/*
	@RequestMapping(value="/DoWriteBoard.do", method=RequestMethod.POST)
	public String DoWriteBoard(BoardBean boardBeanObjToWrite, Model model){		
		logger.info("DoWriteBoard called!!");				
		logger.info("memo=["+boardBeanObjToWrite.getMemo()+"]");
		boardService.insertBoard(boardBeanObjToWrite);
		model.addAttribute("totalCnt", new Integer(boardService.getTotalCnt()));
		model.addAttribute("current_page", "1");
		model.addAttribute("boardList", boardService.getList(1, 2));
		return "board/listSpecificPage";		
	}*/
}