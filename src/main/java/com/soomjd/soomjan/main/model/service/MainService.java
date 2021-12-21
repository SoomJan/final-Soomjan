package com.soomjd.soomjan.main.model.service;

import java.util.List;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

public interface MainService {

	List<JandiDTO> mainJandi();

	List<ClassDTO> viewClass();

	List<ClassDTO> latestClass();

	List<ClassDTO> almostfinish();

}
