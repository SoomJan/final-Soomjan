package com.soomjd.soomjan.jandi.model.dao;

import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

public interface JandiMapper {

	JandiDTO selectJandi(String email);

}
