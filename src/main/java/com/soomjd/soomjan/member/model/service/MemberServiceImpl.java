package com.soomjd.soomjan.member.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.member.model.dao.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper mapper;
	
	@Autowired
	public MemberServiceImpl(MemberMapper mapper) {
		this.mapper = mapper;
	}



	@Override
	public List<HashMap<String, Object>> selectTest() {
		
		return mapper.selectTest();
	}

}
