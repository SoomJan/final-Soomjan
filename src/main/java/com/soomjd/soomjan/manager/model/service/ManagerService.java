package com.soomjd.soomjan.manager.model.service;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

public interface ManagerService {
	
	ManagerDTO loginManager(ManagerDTO manager) throws LoginFailedException;

	List<ManagerDTO> allManager(ManagerDTO manager);

	List<MemberDTO> ssackMember(SelectCriteria searchMap);

	List<JandiDTO> jandiMember(JandiDTO jandi);

	List<ManagerDTO> managerMember(ManagerDTO manager);

	int selectTotalCount(Map<String, String> searchMap);

	List<CategoryDTO> selectCategory(CategoryDTO category);

	boolean modifycategory(CategoryDTO category);

}
