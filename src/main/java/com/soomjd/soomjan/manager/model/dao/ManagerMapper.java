package com.soomjd.soomjan.manager.model.dao;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.common.paging.SelectCriteriawithdate;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
import com.soomjd.soomjan.jandi.model.dto.CalculateDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.manager.model.dto.AdDTO;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;
import com.soomjd.soomjan.manager.model.dto.PurchaseAdDTO;
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

	// 공지사항 비활성화
	int disabledContents(int postCode);
	
	// 공지사항 활성화
	int enabledContents(int postCode);
		
	// 조건에 맞는 결제내역 찾기
	int PurchaseClassTotalCount(Map<String, String> searchMap);

	// 모든 결제 내역 조회(정산 처리용)
	List<PurchaseClassDTO> allContent();

	int selectReportSsackTotalCount(Map<String, String> searchMap);

	List<ReportMemberDTO> selectReportMemberList(SelectCriteria selectCriteria);

	List<ReportClassDTO> selectReportClassList(SelectCriteria selectCriteria);

	int selectReportClassTotalCount(Map<String, String> searchMap);

	ReportMemberDTO selectRepMemberList(int repCode);
	
	int modifyConfirmMember(ReportMemberDTO repMember);

	int modifySendbackMember(ReportMemberDTO repMember);

	int modifyConfirmClass(ReportClassDTO repClass);

	int modifySendbackClass(ReportClassDTO repClass);

	ReportClassDTO selectRepClass(int repCode);

	int modifyWarningCount(ReportClassDTO repClass);

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

	int selectBlackCount(Map<String, String> searchMap);

	List<MemberDTO> selectBlackMemberList(SelectCriteria selectCriteria);

	int updateBlackCancelMember(String email);

	int selectManagerTotalCount(ManagerDTO manager);

	// 광고 결제 내역 페이지
	int selectfinishadcalTotalCount(Map<String, String> searchMap);

	// 광고 결제 내역 페이지 처리
	List<PurchaseAdDTO> purchaseAd(SelectCriteria selectCriteria);

	// 현재 광고 내역
	List<AdDTO> nowAd();

	
}
