package com.soomjd.soomjan.main.model.dao;

import java.util.List;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

public interface MainMapper {

	List<JandiDTO> mainJandi();

	// 조회수가 가장 높은 강의
	List<ClassDTO> viewClass();

	// 최근에 등록된 강의
	List<ClassDTO> latestClass();

	// 마감 임박한 강의
	List<ClassDTO> almostfinish();

	// 평점이 높은 강의
	List<ClassDTO> highScore();

	// 가장 최근에 등록된 공지
	FaqDTO lastestFaq();
	
}
