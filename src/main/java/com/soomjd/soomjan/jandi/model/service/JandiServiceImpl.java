package com.soomjd.soomjan.jandi.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.jandi.model.dao.JandiMapper;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

@Service
public class JandiServiceImpl implements JandiService{
	
	private final JandiMapper jandiMapper;
	
	@Autowired
	public JandiServiceImpl(JandiMapper jandiMapper) {
		this.jandiMapper = jandiMapper;
	}

	@Override
	public JandiDTO selectJandi(String email) {
		return jandiMapper.selectJandi(email);
	}

	@Override
	public List<Map<String, Object>> selectClassCodeList(JandiDTO jandi) {
		return jandiMapper.selectClassCodeList(jandi);
	}

	@Override
	public List<Map<String, Object>> selectCategoryList() {
		return jandiMapper.selectCategoryList();
	}

}
