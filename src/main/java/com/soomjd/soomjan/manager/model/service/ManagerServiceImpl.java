package com.soomjd.soomjan.manager.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.common.paging.SelectCriteriawithdate;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;
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

	@Override
	public List<JandiDTO> jandiMember(SelectCriteria searchMap) {
		return mapper.jandiMember(searchMap);
	}


	@Override
	public List<ManagerDTO> managerMember(ManagerDTO manager) {
		return mapper.managerMember(manager);
	}


	@Override
	public int selectTotalCount(Map<String, String> searchMap) {
		return mapper.selectTotalCount(searchMap);
	}


	@Override
	public List<MemberDTO> ssackMember(SelectCriteria searchMap) {
		return mapper.ssackMember(searchMap);
	}


	@Override
	public boolean msregistMember(ManagerDTO manager) {
		return mapper.registMsMember(manager) > 0? true:false;
	}


	@Override
	public boolean emailCheck(Map<String, String> map) {
		return mapper.emailCheck(map) > 0? true:false;
	}


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


	@Override
	public int selectReportSsackTotalCount(Map<String, String> searchMap) {
		return mapper.selectReportSsackTotalCount(searchMap);
	}


	@Override
	public List<ReportMemberDTO> selectReportMember(SelectCriteria selectCriteria) {
		return mapper.selectReportMemberList(selectCriteria);
	}


	@Override
	public List<ReportClassDTO> selectReportClass(SelectCriteria selectCriteria) {
		return mapper.selectReportClassList(selectCriteria);
	}


	@Override
	public int selectReportClassTotalCount(Map<String, String> searchMap) {
		return mapper.selectReportClassTotalCount(searchMap);
	}


	@Override
	public ReportMemberDTO selectRepMember(int repCode) {
		return mapper.selectRepMemberList(repCode);
	}

}
