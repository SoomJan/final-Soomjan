package com.soomjd.soomjan.matching.model.service;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.matching.model.dto.EstimateDTO;
import com.soomjd.soomjan.matching.model.dto.MatchedChattingDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

public interface MatchingService {

	boolean registEstimate(EstimateDTO estimate);

	List<CategoryDTO> selectCategory(CategoryDTO category);

//	List<EstimateDTO> selectEstimate(Map<String, Object> map, SelectCriteria selectCriteria);

	// main페이지에서 총 견적서 갯수 가져오기
	int selecetMainTotal();

	List<EstimateDTO> selectEstimate(SelectCriteria selectCriteria);

	// 견적서 타이틀 클릭 시 디테일 데이터 가져오기
	List<EstimateDTO> estimateDetail(String estimateCode);
	
	// 견적서 타이틀 클릭 시 잔디 화면에서 디테일 데이터 가져오기
	List<EstimateDTO> estimateDetailJ(String estimateCode);

	// 전체 견적서 리스트(잔디) 총 갯수 가져오기
	int selecetEstimateTotal();

	// 전체 견적서 리스트(잔디) 가져오기
	List<EstimateDTO> estimateMainJ(SelectCriteria selectCriteria);

	MatchedChattingDTO selectChattingRoom(MatchedChattingDTO matchedChatting);

	boolean registChattingRoom(Map<String, Object> matchedChatMap);

	boolean updateMatched(int estimateCode);


}
