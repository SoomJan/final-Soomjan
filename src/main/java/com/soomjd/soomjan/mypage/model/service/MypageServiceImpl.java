package com.soomjd.soomjan.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;
import com.soomjd.soomjan.mypage.model.dao.MypageMapper;
import com.soomjd.soomjan.mypage.model.dto.BuyDTO;
import com.soomjd.soomjan.mypage.model.dto.JjimDTO;
import com.soomjd.soomjan.mypage.model.dto.PurchaseClassDTO;
import com.soomjd.soomjan.mypage.model.dto.ReviewDTO;

@Service
public class MypageServiceImpl implements MypageService{
	
	private MypageMapper mapper;
	
	@Autowired
	public MypageServiceImpl(MypageMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public Boolean modifyInfo(Map<String, String> map) {
		
		return mapper.modifyInfo(map) > 0? true:false;
	}

	@Override
	public MemberDTO selectNewMember(Map<String, String> map) {
		
		MemberDTO newMember = mapper.selectNewMember(map);
		
		return newMember;
	}

	@Override
	public String selectEncPassword(Map<String, String> map) {
		
		String encPwd = mapper.selectEncPassword(map);
		
		return encPwd;
	}

	@Override
	public boolean modifyPwd(Map<String, String> map) {
		
		return mapper.modifyPwd(map) > 0? true:false;
	}

	@Override
	public boolean memberExit(Map<String, String> map) {
		
		return mapper.memberExit(map) > 0? true:false;
	}

	@Override
	public List<ReportMemberDTO> selectReportMember(Map<String, String> map) {
		
		List<ReportMemberDTO> reportMember = mapper.selectReportMember(map);
		
		return reportMember;
	}

	@Override
	public List<PurchaseClassDTO> selectTakingClass(Map<String, Object> map) {
		
		List<PurchaseClassDTO> pClass = mapper.selectTakingClass(map);
		
		return pClass;
	}

	@Override
	public int selectFinishTotalCount(Map<String, String> searchMap) {
		return mapper.selectFinishTotalCount(searchMap);
	}

	@Override
	public List<PurchaseClassDTO> finishClass(Map<String, Object> criteriaMap) {
		return mapper.finishClass(criteriaMap);
	}
	
	@Override
	public int selectTakingTotalCount(Map<String, Object> searchMap) {
		return mapper.selectTakingTotalCount(searchMap);
	}

	@Override
	public List<PurchaseClassDTO> finishReviewClass(Map<String, Object> reviewMap) {
		return mapper.selectReviewClass(reviewMap);
	}

	@Override
	public int insertReviewContent(Map<String, Object> reviewMap) {
		return mapper.insertReviewContent(reviewMap);
	}
	
	@Override
	public int selectJjimTotalCount(Map<String, Object> searchMap) {
		
		return mapper.selectJjimTotalCount(searchMap);
	}

	@Override
	public List<JjimDTO> selectJjimClass(Map<String, Object> searchMap) {
		
		return mapper.selectJjimClass(searchMap);
	}

	@Override
	public int jjimCancel(Map<String, Object> map) {
		
		return mapper.jjimCancel(map);
	}

	@Override
	public int selectBuyTotalCount(Map<String, Object> searchMap) {
		
		return mapper.selectBuyTotalCount(searchMap);
	}

	@Override
	public List<BuyDTO> selectBuyList(Map<String, Object> searchMap) {
		
		return mapper.selectBuyList(searchMap);
	}

	@Override
	public int selectReviewTotalCount(Map<String, Object> searchMap) {
		
		return mapper.selectReviewTotalCount(searchMap);
	}

	@Override
	public List<Map<String, Object>> selectReviewList(Map<String, Object> reviewMap) {
		return mapper.selectReviewList(reviewMap);
	}

	@Override
	public int endClass(List<PurchaseClassDTO> endClassList) {
		
		return mapper.endClass(endClassList);
	}

	@Override
	public int deleteReview(int rvCode) {
		return mapper.deleteReview(rvCode);
	}
	
	

}
