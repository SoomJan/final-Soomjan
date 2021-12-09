package com.soomjd.soomjan.manager.model.dao;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

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

	int inactivemanager(String[] str);
	
}
