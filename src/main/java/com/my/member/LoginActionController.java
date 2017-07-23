package com.my.member;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

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
	
	
	 /*
	  * �α��� ��ȿ�� Ȯ�� ������
	  * session ���� �� login_session �������� mid���� member_id �� �ѱ�
	  * */
	 @RequestMapping(value="/member/login_action", method=RequestMethod.POST)
	    public ModelAndView loginform (@RequestParam("MEMBER_ID") String MEMBER_ID,@RequestParam("MEMBER_PASSWORD") String MEMBER_PASSWORD, Model model,HttpSession session, HttpServletRequest request) {
		 ModelAndView view = new ModelAndView();
		 Member member = new Member();
	     member.setMEMBER_ID(MEMBER_ID);
	     member.setMEMBER_PASSWORD(MEMBER_PASSWORD);
	     System.out.println(member.getMEMBER_ID());
	     System.out.println(member.getMEMBER_PASSWORD());
	     String result = memberDAOService.LoginCheck(member);
	     
	     Map<String, Object> map = new HashMap<String,Object>();
	        
	        
	    
	     System.out.println("result : " + result);
	     if(result==null){
	    	 System.out.println("�ٽ� Ȯ�����ּ���");
	    	 map.put("log", 0);
	    	 map.put("mid", result);
	    	 map.put("alert", "<script type='text/javascript'>window.onload=function(){alert('���̵� ��й�ȣ�� �ٽ� Ȯ�����ּ���'); return false; }</script>");
	    	 request.getSession().setAttribute("member", map);
	    	 view.setViewName("redirect:/sample/openBoardList.do");
	     }else {
	    	 System.out.println("�α��� ����");
	    	 session.setAttribute("member_id", MEMBER_ID);
	    	 session.setAttribute("mid", result);
	    	 map.put("log", 0);
	    	 map.put("mid", result);
	    	 map.put("member_id", member.getMEMBER_ID());
	    	 request.getSession().setAttribute("member", map);
	    	 System.out.println("session.get : " + session.getAttribute("mid"));
	    	 view.addObject("mid",result);
	    	 view.addObject("member_id",session.getAttribute("member_id"));
	    	 view.setViewName("redirect:/sample/openBoardList.do");
	     }
	       return view;
	    }
	 
	 @RequestMapping(value="/include/include-sessionLogout", method=RequestMethod.GET)
	 public ModelAndView logout(@RequestParam("member_id") String member_id ,Model model,HttpSession session, HttpServletRequest request){
		 ModelAndView view = new ModelAndView();
		 System.out.println("include-session.logout");
		 System.out.println(session.getAttribute("member_id"));
		 session.invalidate();
		 view.setViewName("redirect:/sample/openBoardList.do");
		 return view;
	 }
	 @RequestMapping(value="/include/include-session", method = {RequestMethod.GET, RequestMethod.POST})
	 public ModelAndView logSession(Model model,HttpSession session, HttpServletRequest request){
		 ModelAndView view = new ModelAndView();
		 Member member = new Member();
		 if(session.getAttribute("member_id")==null){
			 view.setViewName("member/login");
		 }else{
		 
		 
	     System.out.println(member.getMEMBER_ID());
	     System.out.println(member.getMEMBER_PASSWORD());
	     String result = memberDAOService.LoginCheck(member);
	     
	     Map<String, Object> map = new HashMap<String,Object>();
	        map.put("mid", result);
	        map.put("member_id", member.getMEMBER_ID());
	        request.getSession().setAttribute("member", map);


	     System.out.println("result : " + result);
	     if(result==null){
	    	 
	    	 System.out.println("�ٽ� Ȯ�����ּ���");
	    	 view.addObject("alert","<script type='text/javascript'>"
	    	 		+ "alert('���̵� ��й�ȣ�� Ȯ�����ּ���.')"
	    	 		+ " </script>");
	    	 view.addObject("log", "0");
	    	 view.setViewName("/member/login");
	     }else {
	    	 System.out.println("�α��� ����");
	    	 view.addObject("log", "1");
	    	 String member_id = member.getMEMBER_ID();
	  
	    	 session.setAttribute("member_id", member_id);
	    	 System.out.println("session.get : " + session.getAttribute("member_id"));
	    	 view.addObject("member_id",session.getAttribute("member_id"));
	    	 view.setViewName("/include/include-session");
	     	}
		 }
	     return view;
	 	}	
	 
	 @RequestMapping(value="/member/member_join", method=RequestMethod.GET)
	    public ModelAndView JoinForm (Locale locale, Model model) {
	     
	       ModelAndView view = new ModelAndView();
	       
	       view.setViewName("/member/member_join");
	       
	       return view;
	    }
	 
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
	    	   view.addObject("pop_button","<input type='button' onclick='Idcheckparam();' name='useCheck' id='useCheck' value='����ϱ�'>");
	    	   view.addObject("CheckParam","<input type='hidden' id='CheckParam1' name ='CheckParam1' value='1'>");
	    	   
	       }else {
	    	   view.addObject("MEMBER_INFO", "����� �� ���� ���̵��Դϴ�.");
	    	   view.addObject("pop_button","<input type='button' onclick='Idcheckparam();'  name='useCheck' id='useCheck' value='�ٽþ���'>");
	    	   view.addObject("CheckParam","<input type='hidden' id='CheckParam1' name ='CheckParam1' value='0'>");
	       }
	       view.setViewName("/member/joinIdCheckResult");
	       
	       return view;    //
	    }
	 
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
	 

	 @RequestMapping(value="/member/login", method=RequestMethod.GET)
	    public ModelAndView loginform (Locale locale, Model model) {
	     
	       ModelAndView view = new ModelAndView();
	       
	       view.setViewName("/member/login");
	       
	       return view;
	    }
	 
}