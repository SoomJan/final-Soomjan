package com.soomjd.soomjan.matching.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.matching.model.dao.MatchingMapper;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.matching.model.dto.EstimateDTO;

@Service
public class MatchingServiceImpl implements MatchingService{

	private MatchingMapper mapper;
	
	@Autowired
	public MatchingServiceImpl(MatchingMapper matchingMapper) {
		
		this.mapper = matchingMapper;  // 생성자로 의존성 주입하기
	}
	
	@Override
	public boolean registEstimate(EstimateDTO estimate) {
		
		return mapper.registEstimate(estimate) > 0? true:false;
				
	}
	
	//카테고리 리스트를 DB에서 불러주는 서비스
	@Override
	public List<CategoryDTO> selectCategory(CategoryDTO category) {
		
		return mapper.selectCategory(category);
	}
	
	

}
