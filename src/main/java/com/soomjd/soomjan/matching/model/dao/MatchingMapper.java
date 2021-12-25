package com.soomjd.soomjan.matching.model.dao;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.matching.model.dto.EstimateDTO;
import com.soomjd.soomjan.matching.model.dto.MatchedChattingDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

public interface MatchingMapper {


	int registEstimate(EstimateDTO estimate);

	List<CategoryDTO> selectCategory(CategoryDTO category);

//	List<EstimateDTO> selectEstimate(Map<String, Object> map, SelectCriteria selectCriteria);

	int selecetMainTotal();
	
	List<EstimateDTO> selectEstimate(SelectCriteria selectCriteria);

	List<EstimateDTO> ssackList(SelectCriteria selectCriteria);

	List<EstimateDTO> estimateDetail(int estimateCode);
	
	List<EstimateDTO> estimateDetailJ(String estimateCode);

	int selecetEstimateTotal();

	List<EstimateDTO> estimateMainJ(SelectCriteria selectCriteria);

	MatchedChattingDTO matchedChatting(MatchedChattingDTO matchedChatting);

	boolean registChattingRoom(Map<String, Object> matchedChatMap);

	int updateMatched(int estimateCode);

	List<Map<String, Object>> chatEstimateCode(String jmail);

	List<Map<String, Object>> jandiProfileAndName(MatchedChattingDTO matchedChattingDTO);

	List<Map<String, Object>> selectMyChatList(String myEmail);
}
