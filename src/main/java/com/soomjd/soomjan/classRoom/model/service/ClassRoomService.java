package com.soomjd.soomjan.classRoom.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.classRoom.model.dto.ClassFileDTO;
import com.soomjd.soomjan.classRoom.model.dto.LearningPostDTO;
import com.soomjd.soomjan.classRoom.model.dto.MokchaDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

public interface ClassRoomService {
	
	ClassDTO selectClassByClassCode(int classCode);

	int selectCurrentCount(int classCode);

	List<MokchaDTO> selectMokchaList(int classCode);

	List<LearningPostDTO> selectLearningPostList(int classCode);
	
	List<Map<String, Object>> selectChatRoomList(HashMap<String, Object> chatRoomMap);

	int registClass(ClassDTO classDTO);

	int selectClassCode(String email);

	List<Map<String, Object>> selectClassCodeList(String email);

	int deleteClass(int classCode);

	int modifyClass(ClassDTO classDTO);

	int registLecture(MokchaDTO mokcha);

	int registLectureFile(ClassFileDTO classFile);

	int deleteLecture();

	LearningPostDTO selectPostByPostCode(int postCode);

	List<ClassFileDTO> selectLearningFileList(int postCode);

	List<ClassFileDTO> selectMokchaFileList(int classCode);

	int modifyLearnigPost(LearningPostDTO learningPost);

	int registLearningFile(ClassFileDTO classFile);

	boolean registLearnigPost(LearningPostDTO learningPost);

	int selectNewPostCode(LearningPostDTO learningPost);


}
