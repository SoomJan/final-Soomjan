package com.soomjd.soomjan.classRoom.model.dto;

import java.sql.Date;

public class LearningPostDTO {
	
	private String postCode;
	private java.sql.Date writeDate;
	private java.sql.Date reDate;
	private String contents;
	private String email;
	private int classCode;
	private String title;
	private String isDeleted;
	private String nickName;
	
	
	public LearningPostDTO() {}


	public LearningPostDTO(String postCode, Date writeDate, Date reDate, String contents, String email, int classCode,
			String title, String isDeleted, String nickName) {
		super();
		this.postCode = postCode;
		this.writeDate = writeDate;
		this.reDate = reDate;
		this.contents = contents;
		this.email = email;
		this.classCode = classCode;
		this.title = title;
		this.isDeleted = isDeleted;
		this.nickName = nickName;
	}


	public String getPostCode() {
		return postCode;
	}


	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}


	public java.sql.Date getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(java.sql.Date writeDate) {
		this.writeDate = writeDate;
	}


	public java.sql.Date getReDate() {
		return reDate;
	}


	public void setReDate(java.sql.Date reDate) {
		this.reDate = reDate;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
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


	public String getIsDeleted() {
		return isDeleted;
	}


	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	

}
