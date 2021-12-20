package com.soomjd.soomjan.member.model.dao;

import java.util.Map;

import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

public interface MemberMapper {
	
	int insertMember(MemberDTO member);
	
	int idDupCheck(Map<String, String> map);

	int nickDupCheck(Map<String, String> map);

	String findEmail(Map<String, String> map);

	int findPwd(Map<String, String> map);

	int updatePwd(Map<String, String> map);

	boolean registJandi(JandiDTO jandi);

	boolean modifyIsJandi(String email);

	String selectEncPassword(Map<String, String> map);

	int selectEmail(Map<String, String> map);

	MemberDTO selectMember(Map<String, String> map);

	boolean mailCheckInsert(String authNum);

	int numberCheck();

	int checkUpdate(Map<String, String> map);

	int mailCheckUpdate(Map<String, String> map);

	int pwdCheck(String email);


}
