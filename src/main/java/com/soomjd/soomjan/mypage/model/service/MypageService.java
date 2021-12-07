package com.soomjd.soomjan.mypage.model.service;

import java.util.Map;

import com.soomjd.soomjan.member.model.dto.MemberDTO;

public interface MypageService {

	Boolean modifyInfo(Map<String, String> map);

	MemberDTO selectNewMember(Map<String, String> map);

}
