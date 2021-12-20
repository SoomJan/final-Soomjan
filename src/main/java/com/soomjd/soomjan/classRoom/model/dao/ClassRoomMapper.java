package com.soomjd.soomjan.classRoom.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.classRoom.model.dto.ClassFileDTO;
import com.soomjd.soomjan.classRoom.model.dto.ClassPurchaseDTO;
import com.soomjd.soomjan.classRoom.model.dto.LearningPostDTO;
import com.soomjd.soomjan.classRoom.model.dto.MokchaDTO;
import com.soomjd.soomjan.classRoom.model.dto.ReviewDTO;
import com.soomjd.soomjan.member.model.dto.ReportMemberDTO;

public interface ClassRoomMapper {

	ClassDTO selectClassByClassCode(int classCode);

	List<Map<String, String>> selectCurrentMemberList(int classCode);

	List<MokchaDTO> selectMokchaList(Map<String, Object> searchMap);

	List<LearningPostDTO> selectLearningPostList(Map<String, Object> searchMap);

	List<ClassFileDTO> selectLearningFile(int postCode);

	List<Map<String, Object>> selectChatRoomList(HashMap<String, Object> chatRoomMap);

	int registClass(ClassDTO classDTO);

	int selectClassCode(String email);

	List<Map<String, Object>> selectClassCodeList(String email);

	int deleteClass(int classCode);

	int modifyClass(ClassDTO classDTO);

	int registLecture(MokchaDTO mokcha);

	int registLectureFile(ClassFileDTO classFile);

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

	int selectLearningBoardTotalCount(Map<String, Object> searchMap);

	boolean registChatRoom(HashMap<String, Object> chatRoomMap);

	HashMap<String, Object> selectClassChatBySSACKEmail(HashMap<String, Object> chatRoomMap);

	boolean registReportMember(ReportMemberDTO reportMember);

	List<Map<String, Object>> selectAllReportStatement();

	int viewsUp(Map<String, Object> map);

	int selectReviewListByClassCodeTotalCount(Map<String, Object> searchMap);

	List<ReviewDTO> selectReviewListByClassCode(Map<String, Object> criteriaMap);

	double selectAvgReviewStar(int classCode);

	int selectClassLectureTotalCount(Map<String, Object> searchMap);

	List<MokchaDTO> selectMokchaTitleList(int classCode);

	boolean registReportClass(Map<String, Object> reportClassMap);

	List<Map<String, Object>> selectJJimClassMemberList(int classCode);

	boolean removeLikedClass(Map<String, Object> jjimMap);

	boolean registLikedClass(Map<String, Object> jjimMap);

}
