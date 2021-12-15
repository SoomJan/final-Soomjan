package com.soomjd.soomjan.faq.model.dao;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;

public interface FaqMapper {

	// 공지사항 조회 페이징 처리
	int selectFaqTotalCount();

	// 공지사항 리스트 조회
	List<FaqDTO> selectnotice(SelectCriteria selectCriteria);

	List<ClassDTO> mainClass();

}
