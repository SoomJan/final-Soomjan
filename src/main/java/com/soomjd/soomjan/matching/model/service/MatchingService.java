package com.soomjd.soomjan.matching.model.service;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.matching.model.dto.EstimateDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

public interface MatchingService {

	boolean registEstimate(EstimateDTO estimate);

	List<CategoryDTO> selectCategory(CategoryDTO category);

//	List<EstimateDTO> selectEstimate(Map<String, Object> map, SelectCriteria selectCriteria);

	// main페이지에서 총 견적서 갯수 가져오기
	int selecetMainTotal();

	List<EstimateDTO> selectEstimate(SelectCriteria selectCriteria);

	// 잔디가 견적서 현황을 누르면 자신이 쓴 견적서 가져오기
	List<EstimateDTO> ssackList(SelectCriteria selectCriteria);

	
	// 견적서 타이틀 클릭 시 디테일 데이터 가져오기
	List<EstimateDTO> estimateDetail(String estimateCode);

}
