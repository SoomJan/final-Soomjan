package com.soomjd.soomjan.jandi.model.dto;

import java.util.Date;

public class CalculateDTO {
	private int calCode;
	private int fees;
	private String email;
	private int classPurchaseCode;
	private int managerCode;
	private java.util.Date calDate;
	public CalculateDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CalculateDTO(int calCode, int fees, String email, int classPurchaseCode, int managerCode, Date calDate) {
		super();
		this.calCode = calCode;
		this.fees = fees;
		this.email = email;
		this.classPurchaseCode = classPurchaseCode;
		this.managerCode = managerCode;
		this.calDate = calDate;
	}
	public int getCalCode() {
		return calCode;
	}
	public void setCalCode(int calCode) {
		this.calCode = calCode;
	}
	public int getFees() {
		return fees;
	}
	public void setFees(int fees) {
		this.fees = fees;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getClassPurchaseCode() {
		return classPurchaseCode;
	}
	public void setClassPurchaseCode(int classPurchaseCode) {
		this.classPurchaseCode = classPurchaseCode;
	}
	public int getManagerCode() {
		return managerCode;
	}
	public void setManagerCode(int managerCode) {
		this.managerCode = managerCode;
	}
	public java.util.Date getCalDate() {
		return calDate;
	}
	public void setCalDate(java.util.Date calDate) {
		this.calDate = calDate;
	}
	@Override
	public String toString() {
		return "CalculateDTO [calCode=" + calCode + ", fees=" + fees + ", email=" + email + ", classPurchaseCode="
				+ classPurchaseCode + ", managerCode=" + managerCode + ", calDate=" + calDate + "]";
	}
	
}