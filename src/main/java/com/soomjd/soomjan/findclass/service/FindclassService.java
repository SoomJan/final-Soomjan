package com.soomjd.soomjan.findclass.service;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.findclass.model.dto.FindClassDTO;


public interface FindclassService {

	// Findclass 리스트 조회
	List<FindClassDTO> selectfindclass(Map<String, Object> searchMap);

	int selectFindClassTotalCount(Map<String, Object> searchMap);
}
