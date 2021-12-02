package com.soomjd.soomjan.manager.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.manager.model.dao.ManagerMapper;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;

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

}
