package com.soomjd.soomjan.matching.model.service;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.matching.model.dto.EstimateDTO;

public interface MatchingService {

	boolean registEstimate(EstimateDTO estimate);

	List<CategoryDTO> selectCategory(CategoryDTO category);

//	List<EstimateDTO> selectEstimate(Map<String, Object> map, SelectCriteria selectCriteria);

	// main페이지에서 총 견적서 갯수 가져오기
	int selecetMainTotal();

	List<EstimateDTO> selectEstimate(SelectCriteria selectCriteria);

}
