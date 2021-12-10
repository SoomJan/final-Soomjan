package com.soomjd.soomjan.faq.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soomjd.soomjan.common.paging.SelectCriteria;
import com.soomjd.soomjan.faq.model.dao.FaqMapper;
import com.soomjd.soomjan.faq.model.dto.FaqDTO;

@Service
public class FaqServiceImpl implements FaqService {

	private FaqMapper mapper;
	
	@Autowired
	public FaqServiceImpl(FaqMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public int selectFaqTotalCount() {
		return mapper.selectFaqTotalCount();
	}

	@Override
	public List<FaqDTO> selectnotice(SelectCriteria selectCriteria) {
		return mapper.selectnotice(selectCriteria);
	}

}
