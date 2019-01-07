package com.spring.biz.travelers.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.travelers.TravelersService;
import com.spring.biz.travelers.TravelersVO;

@Service("travelersService")
public class TravelersServiceImpl implements TravelersService{
	@Autowired
	private TravelersDAO travelersDAO;
	
	public TravelersServiceImpl() {
		System.out.println("TravelersServiceImpl 객체 생성");
	}

   @Override
   public List<TravelersVO> getTravelersList(Map<String, Object> map) {
      return travelersDAO.getTravelersList(map);
   }

@Override
public int countTravelers(String key) {
	return travelersDAO.countTravelers(key);
}

}