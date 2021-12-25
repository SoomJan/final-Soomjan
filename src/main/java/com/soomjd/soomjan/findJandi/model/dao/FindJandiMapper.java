package com.soomjd.soomjan.findJandi.model.dao;

import java.util.List;

<<<<<<< HEAD
import com.soomjd.soomjan.common.paging.SelectCriteria;
=======
import com.soomjd.soomjan.findclass.model.dto.FindClassDTO;
>>>>>>> refs/remotes/origin/master
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;

public interface FindJandiMapper {

<<<<<<< HEAD
	List<JandiDTO> selectFindJandi(SelectCriteria selectCriteria);

	int SelectFindJandiTotalCount();
=======
	List<JandiDTO> selectFindJandi();

	JandiDTO selectJandiInfo(String email);

	List<FindClassDTO> selectThumbnailClassList(String email);
>>>>>>> refs/remotes/origin/master
}
