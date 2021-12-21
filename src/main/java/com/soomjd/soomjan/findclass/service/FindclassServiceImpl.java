package com.soomjd.soomjan.findclass.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.findclass.model.dao.FindclassMapper;
import com.soomjd.soomjan.findclass.model.dto.FindClassDTO;

@Service
public class FindclassServiceImpl implements FindclassService{

	// 이건 findclassMapper에 있는 메소드를 아래의 여러 메소드가 공용으로 사용하기 위해서 전역변수로 지정을 해준거
	private FindclassMapper findclassMapper;
	
	// 이건 기존에 servlet에서 new 연산자를 통해서 다른 클래스의 객체를 선언에서 사용하는 것을
	// @Autowired라는 어노 테이션을 이용하여 생성자 주입을 한것이다.
	// 선언방식이 달라서 그렇지 객체를 선언해서 사용하는 것은 동일하다고 보면된다.
	@Autowired
	public FindclassServiceImpl(FindclassMapper findclassMapper) { // 생성자 
		this.findclassMapper = findclassMapper;
	}
	
	@Override
	public List<FindClassDTO> selectfindclass(Map<String, Object> searchMap) {
		
		return findclassMapper.selectfindclass(searchMap);
	}

	@Override
	public int selectFindClassTotalCount(Map<String, Object> searchMap) {
		
		return findclassMapper.selectFindClassTotalCount(searchMap);
	}

	
}
