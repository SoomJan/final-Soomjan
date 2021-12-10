package com.soomjd.soomjan.jandi.model.dto;

import java.util.Date;

public class FullAdDTO {

	private int adCode;
	private String adContents;
	private String imagePath;
	private int classCode;
	private java.util.Date startDate;
	private String originImagePath;
	private Character isAdvertised;
	public FullAdDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FullAdDTO(int adCode, String adContents, String imagePath, int classCode, Date startDate,
			String originImagePath, Character isAdvertised) {
		super();
		this.adCode = adCode;
		this.adContents = adContents;
		this.imagePath = imagePath;
		this.classCode = classCode;
		this.startDate = startDate;
		this.originImagePath = originImagePath;
		this.isAdvertised = isAdvertised;
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
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public int getClassCode() {
		return classCode;
	}
	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}
	public java.util.Date getStartDate() {
		return startDate;
	}
	public void setStartDate(java.util.Date startDate) {
		this.startDate = startDate;
	}
	public String getOriginImagePath() {
		return originImagePath;
	}
	public void setOriginImagePath(String originImagePath) {
		this.originImagePath = originImagePath;
	}
	public Character getIsAdvertised() {
		return isAdvertised;
	}
	public void setIsAdvertised(Character isAdvertised) {
		this.isAdvertised = isAdvertised;
	}
	@Override
	public String toString() {
		return "FullAdDTO [adCode=" + adCode + ", adContents=" + adContents + ", imagePath=" + imagePath
				+ ", classCode=" + classCode + ", startDate=" + startDate + ", originImagePath=" + originImagePath
				+ ", isAdvertised=" + isAdvertised + "]";
	}
	
	
}
