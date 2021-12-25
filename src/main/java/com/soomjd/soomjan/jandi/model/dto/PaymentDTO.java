package com.soomjd.soomjan.jandi.model.dto;

import java.sql.Date;

public class PaymentDTO {
	
	private int payCode;
	private int pay;
	private String bank;
	private String owner;
	private String account;
	private java.sql.Date payDate;
	private String payType;
	
	public PaymentDTO() {}

	public PaymentDTO(int payCode, int pay, String bank, String owner, String account, Date payDate, String payType) {
		super();
		this.payCode = payCode;
		this.pay = pay;
		this.bank = bank;
		this.owner = owner;
		this.account = account;
		this.payDate = payDate;
		this.payType = payType;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public java.sql.Date getPayDate() {
		return payDate;
	}

	public void setPayDate(java.sql.Date payDate) {
		this.payDate = payDate;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	@Override
	public String toString() {
		return "PaymentDTO [payCode=" + payCode + ", pay=" + pay + ", bank=" + bank + ", owner=" + owner + ", account="
				+ account + ", payDate=" + payDate + ", payType=" + payType + "]";
	}
	
	

}
