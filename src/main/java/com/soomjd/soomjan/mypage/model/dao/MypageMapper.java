package com.soomjd.soomjan.mypage.model.dao;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.manager.model.dto.ReportClassDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;
import com.soomjd.soomjan.mypage.model.dto.BuyDTO;
import com.soomjd.soomjan.mypage.model.dto.JjimDTO;
import com.soomjd.soomjan.mypage.model.dto.PurchaseClassDTO;
import com.soomjd.soomjan.mypage.model.dto.ReviewDTO;

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

	int insertReviewContent(Map<String, Object> reviewMap);

	int selectJjimTotalCount(Map<String, Object> searchMap);

	List<JjimDTO> selectJjimClass(Map<String, Object> searchMap);

	List<ReviewDTO> selectReviewContent(Map<String, Object> criteriaMap);
	
	int jjimCancel(Map<String, Object> map);

	int selectBuyTotalCount(Map<String, Object> searchMap);

	List<BuyDTO> selectBuyList(Map<String, Object> searchMap);

	int selectReviewTotalCount(Map<String, Object> searchMap);

	List<Map<String, Object>> selectReviewList(Map<String, Object> reviewMap);

	int endClass(List<PurchaseClassDTO> endClassList);

	int deleteReview(int rvCode);

	boolean registJandi(JandiDTO jandi);

	boolean updateMatched(String email);

	List<ReportClassDTO> selectReportClass(Map<String, String> map);

	int selectClassTotalCount(Map<String, String> map);

	int selectMemberTotalCount(Map<String, String> map);
	
	boolean modifyIsJandi(String email);

}
