package com.soomjd.soomjan.manager.model.dao;

import java.util.List;

import com.soomjd.soomjan.manager.model.dto.ManagerDTO;

public interface ManagerMapper {

	String selectEncPassword(ManagerDTO manager);
	
	ManagerDTO selectManager(ManagerDTO manager);

	List<ManagerDTO> allManager(ManagerDTO manager);
}
