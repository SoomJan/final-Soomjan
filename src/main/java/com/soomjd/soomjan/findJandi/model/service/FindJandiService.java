package com.soomjd.soomjan.findJandi.model.service;

import java.util.List;
import java.util.Map;

<<<<<<< HEAD
import com.soomjd.soomjan.common.paging.SelectCriteria;
=======
import com.soomjd.soomjan.findclass.model.dto.FindClassDTO;
>>>>>>> refs/remotes/origin/master
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

public interface FindJandiService {

	List<JandiDTO> selectfindJandi(SelectCriteria selectCriteria);
	
	List<JandiDTO> mainJandi();

	List<JandiDTO> selectTopFindJandiList();

<<<<<<< HEAD
	int SelectFindJandiTotalCount(Map<String, Object> searchMap);
=======
	JandiDTO selectJandiInfo(String email);
	
	List<FindClassDTO> selectThumbnailClassList(String email);
	
>>>>>>> refs/remotes/origin/master
}
