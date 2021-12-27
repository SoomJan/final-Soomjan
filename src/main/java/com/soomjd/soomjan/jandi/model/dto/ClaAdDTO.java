package com.soomjd.soomjan.jandi.model.dto;

public class ClaAdDTO {
	
	private int classCode;
	private String imgPath;
	private String isDeleted;
	private int rnum;
	
	public ClaAdDTO() {
		super();
	}

	public ClaAdDTO(int classCode, String imgPath, String isDeleted, int rnum) {
		super();
		this.classCode = classCode;
		this.imgPath = imgPath;
		this.isDeleted = isDeleted;
		this.rnum = rnum;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}
	

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "ClaAdDTO [classCode=" + classCode + ", imgPath=" + imgPath + ", isDeleted=" + isDeleted + ", rnum="
				+ rnum + "]";
	}

}
