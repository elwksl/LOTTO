package dev.lotto.service;

import java.util.List;

import dev.lotto.vo.ShopPrizeVO;
import dev.lotto.vo.ShopVO;

public interface ShopService {

	
	public List<ShopVO> shopinfo();
	
	public List<ShopPrizeVO> shopprize();
}
