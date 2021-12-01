package com.soomjd.soomjan.jandi.model.dao;

import java.util.List;
import java.util.Map;

import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

public interface JandiMapper {

	JandiDTO selectJandi(String email);

	List<Map<String, Object>> selectClassCodeList(JandiDTO jandi);

}
