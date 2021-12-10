package com.soomjd.soomjan.mypage.model.dao;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;
import com.soomjd.soomjan.mypage.model.dto.PurchaseClassDTO;

public interface MypageMapper {

	int modifyInfo(Map<String, String> map);

	MemberDTO selectNewMember(Map<String, String> map);

	String selectEncPassword(Map<String, String> map);

	int modifyPwd(Map<String, String> map);

	int memberExit(Map<String, String> map);

	List<ReportMemberDTO> selectReportMember(Map<String, String> map);

	List<PurchaseClassDTO> selectTakingClass(Map<String, String> map);

	int selectFinishTotalCount(Map<String, String> searchMap);

	List<PurchaseClassDTO> finishClass(SelectCriteria searchMap);

}
