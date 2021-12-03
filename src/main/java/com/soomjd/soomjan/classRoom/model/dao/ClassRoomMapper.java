package com.soomjd.soomjan.classRoom.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.classRoom.model.dto.ClassFileDTO;
import com.soomjd.soomjan.classRoom.model.dto.LearningPostDTO;
import com.soomjd.soomjan.classRoom.model.dto.MokchaDTO;

public interface ClassRoomMapper {
	
	ClassDTO selectClassByClassCode(int classCode);

	int selectCurrentCount(int classCode);

	List<MokchaDTO> selectMokchaList(int classCode);

	List<LearningPostDTO> selectLearningPostList(int classCode);

	List<ClassFileDTO> selectLearningFile(int postCode);
	
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


}
