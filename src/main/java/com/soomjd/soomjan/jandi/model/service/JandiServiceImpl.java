package com.soomjd.soomjan.jandi.model.service;

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

}
