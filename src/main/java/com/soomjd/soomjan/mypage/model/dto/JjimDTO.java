package com.soomjd.soomjan.mypage.model.dto;

public class JjimDTO {
	
	private int classCode;
	private String title;
	private String filePath;
	private String categoryName;
	private String nickName;
	private String isDeleted;
	
	public JjimDTO() {}

	public JjimDTO(int classCode, String title, String filePath, String categoryName, String nickName,
			String isDeleted) {
		super();
		this.classCode = classCode;
		this.title = title;
		this.filePath = filePath;
		this.categoryName = categoryName;
		this.nickName = nickName;
		this.isDeleted = isDeleted;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Override
	public String toString() {
		return "JjimDTO [classCode=" + classCode + ", title=" + title + ", filePath=" + filePath + ", categoryName="
				+ categoryName + ", nickName=" + nickName + ", isDeleted=" + isDeleted + "]";
	}

	

}
