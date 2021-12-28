package com.soomjd.soomjan.manager.model.dto;

import java.sql.Date;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;

public class AdDTO {

	public int adCode;
	public String adContents;
	public String imgPath;
	public int classCode;
	public java.sql.Date startDate;
	public String isAdvertised;
	public ClassDTO ClassDTO;
	
	public AdDTO() {
		super();
	}

	public AdDTO(int adCode, String adContents, String imgPath, int classCode, Date startDate, String isAdvertised,
			com.soomjd.soomjan.classRoom.model.dto.ClassDTO classDTO) {
		super();
		this.adCode = adCode;
		this.adContents = adContents;
		this.imgPath = imgPath;
		this.classCode = classCode;
		this.startDate = startDate;
		this.isAdvertised = isAdvertised;
		ClassDTO = classDTO;
	}

	public int getAdCode() {
		return adCode;
	}

	public void setAdCode(int adCode) {
		this.adCode = adCode;
	}

	public String getAdContents() {
		return adContents;
	}

	public void setAdContents(String adContents) {
		this.adContents = adContents;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public java.sql.Date getStartDate() {
		return startDate;
	}

	public void setStartDate(java.sql.Date startDate) {
		this.startDate = startDate;
	}

	public String getIsAdvertised() {
		return isAdvertised;
	}

	public void setIsAdvertised(String isAdvertised) {
		this.isAdvertised = isAdvertised;
	}

	public ClassDTO getClassDTO() {
		return ClassDTO;
	}

	public void setClassDTO(ClassDTO classDTO) {
		ClassDTO = classDTO;
	}

	@Override
	public String toString() {
		return "AdDTO [adCode=" + adCode + ", adContents=" + adContents + ", imgPath=" + imgPath + ", classCode="
				+ classCode + ", startDate=" + startDate + ", isAdvertised=" + isAdvertised + ", ClassDTO=" + ClassDTO
				+ "]";
	}

	
	
	
}
