package com.my.member;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.shop.HomeController;

@Controller
public class zipcodeListController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/zipcode/daum_zipcode", method = RequestMethod.GET)
	public String daum_zipcode(Locale locale, Model model) {

		
		return "/zipcode/daum_zipcode";
	}
}
