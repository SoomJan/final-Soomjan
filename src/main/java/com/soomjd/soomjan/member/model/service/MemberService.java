package com.soomjd.soomjan.member.model.service;

import java.util.Map;

import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

public interface MemberService {
	
	boolean registMember(MemberDTO member);
	
	boolean idDupCheck(Map<String, String> map);

	boolean nickDupCheck(Map<String, String> map);

	String findEmail(Map<String, String> map);

	boolean findPwd(Map<String, String> map);

	boolean updatePwd(Map<String, String> map);

	String selectEncPassword(Map<String, String> map);

	boolean selectEmail(Map<String, String> map);

	MemberDTO loginMember(Map<String, String> map);

	boolean mailCheckInsert(String authNum);

	int numberCheck();

	boolean checkUpdate(Map<String, String> map);

	boolean mailCheckUpdate(Map<String, String> map);

	int pwdCheck(String email);

	int selectJandiNickDupCheck(String nickName);

	double selectBlackDDay(String email);

	boolean modifyBlackStatus(String email);



}
