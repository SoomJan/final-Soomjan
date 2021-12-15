package com.soomjd.soomjan.faq.model.service;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;

public interface FaqService {

	// 공지사항 갯수 조회(페이징), 검색기능 없음
	int selectFaqTotalCount();
	
	// 공지사항 리스트 조회
	List<FaqDTO> selectnotice(SelectCriteria selectCriteria);

	List<ClassDTO> mainClass();

}
