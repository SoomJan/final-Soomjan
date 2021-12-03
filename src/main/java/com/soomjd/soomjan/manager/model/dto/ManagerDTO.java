package com.soomjd.soomjan.manager.model.dto;

import java.sql.Date;

public class ManagerDTO {

	private int mngNo;
	private String mngId;
	private String password;
	private String mngName;
	private java.sql.Date createDate;
	private char isDeleted;
	private String mngNickName;
	
	public ManagerDTO() {
		super();
	}

	public ManagerDTO(int mngNo, String mngId, String password, String mngName, Date createDate, char isDeleted,
			String mngNickName) {
		super();
		this.mngNo = mngNo;
		this.mngId = mngId;
		this.password = password;
		this.mngName = mngName;
		this.createDate = createDate;
		this.isDeleted = isDeleted;
		this.mngNickName = mngNickName;
	}

	public int getMngNo() {
		return mngNo;
	}

	public void setMngNo(int mngNo) {
		this.mngNo = mngNo;
	}

	public String getMngId() {
		return mngId;
	}

	public void setMngId(String mngId) {
		this.mngId = mngId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMngName() {
		return mngName;
	}

	public void setMngName(String mngName) {
		this.mngName = mngName;
	}

	public java.sql.Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(java.sql.Date createDate) {
		this.createDate = createDate;
	}

	public char getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(char isDeleted) {
		this.isDeleted = isDeleted;
	}

	public String getMngNickName() {
		return mngNickName;
	}

	public void setMngNickName(String mngNickName) {
		this.mngNickName = mngNickName;
	}

	@Override
	public String toString() {
		return "ManagerDTO [mngNo=" + mngNo + ", mngId=" + mngId + ", password=" + password + ", mngName=" + mngName
				+ ", createDate=" + createDate + ", isDeleted=" + isDeleted + ", mngNickName=" + mngNickName + "]";
	}

	
	
	
}
