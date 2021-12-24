package com.soomjd.soomjan.main.model.service;

import java.util.List;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

public interface MainService {

	// 랜덤으로 잔디 보기
	List<JandiDTO> mainJandi();

	// 조회수가 가장 높은 강의
	List<ClassDTO> viewClass();

	// 가장 최근에 등록된 강의
	List<ClassDTO> latestClass();

	// 마감이 임박한 강의
	List<ClassDTO> almostfinish();

	// 평점이 높은 강의
	List<ClassDTO> highScore();
	
	// 가장 최근에 등록된 공지사항
	FaqDTO lastestFaq();

}
