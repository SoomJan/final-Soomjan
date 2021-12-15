package com.soomjd.soomjan.mypage.model.dao;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;
import com.soomjd.soomjan.mypage.model.dto.BuyDTO;
import com.soomjd.soomjan.mypage.model.dto.JjimDTO;
import com.soomjd.soomjan.mypage.model.dto.PurchaseClassDTO;

public interface MypageMapper {

	int modifyInfo(Map<String, String> map);

	MemberDTO selectNewMember(Map<String, String> map);

	String selectEncPassword(Map<String, String> map);

	int modifyPwd(Map<String, String> map);

	int memberExit(Map<String, String> map);

	List<ReportMemberDTO> selectReportMember(Map<String, String> map);

	List<PurchaseClassDTO> selectTakingClass(Map<String, Object> map);

	int selectTakingTotalCount(Map<String, Object> searchMap);

	int selectFinishTotalCount(Map<String, String> searchMap);

	List<PurchaseClassDTO> finishClass(Map<String, Object> criteriaMap);

	List<PurchaseClassDTO> selectReviewClass(Map<String, Object> reviewMap);

	List<PurchaseClassDTO> insertReviewContent(Map<String, Object> reviewMap);

	int selectJjimTotalCount(Map<String, Object> searchMap);

	List<JjimDTO> selectJjimClass(Map<String, Object> searchMap);

	int jjimCancel(Map<String, Object> map);

	int selectBuyTotalCount(Map<String, Object> searchMap);

	List<BuyDTO> selectBuyList(Map<String, Object> searchMap);

}
