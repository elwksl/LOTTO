package dev.lotto.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class KimController {
	
	private static final Logger logger = LoggerFactory.getLogger(KimController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "lotto645", method = RequestMethod.GET)
	public String lotto645(HttpServletRequest req, Model model) {
		logger.info("로또구매페이지.", req);
		/*
		 * Date date = new Date(); DateFormat dateFormat =
		 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		 * 
		 * String formattedDate = dateFormat.format(date);
		 * 
		 * model.addAttribute("serverTime", formattedDate );
		 */
		return "kim/lotto645";
	}
	
	@RequestMapping(value = "execBuy", method = RequestMethod.GET)
	public String execBuy(HttpServletRequest req, Model model) {
		logger.info("로또구매 ajax.", req);
		
		return "kim/lotto645";
	}

}
