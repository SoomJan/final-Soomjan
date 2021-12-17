package com.soomjd.soomjan.findclass.service;

import java.util.List;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;


public interface FindclassService {

	// Findclass 리스트 조회
	List<ClassDTO> selectfindclass();
	
	List<ClassDTO> mainClass();
}
