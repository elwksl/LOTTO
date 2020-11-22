package dev.lotto.dto;

import java.util.List;

import dev.lotto.vo.ShopPrizeVO;
import dev.lotto.vo.ShopVO;

public interface ShopDto {

	
	public List<ShopVO> shopinfo();
	
	public List<ShopPrizeVO> shopprize();
	
	public List<ShopVO> shopsearchinfo(String adr);
	
	public List<ShopPrizeVO> Dangsearchinfo(String adr);
	
}
