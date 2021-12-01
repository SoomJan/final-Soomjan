package com.soomjd.soomjan.jandi.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.classes.model.dto.ClassDTO;
import com.soomjd.soomjan.classes.model.dto.LearningPostDTO;
import com.soomjd.soomjan.classes.model.dto.MokchaDTO;

public interface JandiClassService {

	ClassDTO selectClassByClassCode(int classCode);

	int selectCurrentCount(int classCode);

	List<MokchaDTO> selectMokchaList(int classCode);

	List<LearningPostDTO> selectLearningPostList(int classCode);

	List<Map<String, Object>> selectChatRoomList(HashMap<String, Object> chatRoomMap);


}
