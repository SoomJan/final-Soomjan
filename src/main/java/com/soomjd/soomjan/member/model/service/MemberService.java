package com.soomjd.soomjan.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

public interface MemberService {
	
	List<HashMap<String, Object>> selectTest();
	
	boolean registMember(MemberDTO member);
	
	MemberDTO loginMember(MemberDTO member) throws LoginFailedException;

	boolean idDupCheck(Map<String, String> map);

	boolean nickDupCheck(Map<String, String> map);

}
