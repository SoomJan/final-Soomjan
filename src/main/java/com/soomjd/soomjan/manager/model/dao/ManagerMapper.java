package com.soomjd.soomjan.manager.model.dao;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.common.paging.SelectCriteriawithdate;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.mypage.model.dto.PurchaseClassDTO;

public interface ManagerMapper {

	String selectEncPassword(ManagerDTO manager);
	
	ManagerDTO selectManager(ManagerDTO manager);

	List<ManagerDTO> allManager(ManagerDTO manager);

	List<MemberDTO> ssackMember(SelectCriteria searchMap);

	List<ManagerDTO> managerMember(ManagerDTO manager);

	int selectTotalCount(Map<String, String> searchMap);

	int emailCheck(Map<String, String> map);

	int nickNameCheck(Map<String, String> map);

	List<CategoryDTO> selectCategory(CategoryDTO category);

	int modifycategory(CategoryDTO category);

	CategoryDTO checkCategory(CategoryDTO category);

	int changeCategoryName(CategoryDTO category);

	int addnotice(FaqDTO faq);

	List<FaqDTO> selectnotice(SelectCriteria selectCriteria);

	FaqDTO noticeDetail(FaqDTO noticeDetail);

	boolean modifyContents(FaqDTO faq);

	int registMsMember(ManagerDTO manager);

	List<JandiDTO> jandiMember(SelectCriteria searchMap);

	int selectTotalCount2(Map<String, String> searchMap);
	
	int selectFaqTotalCount(Map<String, String> searchMap);

	int inactivemanager(List<Integer> checkbox);

	// 모든 결제내역 조회(페이징, 날짜, 검색)
	List<PurchaseClassDTO> selectPurchaseClass(SelectCriteriawithdate selectCriteriawithdate);

	// 조건에 맞는 결제내역 찾기
	int PurchaseClassTotalCount(Map<String, String> searchMap);
	
}
