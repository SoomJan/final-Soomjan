package com.soomjd.soomjan.findJandi.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.findJandi.model.dao.FindJandiMapper;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

@Service
public class FindJandiServiceImpl implements FindJandiService{

	private FindJandiMapper findJandiMapper;
	
	@Autowired
	public FindJandiServiceImpl(FindJandiMapper findJandiMapper) {
		this.findJandiMapper = findJandiMapper;
	}
	
	@Override
	public List<JandiDTO> selectfindJandi() {
		
		List<JandiDTO> jandiDTOList = findJandiMapper.selectFindJandi();
		
		return jandiDTOList;
	}

	@Override
	public List<JandiDTO> mainJandi() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<JandiDTO> selectTopFindJandiList() {
		// TODO Auto-generated method stub
		return null;
	}

}
