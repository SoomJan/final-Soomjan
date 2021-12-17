package com.soomjd.soomjan.matching.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.matching.model.dao.MatchingMapper;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.matching.model.dto.EstimateDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

@Service
public class MatchingServiceImpl implements MatchingService{

	private MatchingMapper mapper;
	
	@Autowired
	public MatchingServiceImpl(MatchingMapper matchingMapper) {
		
		this.mapper = matchingMapper;  // 생성자로 의존성 주입하기
	}
	
	
	//견적서 작성할 때
	@Override
	public boolean registEstimate(EstimateDTO estimate) {
		
		return mapper.registEstimate(estimate) > 0? true:false;
				
	}
	
	//카테고리 리스트를 DB에서 불러주는 서비스
	@Override
	public List<CategoryDTO> selectCategory(CategoryDTO category) {
		
		return mapper.selectCategory(category);
	}
	
	//매칭 메인에서 자신이 작성한 리스트만 보여주는 서비스
//	@Override
//	public List<EstimateDTO> selectEstimate(Map<String, Object> map) {
//		return mapper.selectEstimate(map);
//	}

	@Override
	public List<EstimateDTO> selectEstimate(SelectCriteria selectCriteria) {
		return mapper.selectEstimate(selectCriteria);
	}



	@Override
	public int selecetMainTotal() {
		return mapper.selecetMainTotal();

	}

	// 잔디가 싹 리스트를 보는 화면
	@Override
	public List<EstimateDTO> ssackList(SelectCriteria selectCriteria) {
		return mapper.ssackList(selectCriteria);
	}

	// 견적서 디테일 보는 화면
	@Override
	public List<EstimateDTO> estimateDetail(String estimateCode) {
		
		return mapper.estimateDetail(estimateCode);
	}

//
//	@Override
//	public List<EstimateDTO> selectEstimate(Map<String, Object> map, SelectCriteria selectCriteria) {
//		return mapper.selectEstimate(map, selectCriteria);
//	}

	
	
	

}
