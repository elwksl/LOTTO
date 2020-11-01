package dev.lotto.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.lotto.dto.ShopDtoImpl;
import dev.lotto.service.ShopService;
import dev.lotto.service.ShopServiceImpl;
import dev.lotto.vo.ShopVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LeeController {

	@Autowired
	private ShopDtoImpl ShopDtoImpl;
	private static final Logger logger = LoggerFactory.getLogger(LeeController.class);

	// 복권정보 클릭 -> 1번째 페이지 로또6/45 소개로 이동
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String lotto_info(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "common/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "login";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "index";
	}

	@RequestMapping(value = "/createUser", method = RequestMethod.GET)
	public String createUser(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "join";
	}

	@RequestMapping(value = "/agDetail", method = RequestMethod.GET)
	public ModelAndView agreement(Model model) {
		ModelAndView result = new ModelAndView();
		List<ShopVO> shopList = ShopDtoImpl.shopinfo();
		logger.info(shopList.toString());
		result.addObject("result", shopList);
		result.setViewName("agreementDetail");
		return result;
	}

}
