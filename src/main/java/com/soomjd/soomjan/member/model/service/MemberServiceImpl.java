package com.soomjd.soomjan.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.member.model.dao.MemberMapper;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper mapper;
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public MemberServiceImpl(MemberMapper mapper, BCryptPasswordEncoder passwordEncoder) {
		this.mapper = mapper;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public boolean registMember(MemberDTO member) {
		
		return mapper.insertMember(member) > 0? true:false;
	}


	@Override
	public MemberDTO loginMember(MemberDTO member) throws LoginFailedException {
		
		if(!passwordEncoder.matches(member.getPassword(), mapper.selectEncPassword(member))) {
			throw new LoginFailedException("로그인에 실패하셨습니다");
		}
		
		return mapper.selectMember(member);
	}


	@Override
	public boolean idDupCheck(Map<String, String> map) {
		
		return mapper.idDupCheck(map) > 0? true:false;
	}


	@Override
	public boolean nickDupCheck(Map<String, String> map) {
		
		return mapper.nickDupCheck(map) > 0? true:false;
	}


	@Override
	public String findEmail(Map<String, String> map) {
		
		String findEmail = mapper.findEmail(map);
		
		return findEmail;
	}

	@Override
	public boolean findPwd(Map<String, String> map) {
		
		return mapper.findPwd(map) > 0? true:false;
	}

	@Override
	public boolean updatePwd(Map<String, String> map) {
		
		return mapper.updatePwd(map) > 0? true:false;
	}

}
