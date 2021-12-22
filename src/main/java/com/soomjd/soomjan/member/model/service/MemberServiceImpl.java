package com.soomjd.soomjan.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.member.model.dao.MemberMapper;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper mapper;
	
	@Autowired
	public MemberServiceImpl(MemberMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public boolean registMember(MemberDTO member) {
		
		return mapper.insertMember(member) > 0? true:false;
	}

	@Override
	public String selectEncPassword(Map<String, String> map) {
		
		return mapper.selectEncPassword(map);
	}
	
	@Override
	public boolean selectEmail(Map<String, String> map) {
		
		return mapper.selectEmail(map) > 0? true:false;
	}
	
	@Override
	public MemberDTO loginMember(Map<String, String> map) {
		
		return mapper.selectMember(map);
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

	@Override
	public boolean mailCheckInsert(String authNum) {
		
		return mapper.mailCheckInsert(authNum);
	}

	@Override
	public int numberCheck() {
		
		return mapper.numberCheck();
	}

	@Override
	public boolean checkUpdate(Map<String, String> map) {
		
		return mapper.checkUpdate(map) > 0? true:false;
	}

	@Override
	public boolean mailCheckUpdate(Map<String, String> map) {
		
		return mapper.mailCheckUpdate(map) > 0? true:false;
	}

	@Override
	public int pwdCheck(String email) {
		
		return mapper.pwdCheck(email);
	}



	

	

	

}
