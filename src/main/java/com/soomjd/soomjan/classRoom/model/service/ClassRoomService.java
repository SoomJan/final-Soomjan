package com.soomjd.soomjan.classRoom.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.classRoom.model.dto.ClassFileDTO;
import com.soomjd.soomjan.classRoom.model.dto.ClassPurchaseDTO;
import com.soomjd.soomjan.classRoom.model.dto.LearningPostDTO;
import com.soomjd.soomjan.classRoom.model.dto.MokchaDTO;
import com.soomjd.soomjan.classRoom.model.dto.ReviewDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;

public interface ClassRoomService {
	
	ClassDTO selectClassByClassCode(int classCode);

	List<Map<String, String>> selectCurrentMemberList(int classCode);

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

	int modifyClassFile(ClassDTO classDTO);

	boolean modifyLectureIsDeleted(int mokchaCode);

	boolean modifyLectureFileIsDeleted(int mokchaCode);
	
	List<ClassFileDTO> selectMokchaFileListByMokchaCode(int mokchaCode);

	boolean modifyLearnigPostIsDeleted(int postCode);

	boolean modifyLearningFileIsDeleted(int postCode);

	List<ClassFileDTO> selectLearningFileListByPostCode(int postCode);

	boolean registPurchaseClass(ClassPurchaseDTO classPurchase);

	boolean registChatRoom(HashMap<String, Object> chatRoomMap);

	int selectClassChatBySSACKEmail(HashMap<String, Object> chatRoomMap);

	boolean registReportMember(ReportMemberDTO reportMember);

	List<Map<String, Object>> selectAllReportStatement();
	
	int selectLearningBoardTotalCount(Map<String, Object> searchMap);

	List<Map<String, Object>> selectLearningBoardList(Map<String, Object> learningMap);

	int selectClassLectureTotalCount(Map<String, Object> searchMap);

	List<Map<String, Object>> selectLectureList(Map<String, Object> lectureMap);

	int selectReviewListByClassCodeTotalCount(Map<String, Object> searchMap);

	List<ReviewDTO> selectReviewListByClassCode(Map<String, Object> criteriaMap);

	double selectAvgReviewStar(int classCode);




}
