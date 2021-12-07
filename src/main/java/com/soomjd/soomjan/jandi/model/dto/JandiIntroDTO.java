package com.soomjd.soomjan.jandi.model.dto;

public class JandiIntroDTO {

	private String career;
	private String introduce;
	public JandiIntroDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public JandiIntroDTO(String career, String introduce) {
		super();
		this.career = career;
		this.introduce = introduce;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	@Override
	public String toString() {
		return "JandiIntroDTO [career=" + career + ", introduce=" + introduce + "]";
	}
	
	
}
