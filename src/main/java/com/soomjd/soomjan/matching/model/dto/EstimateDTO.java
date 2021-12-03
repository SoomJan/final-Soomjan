package com.soomjd.soomjan.matching.model.dto;

import java.sql.Date;

public class EstimateDTO {
	
	private int estimateCode;
	private int categoryCode;
	private char isMatched;
	private java.sql.Date writeDate;
	private String title;
	private String contents;
	private String email;
	private char isDeleted;
	
	public EstimateDTO() {
	}

	public EstimateDTO(int estimateCode, int categoryCode, char isMatched, Date writeDate, String title,
			String contents, String email, char isDeleted) {
		super();
		this.estimateCode = estimateCode;
		this.categoryCode = categoryCode;
		this.isMatched = isMatched;
		this.writeDate = writeDate;
		this.title = title;
		this.contents = contents;
		this.email = email;
		this.isDeleted = isDeleted;
	}

	public int getEstimateCode() {
		return estimateCode;
	}

	public void setEstimateCode(int estimateCode) {
		this.estimateCode = estimateCode;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public char getIsMatched() {
		return isMatched;
	}

	public void setIsMatched(char isMatched) {
		this.isMatched = isMatched;
	}

	public java.sql.Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(java.sql.Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public char getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(char isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Override
	public String toString() {
		return "EstimateDTO [estimateCode=" + estimateCode + ", categoryCode=" + categoryCode + ", isMatched="
				+ isMatched + ", writeDate=" + writeDate + ", title=" + title + ", contents=" + contents + ", email="
				+ email + ", isDeleted=" + isDeleted + "]";
	}
	
	

}
