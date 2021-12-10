package com.soomjd.soomjan.jandi.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.jandi.model.dao.JandiMapper;
import com.soomjd.soomjan.jandi.model.dto.CalAdDTO;
import com.soomjd.soomjan.jandi.model.dto.CalculateDTO;
import com.soomjd.soomjan.jandi.model.dto.ClassesDTO;
import com.soomjd.soomjan.jandi.model.dto.FullAdDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.member.model.dto.MemberDTO;

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
	public List<ClassesDTO> selectClasses(String email) {
		
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


}
