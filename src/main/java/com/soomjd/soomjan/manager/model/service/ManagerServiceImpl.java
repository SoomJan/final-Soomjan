package com.soomjd.soomjan.manager.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.manager.model.dao.ManagerMapper;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

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
	public List<JandiDTO> jandiMember(JandiDTO jandi) {
		return mapper.jandiMember(jandi);
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
	public List<CategoryDTO> selectCategory(CategoryDTO category) {
		return mapper.selectCategory(category);
	}


	@Override
	public boolean modifycategory(CategoryDTO category) {
		return mapper.modifycategory(category)> 0? true:false;
	}

}
