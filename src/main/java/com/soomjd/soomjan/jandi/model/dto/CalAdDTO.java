package com.soomjd.soomjan.jandi.model.dto;

import java.util.Date;

public class CalAdDTO {
	private java.util.Date payDate;
	private String className;
	private int pay;
	public CalAdDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CalAdDTO(Date payDate, String className, int pay) {
		super();
		this.payDate = payDate;
		this.className = className;
		this.pay = pay;
	}
	public java.util.Date getPayDate() {
		return payDate;
	}
	public void setPayDate(java.util.Date payDate) {
		this.payDate = payDate;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	@Override
	public String toString() {
		return "CalAdDTO [payDate=" + payDate + ", className=" + className + ", pay=" + pay + "]";
	}
	
	
	
}
