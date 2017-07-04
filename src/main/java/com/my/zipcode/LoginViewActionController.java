package com.my.zipcode;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginViewActionController {

	 @RequestMapping(value="/member/login", method=RequestMethod.GET)
	    public ModelAndView loginform (Locale locale, Model model) {
	     
	       ModelAndView view = new ModelAndView();
	       
	       view.setViewName("/member/login");
	       
	       return view;
	    }
}