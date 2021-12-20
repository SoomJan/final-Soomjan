package com.soomjd.soomjan.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.main.model.dao.MainMapper;

@Service
public class MainServiceImpl implements MainService {

	private MainMapper mapper;
	
	@Autowired
	public MainServiceImpl(MainMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public List<JandiDTO> mainJandi() {
		return mapper.mainJandi();
	}

	@Override
	public List<ClassDTO> viewClass() {
		return mapper.viewClass();
	}

	@Override
	public List<ClassDTO> latestClass() {
		return mapper.latestClass();
	}

}
