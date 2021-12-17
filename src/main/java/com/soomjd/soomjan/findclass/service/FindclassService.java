package com.soomjd.soomjan.findclass.service;

import java.util.List;

import com.soomjd.soomjan.jandi.model.dto.ClassesDTO;

public interface FindclassService {

	// Findclass 리스트 조회
	List<ClassesDTO> selectfindclass();
	
	List<ClassesDTO> mainClass();
}
