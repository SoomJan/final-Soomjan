package com.soomjd.soomjan.jandi.model.dto;

import java.util.Date;

public class ClassesDTO {
	
	private int classCode;
	private java.util.Date createDate;
	private String contents;
	private String tag;
	private int categoryCode;
	private String email;
	private String boardType;
	private int view;
	private int maxCount;
	private String title;
	private int price;
	private Character isDeleted;
	private String filePath;
	private String orgFilePath;
	public ClassesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ClassesDTO(int classCode, Date createDate, String contents, String tag, int categoryCode, String email,
			String boardType, int view, int maxCount, String title, int price, char isDeleted, String filePath,
			String orgFilePath) {
		super();
		this.classCode = classCode;
		this.createDate = createDate;
		this.contents = contents;
		this.tag = tag;
		this.categoryCode = categoryCode;
		this.email = email;
		this.boardType = boardType;
		this.view = view;
		this.maxCount = maxCount;
		this.title = title;
		this.price = price;
		this.isDeleted = isDeleted;
		this.filePath = filePath;
		this.orgFilePath = orgFilePath;
	}
	public int getClassCode() {
		return classCode;
	}
	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}
	public java.util.Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(java.util.Date createDate) {
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
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public int getMaxCount() {
		return maxCount;
	}
	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
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
	public char getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(char isDeleted) {
		this.isDeleted = isDeleted;
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
	@Override
	public String toString() {
		return "ClassesDTO [classCode=" + classCode + ", createDate=" + createDate + ", contents=" + contents + ", tag="
				+ tag + ", categoryCode=" + categoryCode + ", email=" + email + ", boardType=" + boardType + ", view="
				+ view + ", maxCount=" + maxCount + ", title=" + title + ", price=" + price + ", isDeleted=" + isDeleted
				+ ", filePath=" + filePath + ", orgFilePath=" + orgFilePath + "]";
	}
	
	

}
