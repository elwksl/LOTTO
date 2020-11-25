package dev.lotto.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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

	private ShopServiceImpl ShopServiceImpl;
	private ShopDtoImpl ShopDtoImpl;
	private static final Logger logger = LoggerFactory.getLogger(LeeController.class);

	// 복권정보 클릭 -> 1번째 페이지 로또6/45 소개로 이동
	@RequestMapping(value = "/index")
	public String lotto_info(Locale locale, Model model) {

		return "common/index";
	}

	@RequestMapping(value = "/login")
	public ModelAndView login(@Param(value = "common/login") Map<String, Object> pMap) {
		ModelAndView mv = new ModelAndView();
				mv.setViewName( "common/login");
		return mv;
	}

	@RequestMapping(value = "/createUser")
	public String createUser(Locale locale, Model model) {

		return "lee/join";
	}

	@RequestMapping(value = "/joinForm")
	public String joinForm(Locale locale, Model model) {

		return "lee/joinForm";
	}

	@RequestMapping(value = "/agDetail")
	public ModelAndView agreement(Model model) {
		ModelAndView result = new ModelAndView();

		/*
		 * Map<String, Object> map; List<ShopVO> shopList =
		 * ShopServiceImpl.shopinfo(pMap); map.put(shopList, shopList);
		 * logger.info(shopList.toString());
		 */
		result.setViewName("lee/agreementDetail");

		
		return result;
	}

}
