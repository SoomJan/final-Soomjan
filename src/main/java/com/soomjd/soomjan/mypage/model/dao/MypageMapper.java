package com.soomjd.soomjan.mypage.model.dao;

import java.util.Map;

import com.soomjd.soomjan.member.model.dto.MemberDTO;

public interface MypageMapper {

	int modifyInfo(Map<String, String> map);

	MemberDTO selectNewMember(Map<String, String> map);

}
