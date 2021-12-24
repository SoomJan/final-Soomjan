package com.soomjd.soomjan.jandi.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.findclass.model.dto.FindClassDTO;
import com.soomjd.soomjan.jandi.model.dao.JandiMapper;
import com.soomjd.soomjan.jandi.model.dto.CalAdDTO;
import com.soomjd.soomjan.jandi.model.dto.CalculateDTO;
import com.soomjd.soomjan.jandi.model.dto.FullAdDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

@Service
public class JandiServiceImpl implements JandiService{
	
	private final JandiMapper jandiMapper;
	
	@Autowired
	public JandiServiceImpl(JandiMapper jandiMapper) {
		this.jandiMapper = jandiMapper;
	}

	@Override
	public JandiDTO selectJandi(String email) {
		return jandiMapper.selectJandi(email);
	}

	@Override
	public List<Map<String, Object>> selectClassCodeList(JandiDTO jandi) {
		return jandiMapper.selectClassCodeList(jandi);
	}

	@Override

	public boolean updateProfileImage(Map<String,String> key) {
		
		return jandiMapper.updateProfileImage(key)>0? true:false;
	}	
		
	@Override	
	public List<Map<String, Object>> selectCategoryList() {
		return jandiMapper.selectCategoryList();
	}

	@Override
	public boolean updateIntro(Map<String, Object> key) {
		
		return jandiMapper.updateIntro(key)>0? true:false;
	}

	@Override
	public List<String> selectClassesList(String email) {
		
		return jandiMapper.selectClassesList(email);
	}

	@Override
	public boolean insertAd(Map<String, Object> key) {
		
		return jandiMapper.insertAd(key)>0? true:false;
	}

	@Override
	public int selectClassesCode(String myClass) {
		
		return jandiMapper.selectClassesCode(myClass);
	}

	@Override
	public List<ClassDTO> selectClasses(String email) {
		
		return jandiMapper.selectClasses(email);
	}

	@Override
	public FullAdDTO selectAd(Integer classesCode) {
		// TODO Auto-generated method stub
		return jandiMapper.selectAd(classesCode);
	}

	@Override
	public List<CalculateDTO> selectcalculateList(Map<String,Object> key) {
		// TODO Auto-generated method stub
		return jandiMapper.selectcalculateList(key);
	}

	@Override
	public List<CalAdDTO> selectcalAdList(Map<String, Object> key) {
		// TODO Auto-generated method stub
		return jandiMapper.selectcalAdList(key);
	}

	@Override
	public int updateAdDate(Map<String, Object> key) {
		// TODO Auto-generated method stub
		return jandiMapper.updateAdDate(key);
	}

	@Override
	public boolean modifyNickName(JandiDTO jandi) {
		return jandiMapper.modifyNickName(jandi);
	}

	@Override
	public List<FindClassDTO> selectThumbnailClassList(String email) {
		return jandiMapper.selectThumbnailClassList(email);
	}

	@Override
	public List<FullAdDTO> selectDoingAdList() {
		// TODO Auto-generated method stub
		return jandiMapper.selectDoingAdList();
	}

	@Override
	public int updateStartDate(int classCode) {
		// TODO Auto-generated method stub
		return jandiMapper.updateStartDate(classCode);
	}

	@Override
	public FullAdDTO selectMyAd(Integer adCode) {
		// TODO Auto-generated method stub
		return jandiMapper.selectMyAd(adCode);
	}

	@Override
	public ClassDTO selectMyClass(int classCode) {
		// TODO Auto-generated method stub
		return jandiMapper.selectMyClass(classCode);
	}


}
