package dev.lotto.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import dev.lotto.vo.ShopVO;

@Repository
public class ShopDtoImpl implements ShopDto{

	
	
	@Override
	public List<ShopVO> shopinfo() {
		ShopVO test = new ShopVO();
		test.setADDRESS("경기도평택시아무개동");
		test.setSHOP_NAME("평택로또판매점");
		test.setPHONE("010-6678-7542");
		ArrayList<ShopVO> vo= new ArrayList<ShopVO>();
		
		vo.add(0, test);
		
		return vo;
	}

}
