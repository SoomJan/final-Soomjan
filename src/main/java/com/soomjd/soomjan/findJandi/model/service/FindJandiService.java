package com.soomjd.soomjan.findJandi.model.service;

import java.util.List;

import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

public interface FindJandiService {

	List<JandiDTO> selectfindJandi();
	
	List<JandiDTO> mainJandi();

	List<JandiDTO> selectTopFindJandiList();
}
