package com.soomjd.soomjan.findJandi.model.service;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

public interface FindJandiService {

	List<JandiDTO> selectfindJandi(SelectCriteria selectCriteria);
	
	List<JandiDTO> mainJandi();

	List<JandiDTO> selectTopFindJandiList();

	int SelectFindJandiTotalCount(Map<String, Object> searchMap);
}
