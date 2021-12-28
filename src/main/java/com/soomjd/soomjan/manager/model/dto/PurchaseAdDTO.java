package com.soomjd.soomjan.manager.model.dto;

import com.soomjd.soomjan.classRoom.model.dto.PaymentDTO;

public class PurchaseAdDTO {

	public int adCode;
	public int payCode;
	public int adPurcCode;
	public String email;
	public PaymentDTO PaymentDTO;
	
	public PurchaseAdDTO() {
		super();
	}

	public PurchaseAdDTO(int adCode, int payCode, int adPurcCode, String email, PaymentDTO PaymentDTO) {
		super();
		this.adCode = adCode;
		this.payCode = payCode;
		this.adPurcCode = adPurcCode;
		this.email = email;
		this.PaymentDTO = PaymentDTO;
	}

	public int getAdCode() {
		return adCode;
	}

	public void setAdCode(int adCode) {
		this.adCode = adCode;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public int getAdPurcCode() {
		return adPurcCode;
	}

	public void setAdPurcCode(int adPurcCode) {
		this.adPurcCode = adPurcCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public PaymentDTO getPaymentDTO() {
		return PaymentDTO;
	}

	public void setPaymentDTO(PaymentDTO PaymentDTO) {
		this.PaymentDTO = PaymentDTO;
	}

	@Override
	public String toString() {
		return "PurchaseAdDTO [adCode=" + adCode + ", payCode=" + payCode + ", adPurcCode=" + adPurcCode + ", email="
				+ email + ", PaymentDTO=" + PaymentDTO + "]";
	}
	
	
	
	
	
	
}
