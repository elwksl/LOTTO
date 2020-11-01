package dev.lotto.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.lotto.dto.ShopDtoImpl;
import dev.lotto.vo.ShopVO;


@Service
public class ShopServiceImpl implements ShopService{

	
	@Autowired
	ShopDtoImpl shopDto;
	
	@Override
	public List<ShopVO> shopinfo() {
		// TODO Auto-generated method stub
		List<ShopVO> vo = shopDto.shopinfo();
		return vo;
	}

}
