package com.soomjd.soomjan.manager.model.dto;

import java.sql.Date;

public class JandiDTO {

	private int sequence;
	private String email;
	private String nickName;
	private String career;
	private String intro;
	private String profilePath;
	private java.sql.Date enrollDate;
	private String account;
	private String bank;
	private String accName;
	
	public JandiDTO() {
		
	}

	public JandiDTO(int sequence, String email, String nickName, String career, String intro, String profilePath,
			Date enrollDate, String account, String bank, String accName) {
		super();
		this.sequence = sequence;
		this.email = email;
		this.nickName = nickName;
		this.career = career;
		this.intro = intro;
		this.profilePath = profilePath;
		this.enrollDate = enrollDate;
		this.account = account;
		this.bank = bank;
		this.accName = accName;
	}

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	public java.sql.Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(java.sql.Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccName() {
		return accName;
	}

	public void setAccName(String accName) {
		this.accName = accName;
	}

	@Override
	public String toString() {
		return "JandiDTO [sequence=" + sequence + ", email=" + email + ", nickName=" + nickName + ", career=" + career
				+ ", intro=" + intro + ", profilePath=" + profilePath + ", enrollDate=" + enrollDate + ", account="
				+ account + ", bank=" + bank + ", accName=" + accName + "]";
	}
	
	
	
	
	
}
