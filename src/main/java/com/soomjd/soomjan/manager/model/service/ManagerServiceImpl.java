package com.soomjd.soomjan.manager.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.common.paging.SelectCriteriawithdate;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
import com.soomjd.soomjan.jandi.model.dto.CalculateDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.manager.model.dao.ManagerMapper;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;
import com.soomjd.soomjan.manager.model.dto.ReportClassDTO;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;
import com.soomjd.soomjan.mypage.model.dto.PurchaseClassDTO;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	private ManagerMapper mapper;
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public ManagerServiceImpl(ManagerMapper mapper, BCryptPasswordEncoder passwordEncoder) {
		this.mapper = mapper;
		this.passwordEncoder = passwordEncoder;
	}
	

	@Override
	public ManagerDTO loginManager(ManagerDTO manager) throws LoginFailedException {
	
		if(!passwordEncoder.matches(manager.getPassword(), mapper.selectEncPassword(manager))) {
			throw new LoginFailedException("로그인에 실패하셨습니다");
		}
		
		return mapper.selectManager(manager);
	}


	@Override
	public List<ManagerDTO> allManager(ManagerDTO manager) {
		
		return mapper.allManager(manager);
	}

	// 잔디 멤버 리스트 조회하기
	@Override
	public List<JandiDTO> jandiMember(SelectCriteria searchMap) {
		return mapper.jandiMember(searchMap);
	}

	// 관리자 계정 리스트 조회하기
	@Override
	public List<ManagerDTO> managerMember(ManagerDTO manager) {
		return mapper.managerMember(manager);
	}

	// 새싹 멤버 전체 회원 수 확인하기
	@Override
	public int selectSsackTotalCount(Map<String, String> searchMap) {
		return mapper.selectSsackTotalCount(searchMap);
	}
	
	// 잔디 멤버 전체 회원 수 확인하기
	@Override
	public int selectJandiTotalCount(Map<String, String> searchMap) {
		return mapper.selectJandiTotalCount(searchMap);
	}

	// 새싹 멤버 조회하기
	@Override
	public List<MemberDTO> ssackMember(SelectCriteria searchMap) {
		return mapper.ssackMember(searchMap);
	}

	// 관리자 계정 생성하기
	@Override
	public boolean msregistMember(ManagerDTO manager) {
		return mapper.registMsMember(manager) > 0? true:false;
	}

	// 관리자 계정 생성 시 이메일 중복 확인하기
	@Override
	public boolean emailCheck(Map<String, String> map) {
		return mapper.emailCheck(map) > 0? true:false;
	}

	// 관리자 계정 생성 시 닉네임 중복 확인하기
	@Override
	public boolean nickNameCheck(Map<String, String> map) {
		return mapper.nickNameCheck(map) > 0? true:false;

	}
	
	@Override
	public List<CategoryDTO> selectCategory(CategoryDTO category) {
		return mapper.selectCategory(category);
	}


	// 카테고리 수정(1 or 0)
	@Override
	public boolean modifycategory(CategoryDTO category) {
		return mapper.modifycategory(category)> 0? true:false;
	}


	@Override
	public CategoryDTO checkCategory(CategoryDTO category) {
		return mapper.checkCategory(category);
	}


	@Override
	public boolean changeCategoryName(CategoryDTO category) {
		return mapper.changeCategoryName(category)> 0? true:false;
	}


	@Override
	public boolean addnotice(FaqDTO faq) {
		return mapper.addnotice(faq)> 0? true:false;
	}


	// 공지사항 조회
	@Override
	public List<FaqDTO> selectnotice(SelectCriteria selectCriteria) {
		return mapper.selectnotice(selectCriteria);
	}

	// 관리자 측면 공지사항 세부내용 조회
	@Override
	public FaqDTO noticeDetail(FaqDTO noticeDetail) {
		return mapper.noticeDetail(noticeDetail);
	}

	// 공지사항 수정
	@Override
	public boolean modifyContents(FaqDTO faq) {
		return mapper.modifyContents(faq);
	}


	@Override
	public int selectTotalCount2(Map<String, String> searchMap) {
		return mapper.selectTotalCount2(searchMap);
	}
	
	// 공지사항 갯수 조회(페이징 처리)
	@Override
	public int selectFaqTotalCount(Map<String, String> searchMap) {
		return mapper.selectFaqTotalCount(searchMap);
	}
	
	// 공지사항 비활성화
	@Override
	public boolean disabledContents(int postCode) {
		return mapper.disabledContents(postCode)>0? true : false;
	}

	// 매니저 활성화
	@Override
	public boolean enabledContents(int postCode) {
		return mapper.enabledContents(postCode)>0? true : false;
	}
	@Override
	public int inactiveManager(List<Integer> checkbox) {
		return mapper.inactivemanager(checkbox);
	}

	// 결제내역 조회(페이징, 날짜, 검색)
	@Override
	public List<PurchaseClassDTO> selectPurchaseClass(SelectCriteriawithdate selectCriteriawithdate) {
		return mapper.selectPurchaseClass(selectCriteriawithdate);
	}

	// 결제 정보 갯수 조회(날짜, 검색 조건, 검색 내용)
	@Override
	public int PurchaseClassTotalCount(Map<String, String> searchMap) {
		return mapper.PurchaseClassTotalCount(searchMap);
	}


	// 모든 결제 내역 조회(정산 처리용)
	@Override
	public List<PurchaseClassDTO> allContent() {
		return mapper.allContent();
	}

	// 신고된 회원 전체 수 확인하기
	@Override
	public int selectReportSsackTotalCount(Map<String, String> searchMap) {
		return mapper.selectReportSsackTotalCount(searchMap);
	}

	// 신고된 회원 리스트 조회하기
	@Override
	public List<ReportMemberDTO> selectReportMember(SelectCriteria selectCriteria) {
		return mapper.selectReportMemberList(selectCriteria);
	}

	// 신고된 클래스 리스트 조회하기
	@Override
	public List<ReportClassDTO> selectReportClass(SelectCriteria selectCriteria) {
		return mapper.selectReportClassList(selectCriteria);
	}

	// 신고된 클래스 전체 수 확인하기
	@Override
	public int selectReportClassTotalCount(Map<String, String> searchMap) {
		return mapper.selectReportClassTotalCount(searchMap);
	}

	// 신고된 회원 상세내용 확인하기
	@Override
	public ReportMemberDTO selectRepMember(int repCode) {
		return mapper.selectRepMemberList(repCode);
	}

	// 신고된 회원 신고처리하기
	@Override
	public int modifyConfirmMember(ReportMemberDTO repMember) {
		return mapper.modifyConfirmMember(repMember);
	}

	// 신고된 회원 반려처리 하기
	@Override
	public int modifySendbackMember(ReportMemberDTO repMember) {
		return mapper.modifySendbackMember(repMember);
	}

	// 신고된 클래스 신고처리하기
	@Override
	public int modifyConfirmClass(ReportClassDTO repClass) {
		return mapper.modifyConfirmClass(repClass);
	}

	// 신고된 클래스 반려처리하기
	@Override
	public int modifySendbackClass(ReportClassDTO repClass) {
		return mapper.modifySendbackClass(repClass);
	}

	// 신고 처리 후 신고된 클래스 조회하기
	@Override
	public ReportClassDTO selectRepClass(int repCode) {
		return mapper.selectRepClass(repCode);
	}

	// 신고처리 된 클래스를 올린 회원 경고 수 확인하기
	@Override
	public int modifyWarningCount(ReportClassDTO repClass) {
		return mapper.modifyWarningCount(repClass);
	}

	// 신고처리 후 신고된 회원 조회하기
	@Override
	public MemberDTO selectRepMember(ReportMemberDTO repMember) {
		return mapper.selectRepMember(repMember);
	}

	// 신고처리 된 회원 경고 +1 처리하기
	@Override
	public int updateMemberWarning(MemberDTO member) {
		return mapper.updateMemberWarning(member);
	}

	// 경고 3회 된 회원 블랙리스트 회원 처리하기
	@Override
	public int updateMemberBlack(MemberDTO member) {
		return mapper.updateMemberBlack(member);
	}

	// 신고된 클래스 조회
	@Override
	public Map<String, Object> selectReportClass(ReportClassDTO repClass) {
		return mapper.selectReportClass(repClass);
	}

	// 신고된 클래스를 올린 회원 경고 +1 처리하기
	@Override
	public int updateClassWarning(Map<String, Object> claMap) {
		return mapper.updateClassWarning(claMap);
	}

	// 경고 3회 된 잔디 블랙리스트 회원으로 변경하기
	@Override
	public int updateClassBlack(Map<String, Object> claMap) {
		return mapper.updateClassBlack(claMap);
	}


	@Override
	public JandiDTO selectJandiMember(String email) {
		return mapper.selectJandiMember(email);
	}
	
	// 정산이 되었는지 아닌지 확인 (Y, N)
	@Override
	public boolean classcal(CalculateDTO calculate) {
		return mapper.classcal(calculate)> 0? true:false;
	}


	//정산된 내역페이지 처리
	@Override
	public int finishClassTotalCount(Map<String, String> searchMap) {
		return mapper.finishClassTotalCount(searchMap);
	}


	// 정산된 내역 List 불러오기
	@Override
	public List<PurchaseClassDTO> selectfinishClass(SelectCriteriawithdate selectCriteriawithdate) {
		return mapper.selectfinishClass(selectCriteriawithdate);
	}

	// 블랙리스트 전체 회원 수 확인하기
	@Override
	public int selectBlackCount(Map<String, String> searchMap) {
		return mapper.selectBlackCount(searchMap);
	}


	// 블랙리스트 멤버 조회하기
	@Override
	public List<MemberDTO> selectBlackMemberList(SelectCriteria selectCriteria) {
		return mapper.selectBlackMemberList(selectCriteria);
	}


	// 블랙리스트 해지하기
	@Override
	public int updateBlackCancelMember(String email) {
		return mapper.updateBlackCancelMember(email);
	}


	@Override
	public int selectManagerTotalCount(ManagerDTO manager) {
		return mapper.selectManagerTotalCount(manager);
	}



}
