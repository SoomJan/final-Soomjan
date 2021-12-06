package com.soomjd.soomjan.jandi.model.service;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

public interface JandiService {

	JandiDTO selectJandi(String email);

	List<Map<String, Object>> selectClassCodeList(JandiDTO jandi);
	
	boolean updateProfileImage(Map<String,String> key);

	List<Map<String, Object>> selectCategoryList();

	boolean updateIntro(Map<String, Object> key);

}
