package com.soomjd.soomjan.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.main.model.dao.MainMapper;

@Service
public class MainServiceImpl implements MainService {

	private MainMapper mapper;
	
	@Autowired
	public MainServiceImpl(MainMapper mapper) {
		this.mapper = mapper;
	}
	
	// 랜덤 잔디 조회
	@Override
	public List<JandiDTO> mainJandi() {
		return mapper.mainJandi();
	}

	// 뷰가 가장 많은 강의
	@Override
	public List<ClassDTO> viewClass() {
		return mapper.viewClass();
	}

	// 최근 등록된 강의
	@Override
	public List<ClassDTO> latestClass() {
		return mapper.latestClass();
	}

	// 곧 끝날 강의
	@Override
	public List<ClassDTO> almostfinish() {
		return mapper.almostfinish();
	}

	// 평점이 높은 강의
	@Override
	public List<ClassDTO> highScore() {
		return mapper.highScore();
	}

	// 가장 최근에 등록된 공지
	@Override
	public FaqDTO lastestFaq() {
		return mapper.lastestFaq();
	}

	// 메인 카로셀 광고
	@Override
	public List<ClassDTO> adClass() {
		return mapper.adClass();
	}

}
