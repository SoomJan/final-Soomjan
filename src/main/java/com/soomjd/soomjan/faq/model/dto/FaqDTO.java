package com.soomjd.soomjan.faq.model.dto;

import java.sql.Date;

public class FaqDTO {

	
	private int postCode;
	private String title;
	private String contents;
	private java.sql.Date writeDate;
	private String isDeleted;
	private int mngNo;
	
	public FaqDTO() {
		super();
	}

	public FaqDTO(int postCode, String title, String contents, Date writeDate, String isDeleted, int mngNo) {
		super();
		this.postCode = postCode;
		this.title = title;
		this.contents = contents;
		this.writeDate = writeDate;
		this.isDeleted = isDeleted;
		this.mngNo = mngNo;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
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

	public java.sql.Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(java.sql.Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

	public int getMngNo() {
		return mngNo;
	}

	public void setMngNo(int mngNo) {
		this.mngNo = mngNo;
	}

	@Override
	public String toString() {
		return "FaqDTO [postCode=" + postCode + ", title=" + title + ", contents=" + contents + ", writeDate="
				+ writeDate + ", isDeleted=" + isDeleted + ", mngNo=" + mngNo + "]";
	}
	
	
}
