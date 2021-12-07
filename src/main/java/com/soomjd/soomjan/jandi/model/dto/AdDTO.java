package com.soomjd.soomjan.jandi.model.dto;

public class AdDTO {
	private String adContents;
	private String imgPath;
	public AdDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdDTO(String adContents, String imgPath) {
		super();
		this.adContents = adContents;
		this.imgPath = imgPath;
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
	@Override
	public String toString() {
		return "AdDTO [adContents=" + adContents + ", imgPath=" + imgPath + "]";
	}
	
	
}
