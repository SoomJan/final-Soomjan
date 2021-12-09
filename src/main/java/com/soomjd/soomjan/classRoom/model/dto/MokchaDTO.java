package com.soomjd.soomjan.classRoom.model.dto;

import java.sql.Date;

public class MokchaDTO {
	
	private int mokchaCode;
	private String mokchaName;
	private java.sql.Date writeDate;
	private String contents;
	private int classCode;
	private int countMokcha;
	
	public MokchaDTO() {}

	public MokchaDTO(int mokchaCode, String mokchaName, Date writeDate, String contents, int classCode,
			int countMokcha) {
		super();
		this.mokchaCode = mokchaCode;
		this.mokchaName = mokchaName;
		this.writeDate = writeDate;
		this.contents = contents;
		this.classCode = classCode;
		this.countMokcha = countMokcha;
	}

	public int getMokchaCode() {
		return mokchaCode;
	}

	public void setMokchaCode(int mokchaCode) {
		this.mokchaCode = mokchaCode;
	}

	public String getMokchaName() {
		return mokchaName;
	}

	public void setMokchaName(String mokchaName) {
		this.mokchaName = mokchaName;
	}

	public java.sql.Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(java.sql.Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public int getCountMokcha() {
		return countMokcha;
	}

	public void setCountMokcha(int countMokcha) {
		this.countMokcha = countMokcha;
	}

	@Override
	public String toString() {
		return "MokchaDTO [mokchaCode=" + mokchaCode + ", mokchaName=" + mokchaName + ", writeDate=" + writeDate
				+ ", contents=" + contents + ", classCode=" + classCode + ", countMokcha=" + countMokcha + "]";
	}
	
	

}
