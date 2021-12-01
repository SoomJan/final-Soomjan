package com.soomjd.soomjan.jandi.model.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.classes.model.dto.ClassDTO;
import com.soomjd.soomjan.classes.model.dto.LearningPostDTO;
import com.soomjd.soomjan.classes.model.dto.MokchaDTO;
import com.soomjd.soomjan.jandi.model.dao.JandiClassMapper;

@Service
public class JandiClassServiceImpl implements JandiClassService{
	
	private final JandiClassMapper jandiClassMapper;
	
	@Autowired
	public JandiClassServiceImpl(JandiClassMapper jandiClassMapper) {
		this.jandiClassMapper = jandiClassMapper;
	}

	@Override
	public ClassDTO selectClassByClassCode(int classCode) {
		return jandiClassMapper.selectClassByClassCode(classCode);
	}

	@Override
	public int selectCurrentCount(int classCode) {
		return jandiClassMapper.selectCurrentCount(classCode);
	}

	@Override
	public List<MokchaDTO> selectMokchaList(int classCode) {
		return jandiClassMapper.selectMokchaList(classCode);
	}

	@Override
	public List<LearningPostDTO> selectLearningPostList(int classCode) {
		return jandiClassMapper.selectLearningPostList(classCode);
	}

	@Override
	public List<Map<String, Object>> selectChatRoomList(HashMap<String, Object> chatRoomMap) {
		return jandiClassMapper.selectChatRoomList(chatRoomMap);
	}

	

}
