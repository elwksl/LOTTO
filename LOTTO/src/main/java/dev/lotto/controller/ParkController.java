package dev.lotto.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dev.lotto.service.ShopService;
import dev.lotto.vo.ShopVO;
/**
 * Handles requests for the application home page.
 */
@Controller
public class ParkController {
	
	@Autowired
	ShopService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ParkController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "SHOPINFO", method = RequestMethod.GET)
	public String lotto_info(HttpServletRequest req, Model model) {
		List<ShopVO> Shopinfo = service.shopinfo();
		
		model.addAttribute("Shopinfo", Shopinfo );
		
		return "park/shopinfo";
	}
}
