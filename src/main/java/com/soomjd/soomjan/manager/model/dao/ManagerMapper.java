package com.soomjd.soomjan.manager.model.dao;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.common.paging.SelectCriteriawithdate;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
import com.soomjd.soomjan.jandi.model.dto.CalculateDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;
import com.soomjd.soomjan.manager.model.dto.ReportClassDTO;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;
import com.soomjd.soomjan.mypage.model.dto.PurchaseClassDTO;

public interface ManagerMapper {

	String selectEncPassword(ManagerDTO manager);
	
	ManagerDTO selectManager(ManagerDTO manager);

	List<ManagerDTO> allManager(ManagerDTO manager);

	List<MemberDTO> ssackMember(SelectCriteria searchMap);

	List<ManagerDTO> managerMember(ManagerDTO manager);

	int selectSsackTotalCount(Map<String, String> searchMap);
	
	int selectJandiTotalCount(Map<String, String> searchMap);

	int emailCheck(Map<String, String> map);

	int nickNameCheck(Map<String, String> map);

	List<CategoryDTO> selectCategory(CategoryDTO category);

	int modifycategory(CategoryDTO category);

	CategoryDTO checkCategory(CategoryDTO category);

	int changeCategoryName(CategoryDTO category);

	int addnotice(FaqDTO faq);

	List<FaqDTO> selectnotice(SelectCriteria selectCriteria);

	FaqDTO noticeDetail(FaqDTO noticeDetail);

	boolean modifyContents(FaqDTO faq);

	int registMsMember(ManagerDTO manager);

	List<JandiDTO> jandiMember(SelectCriteria searchMap);

	int selectTotalCount2(Map<String, String> searchMap);
	
	int selectFaqTotalCount(Map<String, String> searchMap);

	int inactivemanager(List<Integer> checkbox);

	// 결제내역 조회(페이징, 날짜, 검색)
	List<PurchaseClassDTO> selectPurchaseClass(SelectCriteriawithdate selectCriteriawithdate);

	// 조건에 맞는 결제내역 찾기
	int PurchaseClassTotalCount(Map<String, String> searchMap);

	// 모든 결제 내역 조회(정산 처리용)
	List<PurchaseClassDTO> allContent();

	// 신고된 멤버 수
	int selectReportSsackTotalCount(Map<String, String> searchMap);

	// 신고된 멤버 조회
	List<ReportMemberDTO> selectReportMemberList(SelectCriteria selectCriteria);

	List<ReportClassDTO> selectReportClassList(SelectCriteria selectCriteria);

	int selectReportClassTotalCount(Map<String, String> searchMap);

	
	/**
	 * 신고된 멤버 상세 조회
	 */
	ReportMemberDTO selectRepMemberList(int repCode);
	
	// 신고된 멤버 신고 처리
	int modifyConfirmMember(ReportMemberDTO repMember);

	// 신고된 멤버 반려 처리
	int modifySendbackMember(ReportMemberDTO repMember);

	// 신고된 클래스 신고처리
	int modifyConfirmClass(ReportClassDTO repClass);

	// 신고된 클래스 반려처리
	int modifySendbackClass(ReportClassDTO repClass);

	// 신고된 클래스 상세조회
	ReportClassDTO selectRepClass(int repCode);

	// 신고된 클래스를 가진 회원 경고 처리
	int modifyWarningCount(ReportClassDTO repClass);

	// 신고된 회원의 경고 및 블랙리스트 여부 
	MemberDTO selectRepMember(ReportMemberDTO repMember);

	int updateMemberWarning(MemberDTO member);

	int updateMemberBlack(MemberDTO member);

	Map<String, Object> selectReportClass(ReportClassDTO repClass);

	int updateClassWarning(Map<String, Object> claMap);

	int updateClassBlack(Map<String, Object> claMap);

	JandiDTO selectJandiMember(String email);
	// 정산이 되었는지 아닌지 확인 (Y, N)
	int classcal(CalculateDTO calculate);

	// 정산된 결제 갯수(페이지 처리)
	int finishClassTotalCount(Map<String, String> searchMap);

	// 정산된 내역 List 불러오기
	List<PurchaseClassDTO> selectfinishClass(SelectCriteriawithdate selectCriteriawithdate);

	
	/**
	 * 블랙리스트 회원 수 조회
	 * @return
	 */
	int selectBlackCount(Map<String, String> searchMap);

	
	/**
	 * 블랙리스트 회원 조회
	 * @return
	 */
	List<MemberDTO> selectBlackMemberList(SelectCriteria selectCriteria);

	
	/**
	 * 블랙리스트 해지
	 * @author 효진
	 */
	int updateBlackCancelMember(String email);

	/**
	 * 블랙리스트 회원인지 아닌지 확인
	 * @author 효진
	 */
	boolean isBlackCheck(Map<String, String> checkMap);

	
}
