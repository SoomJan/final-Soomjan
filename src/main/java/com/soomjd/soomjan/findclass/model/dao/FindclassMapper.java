package com.soomjd.soomjan.findclass.model.dao;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.findclass.model.dto.FindClassDTO;


public interface FindclassMapper {

	List<FindClassDTO> selectfindclass(Map<String, Object> searchMap);

	int selectFindClassTotalCount(Map<String, Object> searchMap);
}
