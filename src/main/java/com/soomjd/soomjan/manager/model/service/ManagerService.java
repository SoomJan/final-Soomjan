package com.soomjd.soomjan.manager.model.service;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.common.paging.SelectCriteriawithdate;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.mypage.model.dto.PurchaseClassDTO;

public interface ManagerService {
	
	ManagerDTO loginManager(ManagerDTO manager) throws LoginFailedException;

	List<ManagerDTO> allManager(ManagerDTO manager);

	List<MemberDTO> ssackMember(SelectCriteria searchMap);

	List<JandiDTO> jandiMember(SelectCriteria searchMap);

	List<ManagerDTO> managerMember(ManagerDTO manager);

	int selectTotalCount(Map<String, String> searchMap);

	boolean msregistMember(ManagerDTO manager);

	boolean emailCheck(Map<String, String> map);

	boolean nickNameCheck(Map<String, String> map);
	
	List<CategoryDTO> selectCategory(CategoryDTO category);

	boolean modifycategory(CategoryDTO category);

	CategoryDTO checkCategory(CategoryDTO category);

	boolean changeCategoryName(CategoryDTO category);

	// 공지사항 추가
	boolean addnotice(FaqDTO faq);
	
	// 공지사항 조회
	List<FaqDTO> selectnotice(SelectCriteria selectCriteria);

	// 관리자 측면 공지사항 세부내용 조회
	FaqDTO noticeDetail(FaqDTO noticeDetail);

	// 공지사항 수정 사항
	boolean modifyContents(FaqDTO faq);

	// 잔디멤버 리스트
	int selectTotalCount2(Map<String, String> searchMap);
	
	// 공지사항 갯수 조회 (페이징 처리)
	int selectFaqTotalCount(Map<String, String> searchMap);

	int inactiveManager(List<Integer> checkbox);

	// 모든 결제상황 조회(페이징, 검색처리)
	List<PurchaseClassDTO> selectPurchaseClass(SelectCriteriawithdate selectCriteriawithdate);

	// 결제 정보 갯수 조회(날짜, 검색 조건, 검색 내용)
	int PurchaseClassTotalCount(Map<String, String> searchMap);

}
