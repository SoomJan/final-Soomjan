package com.soomjd.soomjan.findJandi.model.service;

import java.util.List;

import com.soomjd.soomjan.findclass.model.dto.FindClassDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

public interface FindJandiService {

	List<JandiDTO> selectfindJandi();
	
	List<JandiDTO> mainJandi();

	List<JandiDTO> selectTopFindJandiList();

	JandiDTO selectJandiInfo(String email);
	
	List<FindClassDTO> selectThumbnailClassList(String email);
	
}
