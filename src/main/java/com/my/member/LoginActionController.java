package com.my.member;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
	    public ModelAndView loginform (@RequestParam("MEMBER_ID") String MEMBER_ID,@RequestParam("MEMBER_PASSWORD") String MEMBER_PASSWORD, Model model,HttpSession session, HttpServletRequest request) {
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
	    	 session.setAttribute("user_id", MEMBER_ID);
	    	 System.out.println("session.get : " + session.getAttribute("user_id"));
	    	 view.addObject("user_id",session.getAttribute("user_id"));
	    	 view.setViewName("/include/include-session");
	     }else {
	    	 System.out.println("다시 확인해주세요");
	    	 view.addObject("alert","<script type='text/javascript'>"
	    	 		+ "alert('아이디 비밀번호를 확인해주세요.')"
	    	 		+ " </script>");
	    	 view.addObject("log", "0");
	    	 view.setViewName("/member/login");
	     }
	       
	       
	       return view;
	    }
	 @RequestMapping(value="/include/include-session", method=RequestMethod.GET)
	 public ModelAndView logout(@RequestParam("user_id") String user_id ,Model model,HttpSession session, HttpServletRequest request){
		 ModelAndView view = new ModelAndView();
		 user_id="";
		 if(user_id.equals("")){
			 session.invalidate();
			 view.addObject("user_id",null);
		 }
		 
		 view.setViewName("/include/include-session");
		 return view;
	 }
	 
	 
}