package com.soomjd.soomjan.jandi.model.dao;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

public interface JandiMapper {

	JandiDTO selectJandi(String email);

	List<Map<String, Object>> selectClassCodeList(JandiDTO jandi);

	int updateProfileImage(Map<String,String> key);

	List<Map<String, Object>> selectCategoryList();

}
