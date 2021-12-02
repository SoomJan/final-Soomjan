package com.soomjd.soomjan.manager.model.service;

import java.util.List;

import com.soomjd.soomjan.common.exception.LoginFailedException;
import com.soomjd.soomjan.manager.model.dto.ManagerDTO;

public interface ManagerService {
	
	ManagerDTO loginManager(ManagerDTO manager) throws LoginFailedException;

	List<ManagerDTO> allManager(ManagerDTO manager);

}
