package com.soomjd.soomjan.classRoom.model.dto;

import java.sql.Date;

public class ClassFileDTO {
	
	private int fileCode;
	private String filePath;
	private String email;
	private String orgFilePath;
	private java.sql.Date writeDate;
	private int mokchaCode;
	private int postCode;
	private int isDeleted;
	
	public ClassFileDTO() {	}

	public ClassFileDTO(String filePath, String email, String orgFilePath, Date writeDate, int fileCode, int postCode,
			int mokchaCode, int isDeleted) {
		super();
		this.filePath = filePath;
		this.email = email;
		this.orgFilePath = orgFilePath;
		this.writeDate = writeDate;
		this.fileCode = fileCode;
		this.postCode = postCode;
		this.mokchaCode = mokchaCode;
		this.isDeleted = isDeleted;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOrgFilePath() {
		return orgFilePath;
	}

	public void setOrgFilePath(String orgFilePath) {
		this.orgFilePath = orgFilePath;
	}

	public java.sql.Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(java.sql.Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getFileCode() {
		return fileCode;
	}

	public void setFileCode(int fileCode) {
		this.fileCode = fileCode;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public int getMokchaCode() {
		return mokchaCode;
	}

	public void setMokchaCode(int mokchaCode) {
		this.mokchaCode = mokchaCode;
	}

	public int getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Override
	public String toString() {
		return "ClassFileDTO [filePath=" + filePath + ", email=" + email + ", orgFilePath=" + orgFilePath
				+ ", writeDate=" + writeDate + ", fileCode=" + fileCode + ", postCode=" + postCode + ", mokchaCode="
				+ mokchaCode + ", isDeleted=" + isDeleted + "]";
	}
	
	

}
