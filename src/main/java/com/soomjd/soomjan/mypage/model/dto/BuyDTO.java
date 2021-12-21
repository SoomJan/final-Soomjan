package com.soomjd.soomjan.mypage.model.dto;

import java.sql.Date;

public class BuyDTO {
	
	private int classCode;
	private String title;
	private String filePath;
	private String nickName;
    private java.sql.Date payDate;
    private int pay;
    private String isDeleted;
    
    public BuyDTO() {}

	public BuyDTO(int classCode, String title, String filePath, String nickName, Date payDate, int pay,
			String isDeleted) {
		super();
		this.classCode = classCode;
		this.title = title;
		this.filePath = filePath;
		this.nickName = nickName;
		this.payDate = payDate;
		this.pay = pay;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public java.sql.Date getPayDate() {
		return payDate;
	}

	public void setPayDate(java.sql.Date payDate) {
		this.payDate = payDate;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Override
	public String toString() {
		return "BuyDTO [classCode=" + classCode + ", title=" + title + ", filePath=" + filePath + ", nickName="
				+ nickName + ", payDate=" + payDate + ", pay=" + pay + ", isDeleted=" + isDeleted + "]";
	}


}
