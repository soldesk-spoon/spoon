package com.my.zipcode;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinIdCheckController {
	
	  @Autowired
	    private MemberDAOService memberDAOService;
	 @RequestMapping(value="/member/JoinIdCheck", method=RequestMethod.GET)
	    public ModelAndView insertJoin(@RequestParam("MEMBER_ID") String MEMBER_ID,@RequestParam("CheckParam") int CheckParam) {
		 /*MEMBER_ID,MEMBER_EMAIL,MEMBER_PASSWORD*/
		 ModelAndView view = new ModelAndView();
	       Member member = new Member();
	       member.setMEMBER_ID(MEMBER_ID);
	       
	       
	       System.out.println(member.getMEMBER_ID());
	       System.out.println(memberDAOService.JoinIdCheck(member.getMEMBER_ID()));
	       int result = memberDAOService.JoinIdCheck(member.getMEMBER_ID());
	       
	       if(result==0){
	    	   view.addObject("MEMBER_INFO", "����� �� �ִ� ���̵� �Դϴ�. ");
	    	   view.addObject("pop_button","<input type='button' onclick='Idcheckparam();' name='useCheck' id='useCheck' value='1'>");
	    	   member.setCheckParam(1);
	    	   view.addObject("CheckParam","<input type='hidden' id='CheckParam' name ='CheckParam' value='1'>");
	    	   
	       }else {
	    	   view.addObject("MEMBER_INFO", "����� �� ���� ���̵��Դϴ�.");
	    	   view.addObject("pop_button","<input type='button' onclick='Idcheckparam();'  name='useCheck' id='useCheck' value='0'>");
	    	   member.setCheckParam(0);
	    	   view.addObject("CheckParam","<input type='hidden' id='CheckParam' name ='CheckParam' value='0'>");
	       }
	       view.setViewName("/member/joinIdCheckResult");
	       
	       return view;
	    }
}