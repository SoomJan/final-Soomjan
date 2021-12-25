package com.soomjd.soomjan.matching.model.dto;

import java.sql.Date;

import com.soomjd.soomjan.member.model.dto.MemberDTO;

public class EstimateDTO {
	
	private int estimateCode;
	private int categoryCode;
	private String isMatched;
	private java.sql.Date writeDate;
	private String title;
	private String contents;
	private String email;
	private char isDeleted;
	private CategoryDTO categoryDTO;
	private MemberDTO memberDTO;
	private int rnum;
	
	public EstimateDTO() {
	}

	public EstimateDTO(int estimateCode, int categoryCode, String isMatched, Date writeDate, String title,
			String contents, String email, char isDeleted, CategoryDTO categoryDTO, MemberDTO memberDTO, int rnum) {
		super();
		this.estimateCode = estimateCode;
		this.categoryCode = categoryCode;
		this.isMatched = isMatched;
		this.writeDate = writeDate;
		this.title = title;
		this.contents = contents;
		this.email = email;
		this.isDeleted = isDeleted;
		this.categoryDTO = categoryDTO;
		this.memberDTO = memberDTO;
		this.rnum = rnum;
	}

	public int getEstimateCode() {
		return estimateCode;
	}

	public void setEstimateCode(int estimateCode) {
		this.estimateCode = estimateCode;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getIsMatched() {
		return isMatched;
	}

	public void setIsMatched(String isMatched) {
		this.isMatched = isMatched;
	}

	public java.sql.Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(java.sql.Date writeDate) {
		this.writeDate = writeDate;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public char getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(char isDeleted) {
		this.isDeleted = isDeleted;
	}

	public CategoryDTO getCategoryDTO() {
		return categoryDTO;
	}

	public void setCategoryDTO(CategoryDTO categoryDTO) {
		this.categoryDTO = categoryDTO;
	}

	public MemberDTO getMemberDTO() {
		return memberDTO;
	}

	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "EstimateDTO [estimateCode=" + estimateCode + ", categoryCode=" + categoryCode + ", isMatched="
				+ isMatched + ", writeDate=" + writeDate + ", title=" + title + ", contents=" + contents + ", email="
				+ email + ", isDeleted=" + isDeleted + ", categoryDTO=" + categoryDTO + ", memberDTO=" + memberDTO
				+ ", rnum=" + rnum + "]";
	}

	

	
	

}
