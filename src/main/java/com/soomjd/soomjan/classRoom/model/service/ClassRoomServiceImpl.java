package com.soomjd.soomjan.classRoom.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.classRoom.model.dao.ClassRoomMapper;
import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.classRoom.model.dto.ClassFileDTO;
import com.soomjd.soomjan.classRoom.model.dto.ClassPurchaseDTO;
import com.soomjd.soomjan.classRoom.model.dto.LearningPostDTO;
import com.soomjd.soomjan.classRoom.model.dto.MokchaDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;

@Service
public class ClassRoomServiceImpl implements ClassRoomService {

	private final ClassRoomMapper classRoomMapper;

	@Autowired
	public ClassRoomServiceImpl(ClassRoomMapper classRoomMapper) {
		this.classRoomMapper = classRoomMapper;
	}

	@Override
	public ClassDTO selectClassByClassCode(int classCode) {
		return classRoomMapper.selectClassByClassCode(classCode);
	}

	@Override
	public List<Map<String, String>> selectCurrentMemberList(int classCode) {
		return classRoomMapper.selectCurrentMemberList(classCode);
	}

	
	 @Override public List<MokchaDTO> selectMokchaList(int classCode) { 
		 return classRoomMapper.selectMokchaList(classCode); 
	 }
	 

	
	 @Override public List<LearningPostDTO> selectLearningPostList(int classCode) { 
		 return classRoomMapper.selectLearningPostList(classCode); 
	 }
	 

	@Override
	public List<Map<String, Object>> selectChatRoomList(HashMap<String, Object> chatRoomMap) {
		return classRoomMapper.selectChatRoomList(chatRoomMap);
	}

	@Override
	public int registClass(ClassDTO classDTO) {
		return classRoomMapper.registClass(classDTO);
	}

	@Override
	public int selectClassCode(String email) {
		return classRoomMapper.selectClassCode(email);
	}

	@Override
	public List<Map<String, Object>> selectClassCodeList(String email) {
		return classRoomMapper.selectClassCodeList(email);
	}

	@Override
	public int deleteClass(int classCode) {
		return classRoomMapper.deleteClass(classCode);
	}

	@Override
	public int modifyClass(ClassDTO classDTO) {
		return classRoomMapper.modifyClass(classDTO);
	}

	@Override
	public int registLecture(MokchaDTO mokcha) {
		return classRoomMapper.registLecture(mokcha);
	}

	@Override
	public int registLectureFile(ClassFileDTO classFile) {
		return classRoomMapper.registLectureFile(classFile);
	}

	@Override
	public int deleteLecture() {
		return classRoomMapper.deleteLecture();

	}

	@Override
	public LearningPostDTO selectPostByPostCode(int postCode) {
		return classRoomMapper.selectPostByPostCode(postCode);
	}

	@Override
	public List<ClassFileDTO> selectLearningFileList(int postCode) {
		return classRoomMapper.selectLearningFileList(postCode);
	}

	@Override
	public List<ClassFileDTO> selectMokchaFileList(int classCode) {
		return classRoomMapper.selectMokchaFileList(classCode);
	}

	@Override
	public int modifyLearnigPost(LearningPostDTO learningPost) {
		return classRoomMapper.modifyLearnigPost(learningPost);
	}

	@Override
	public int registLearningFile(ClassFileDTO classFile) {
		return classRoomMapper.registLearningFile(classFile);
	}

	@Override
	public boolean registLearnigPost(LearningPostDTO learningPost) {
		return classRoomMapper.registLearnigPost(learningPost);
	}

	@Override
	public int selectNewPostCode(LearningPostDTO learningPost) {
		return classRoomMapper.selectNewPostCode(learningPost);
	}

	@Override
	public int modifyClassFile(ClassDTO classDTO) {
		return classRoomMapper.modifyClassFile(classDTO);
	}

	@Override
	public boolean modifyLectureIsDeleted(int mokchaCode) {
		return classRoomMapper.modifyLectureIsDeleted(mokchaCode);
	}

	@Override
	public boolean modifyLectureFileIsDeleted(int mokchaCode) {
		return classRoomMapper.modifyLectureFileIsDeleted(mokchaCode);
	}

	@Override
	public List<ClassFileDTO> selectMokchaFileListByMokchaCode(int mokchaCode) {
		return classRoomMapper.selectMokchaFileListByMokchaCode(mokchaCode);
	}

	@Override
	public boolean modifyLearnigPostIsDeleted(int postCode) {
		return classRoomMapper.modifyLearnigPostIsDeleted(postCode);
	}

	@Override
	public boolean modifyLearningFileIsDeleted(int postCode) {
		return classRoomMapper.modifyLearningFileIsDeleted(postCode);
	}

	@Override
	public List<ClassFileDTO> selectLearningFileListByPostCode(int postCode) {
		return classRoomMapper.selectLearningFileListByPostCode(postCode);
	}

	@Override
	public boolean registPurchaseClass(ClassPurchaseDTO classPurchase) {
		return classRoomMapper.registPurchaseClass(classPurchase);
	}

	@Override
	public boolean registChatRoom(HashMap<String, Object> chatRoomMap) {
		return classRoomMapper.registChatRoom(chatRoomMap);
	}

	@Override
	public int selectClassChatBySSACKEmail(HashMap<String, Object> chatRoomMap) {
		return classRoomMapper.selectClassChatBySSACKEmail(chatRoomMap);
	}

	@Override
	public boolean registReportMember(ReportMemberDTO reportMember) {
		return classRoomMapper.registReportMember(reportMember);
	}

	@Override
	public List<Map<String, Object>> selectAllReportStatement() {
		return classRoomMapper.selectAllReportStatement();
	}

	@Override
	public int selectLearningBoardTotalCount(Map<String, Object> searchMap) {
		return classRoomMapper.selectLearningBoardTotalCount(searchMap);
	}

	@Override
	public List<Map<String, Object>> selectLearningBoardList(Map<String, Object> learningMap) {
		return classRoomMapper.selectLearningBoardList(learningMap);
	}

	@Override
	public int selectClassLectureTotalCount(Map<String, Object> searchMap) {
		return classRoomMapper.selectClassLectureTotalCount(searchMap);
	}

	@Override
	public List<Map<String, Object>> selectLectureList(Map<String, Object> lectureMap) {
		return classRoomMapper.selectLectureList(lectureMap);
	}

}
