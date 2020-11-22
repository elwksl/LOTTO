package dev.lotto.dto;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dev.lotto.vo.ShopPrizeVO;
import dev.lotto.vo.ShopVO;

@Repository
public class ShopDtoImpl implements ShopDto{

	@Autowired
	SqlSessionFactory sqlSession;
	
	@Override
	public List<ShopVO> shopinfo() {
		return sqlSession.openSession().selectList("loto.mapper.parkMapper.shopinfo");
	}

	@Override
	public List<ShopPrizeVO> shopprize() {
		return sqlSession.openSession().selectList("loto.mapper.parkMapper.shopprize");
	}
	
	@Override
	public List<ShopVO> shopsearchinfo(String adr) {
		// TODO Auto-generated method stub
		return sqlSession.openSession().selectList("loto.mapper.parkMapper.shopsearchinfo", adr);
	}
	
	@Override
	public List<ShopPrizeVO> Dangsearchinfo(String adr) {
		return sqlSession.openSession().selectList("loto.mapper.parkMapper.Dangsearchinfo", adr);
	}
	
	
}
