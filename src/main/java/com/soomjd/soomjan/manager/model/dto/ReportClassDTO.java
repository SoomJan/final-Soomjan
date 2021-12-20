package com.soomjd.soomjan.manager.model.dto;

import java.sql.Date;

public class ReportClassDTO {

	private int repCode;
	private String email;
	private String repContents;
	private int classCode;
	private java.sql.Date repDate;
	private int repTypeCode;
	private String repYn;
	
	private ReportStatementDTO reportStatementDTO;
	
	public ReportClassDTO() {
	}

	public ReportClassDTO(int repCode, String email, String repContents, int classCode, Date repDate, int repTypeCode,
			String repYn, ReportStatementDTO reportStatementDTO) {
		super();
		this.repCode = repCode;
		this.email = email;
		this.repContents = repContents;
		this.classCode = classCode;
		this.repDate = repDate;
		this.repTypeCode = repTypeCode;
		this.repYn = repYn;
		this.reportStatementDTO = reportStatementDTO;
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

	public ReportStatementDTO getReportStatementDTO() {
		return reportStatementDTO;
	}

	public void setReportStatementDTO(ReportStatementDTO reportStatementDTO) {
		this.reportStatementDTO = reportStatementDTO;
	}

	@Override
	public String toString() {
		return "ReportClassDTO [repCode=" + repCode + ", email=" + email + ", repContents=" + repContents
				+ ", classCode=" + classCode + ", repDate=" + repDate + ", repTypeCode=" + repTypeCode + ", repYn="
				+ repYn + ", reportStatementDTO=" + reportStatementDTO + "]";
	}

	
	
}
