package com.soomjd.soomjan.findJandi.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.findJandi.model.dao.FindJandiMapper;
import com.soomjd.soomjan.findclass.model.dto.FindClassDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

@Service
public class FindJandiServiceImpl implements FindJandiService{

	private FindJandiMapper findJandiMapper;
	
	@Autowired
	public FindJandiServiceImpl(FindJandiMapper findJandiMapper) {
		this.findJandiMapper = findJandiMapper;
	}
	
	@Override
	public List<JandiDTO> selectfindJandi(SelectCriteria selectCriteria) {
		
		List<JandiDTO> jandiDTOList = findJandiMapper.selectFindJandi(selectCriteria);
		
		return jandiDTOList;
	}

	@Override
	public List<JandiDTO> selectTopFindJandiList() {
		// TODO Auto-generated method stub
		return null;
	}


	// 언제 실행 지 
	//  무엇이을 실행할건지 
	//  어떤 값을 받을건지 
	@Override
	public int SelectFindJandiTotalCount(Map<String, Object> searchMap) {
		
		int totalCount = findJandiMapper.SelectFindJandiTotalCount();
		return totalCount;
	}

	@Override
	public JandiDTO selectJandiInfo(String email) {
		return findJandiMapper.selectJandiInfo(email);
	}

	@Override
	public List<FindClassDTO> selectThumbnailClassList(String email) {
		return findJandiMapper.selectThumbnailClassList(email);

	}

	@Override
	public List<JandiDTO> mainJandi() {
		// TODO Auto-generated method stub
		return null;
	}



}
