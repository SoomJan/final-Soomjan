package com.soomjd.soomjan.findJandi.model.dao;

import java.util.List;


import com.soomjd.soomjan.common.paging.SelectCriteria;

import com.soomjd.soomjan.findclass.model.dto.FindClassDTO;

import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

public interface FindJandiMapper {


	List<JandiDTO> selectFindAllJandi(SelectCriteria selectCriteria);

	JandiDTO selectJandiInfo(String email);

	List<FindClassDTO> selectThumbnailClassList(String email);

	int SelectFindJandiTotalCount();

	List<JandiDTO> selectTopFindJandiList();

}
