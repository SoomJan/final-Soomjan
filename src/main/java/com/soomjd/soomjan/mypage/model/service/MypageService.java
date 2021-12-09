package com.soomjd.soomjan.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;
import com.soomjd.soomjan.mypage.model.dto.PurchaseClassDTO;

public interface MypageService {

	Boolean modifyInfo(Map<String, String> map);

	MemberDTO selectNewMember(Map<String, String> map);

	String selectEncPassword(Map<String, String> map);

	boolean modifyPwd(Map<String, String> map);

	boolean memberExit(Map<String, String> map);

	List<ReportMemberDTO> selectReportMember(Map<String, String> map);

	List<PurchaseClassDTO> selectTakingClass(Map<String, String> map);

}
