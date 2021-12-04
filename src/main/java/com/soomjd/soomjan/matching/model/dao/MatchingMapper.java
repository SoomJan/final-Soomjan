package com.soomjd.soomjan.matching.model.dao;

import java.util.List;

import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.matching.model.dto.EstimateDTO;

public interface MatchingMapper {

	int registEstimate(EstimateDTO estimate);

	List<CategoryDTO> selectCategory(CategoryDTO category);
}
