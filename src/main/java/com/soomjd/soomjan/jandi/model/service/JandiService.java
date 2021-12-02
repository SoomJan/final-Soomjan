package com.soomjd.soomjan.jandi.model.service;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

public interface JandiService {

	JandiDTO selectJandi(String email);

	List<Map<String, Object>> selectClassCodeList(JandiDTO jandi);

	List<Map<String, Object>> selectCategoryList();

}
