package com.soomjd.soomjan.jandi.model.service;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.findclass.model.dto.FindClassDTO;
import com.soomjd.soomjan.jandi.model.dto.CalAdDTO;
import com.soomjd.soomjan.jandi.model.dto.CalculateDTO;
import com.soomjd.soomjan.jandi.model.dto.FullAdDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

public interface JandiService {

	JandiDTO selectJandi(String email);

	List<Map<String, Object>> selectClassCodeList(JandiDTO jandi);
	
	boolean updateProfileImage(Map<String,String> key);

	List<Map<String, Object>> selectCategoryList();

	boolean updateIntro(Map<String, Object> key);

	List<String> selectClassesList(String email);

	boolean insertAd(Map<String, Object> key);

	List<Integer> selectClassesCode(String myClass);

	List<ClassDTO> selectClasses(String email);

	FullAdDTO selectAd(Integer integer);

	List<CalculateDTO> selectcalculateList(Map<String,Object> key);

	List<CalAdDTO> selectcalAdList(Map<String, Object> key);

	int updateAdDate(Map<String, Object> key);

	boolean modifyNickName(JandiDTO jandi);

	List<FindClassDTO> selectThumbnailClassList(String email);

	List<FullAdDTO> selectDoingAdList();

	int updateStartDate(int classCode);

	FullAdDTO selectMyAd(Integer adCode);

	ClassDTO selectMyClass(int classCode);

	int updatePayment(Map<String, Object> key2);

	List<Integer> selectPayCode(String nickName);

	int updatePurchaseAd(Map<String, Object> key);

	List<FullAdDTO> selectMyAdList(Integer integer);

	List<FullAdDTO> selectAllAd(Integer classCode);



}
