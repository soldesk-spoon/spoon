package com.my.member;

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
public class JoinSubmitController {
	
	  @Autowired
	    private MemberDAOService memberDAOService;
	 @RequestMapping(value="/member/join_action", method=RequestMethod.POST)
	    public ModelAndView insertJoin(@RequestParam("MEMBER_ID") String MEMBER_ID,@RequestParam("MEMBER_EMAIL") String MEMBER_EMAIL
	     ,@RequestParam("MEMBER_PASSWORD") String MEMBER_PASSWORD) {
		 /*MEMBER_ID,MEMBER_EMAIL,MEMBER_PASSWORD*/
	       ModelAndView view = new ModelAndView();
	       Member member = new Member();
	       
	       member.setMEMBER_ID(MEMBER_ID);
	       member.setMEMBER_EMAIL(MEMBER_EMAIL);
	       member.setMEMBER_PASSWORD(MEMBER_PASSWORD);
	       
	       SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	         
	         Calendar calendar = Calendar.getInstance();
	          
	         System.out.println(dateFormat.format(calendar.getTime()));

	    	String currentTime = dateFormat.format(calendar.getTime());
	    	System.out.println(currentTime);
	    	member.setMEMBER_CREATED(currentTime);
	       memberDAOService.insertMember(member);
	       
	       
	       view.setViewName("/member/result");
	       
	       return view;
	    }
}