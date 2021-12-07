package com.soomjd.soomjan.jandi.model.dto;

public class CreateAdDTO {
	
	private String myClass;
	private String adContents;
	public CreateAdDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CreateAdDTO(String myClass, String adContents) {
		super();
		this.myClass = myClass;
		this.adContents = adContents;
	}
	public String getMyClass() {
		return myClass;
	}
	public void setMyClass(String myClass) {
		this.myClass = myClass;
	}
	public String getAdContents() {
		return adContents;
	}
	public void setAdContents(String adContents) {
		this.adContents = adContents;
	}
	@Override
	public String toString() {
		return "CreateAdDTO [myClass=" + myClass + ", adContents=" + adContents + "]";
	}
	
	

}
