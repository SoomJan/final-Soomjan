package com.soomjd.soomjan.mypage.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.member.model.dto.MemberDTO;
import com.soomjd.soomjan.mypage.model.dao.MypageMapper;

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
	
	

}
