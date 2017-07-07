package com.my.member;

import java.util.Locale;

import javax.swing.text.View;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginActionController {
	@Autowired
    private MemberDAOService memberDAOService;

	 @RequestMapping(value="/member/login_action", method=RequestMethod.POST)
	    public ModelAndView loginform (@RequestParam("MEMBER_ID") String MEMBER_ID,@RequestParam("MEMBER_PASSWORD") String MEMBER_PASSWORD, Model model) {
		 ModelAndView view = new ModelAndView();
		 Member member = new Member();
	     member.setMEMBER_ID(MEMBER_ID);
	     member.setMEMBER_PASSWORD(MEMBER_PASSWORD);
	     
	     System.out.println(member.getMEMBER_ID());
	     System.out.println(member.getMEMBER_PASSWORD());
	     int result = memberDAOService.LoginCheck(member);
	     System.out.println("result : " + result);
	     if(result==1){
	    	 System.out.println("로그인 성공");
	    	 view.addObject("log", "1");
	    	 
	     }else {
	    	 System.out.println("다시 확인해주세요");
	    	 view.addObject("log", "0");
	     }
	       
	       view.setViewName("/member/login_action");
	       
	       return view;
	    }
}