package com.soomjd.soomjan.manager.model.dto;

import java.sql.Date;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;

public class ReportClassDTO {

	private int repCode;
	private String email;
	private String repContents;
	private int classCode;
	private java.sql.Date repDate;
	private int repTypeCode;
	private String repYn;
	private String categoryName;
	private String nickName;
	
	private ReportStatementDTO reportStatementDTO;
	private ClassDTO classDTO;
	
	public ReportClassDTO() {
	}

	public ReportClassDTO(int repCode, String email, String repContents, int classCode, Date repDate, int repTypeCode,
			String repYn, String categoryName, String nickName, ReportStatementDTO reportStatementDTO,
			ClassDTO classDTO) {
		super();
		this.repCode = repCode;
		this.email = email;
		this.repContents = repContents;
		this.classCode = classCode;
		this.repDate = repDate;
		this.repTypeCode = repTypeCode;
		this.repYn = repYn;
		this.categoryName = categoryName;
		this.nickName = nickName;
		this.reportStatementDTO = reportStatementDTO;
		this.classDTO = classDTO;
	}

	public int getRepCode() {
		return repCode;
	}

	public void setRepCode(int repCode) {
		this.repCode = repCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRepContents() {
		return repContents;
	}

	public void setRepContents(String repContents) {
		this.repContents = repContents;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public java.sql.Date getRepDate() {
		return repDate;
	}

	public void setRepDate(java.sql.Date repDate) {
		this.repDate = repDate;
	}

	public int getRepTypeCode() {
		return repTypeCode;
	}

	public void setRepTypeCode(int repTypeCode) {
		this.repTypeCode = repTypeCode;
	}

	public String getRepYn() {
		return repYn;
	}

	public void setRepYn(String repYn) {
		this.repYn = repYn;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public ReportStatementDTO getReportStatementDTO() {
		return reportStatementDTO;
	}

	public void setReportStatementDTO(ReportStatementDTO reportStatementDTO) {
		this.reportStatementDTO = reportStatementDTO;
	}

	public ClassDTO getClassDTO() {
		return classDTO;
	}

	public void setClassDTO(ClassDTO classDTO) {
		this.classDTO = classDTO;
	}

	@Override
	public String toString() {
		return "ReportClassDTO [repCode=" + repCode + ", email=" + email + ", repContents=" + repContents
				+ ", classCode=" + classCode + ", repDate=" + repDate + ", repTypeCode=" + repTypeCode + ", repYn="
				+ repYn + ", categoryName=" + categoryName + ", nickName=" + nickName + ", reportStatementDTO="
				+ reportStatementDTO + ", classDTO=" + classDTO + "]";
	}

	
}
