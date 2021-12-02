package com.soomjd.soomjan.member.model.dao;

import java.util.HashMap;
import java.util.List;

import com.soomjd.soomjan.member.model.dto.MemberDTO;

public interface MemberMapper {
	
	List<HashMap<String, Object>> selectTest();
	
	int insertMember(MemberDTO member);
	
	String selectEncPassword(MemberDTO member);
	
	MemberDTO selectMember(MemberDTO member);
	
	

}
