package com.soomjd.soomjan.classRoom.model.dto;

import java.sql.Date;

public class ClassDTO {
	
	private int classCode;
	private java.sql.Date createDate;
	private String contents;
	private String tag;
	private int categoryCode;
	private String email;
	private String boardType;
	private int views;
	private int maxCount;
	private String nickName;
	private String title;
	private int price;
	private String filePath;
	private String orgFilePath;
	private String isDeleted;
	
	public ClassDTO() {	}
	
	public ClassDTO(int categoryCode, int maxCount, int price, String title, String email) {
		this.title = title;
		this.price = price;
		this.email = email;
		this.maxCount = maxCount;
		this.categoryCode = categoryCode;
	}
	
	public ClassDTO(int classCode, Date createDate, String contents, String tag, int categoryCode, String email,
			String boardType, int views, int maxCount, String nickName, String title, int price, String filePath,
			String orgFilePath, String isDeleted) {
		super();
		this.classCode = classCode;
		this.createDate = createDate;
		this.contents = contents;
		this.tag = tag;
		this.categoryCode = categoryCode;
		this.email = email;
		this.boardType = boardType;
		this.views = views;
		this.maxCount = maxCount;
		this.nickName = nickName;
		this.title = title;
		this.price = price;
		this.filePath = filePath;
		this.orgFilePath = orgFilePath;
		this.isDeleted = isDeleted;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public java.sql.Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(java.sql.Date createDate) {
		this.createDate = createDate;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getMaxCount() {
		return maxCount;
	}

	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getOrgFilePath() {
		return orgFilePath;
	}

	public void setOrgFilePath(String orgFilePath) {
		this.orgFilePath = orgFilePath;
	}

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Override
	public String toString() {
		return "ClassDTO [classCode=" + classCode + ", createDate=" + createDate + ", contents=" + contents + ", tag="
				+ tag + ", categoryCode=" + categoryCode + ", email=" + email + ", boardType=" + boardType + ", views="
				+ views + ", maxCount=" + maxCount + ", nickName=" + nickName + ", title=" + title + ", price=" + price
				+ ", filePath=" + filePath + ", orgFilePath=" + orgFilePath + ", isDeleted=" + isDeleted + "]";
	}

}
