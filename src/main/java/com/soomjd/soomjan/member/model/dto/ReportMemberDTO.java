package com.soomjd.soomjan.member.model.dto;

import java.sql.Date;

import com.soomjd.soomjan.manager.model.dto.ReportStatementDTO;

public class ReportMemberDTO {
	
	private String email;
	private int repCode;
	private String contents;
	private java.sql.Date repDate;
	private String imgPath;
	private String repEmail;
	private int repTypeCode;
	private String orgImgPath;
	private char repYn;
	private String repType;
	
	private ReportStatementDTO reportStatementDTO;
	
	public ReportMemberDTO() {}

	public ReportMemberDTO(String email, int repCode, String contents, Date repDate, String imgPath, String repEmail,
			int repTypeCode, String orgImgPath, char repYn, String repType, ReportStatementDTO reportStatementDTO) {
		super();
		this.email = email;
		this.repCode = repCode;
		this.contents = contents;
		this.repDate = repDate;
		this.imgPath = imgPath;
		this.repEmail = repEmail;
		this.repTypeCode = repTypeCode;
		this.orgImgPath = orgImgPath;
		this.repYn = repYn;
		this.repType = repType;
		this.reportStatementDTO = reportStatementDTO;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getRepCode() {
		return repCode;
	}

	public void setRepCode(int repCode) {
		this.repCode = repCode;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public java.sql.Date getRepDate() {
		return repDate;
	}

	public void setRepDate(java.sql.Date repDate) {
		this.repDate = repDate;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getRepEmail() {
		return repEmail;
	}

	public void setRepEmail(String repEmail) {
		this.repEmail = repEmail;
	}

	public int getRepTypeCode() {
		return repTypeCode;
	}

	public void setRepTypeCode(int repTypeCode) {
		this.repTypeCode = repTypeCode;
	}

	public String getOrgImgPath() {
		return orgImgPath;
	}

	public void setOrgImgPath(String orgImgPath) {
		this.orgImgPath = orgImgPath;
	}

	public char getRepYn() {
		return repYn;
	}

	public void setRepYn(char repYn) {
		this.repYn = repYn;
	}

	public String getRepType() {
		return repType;
	}

	public void setRepType(String repType) {
		this.repType = repType;
	}

	public ReportStatementDTO getReportStatementDTO() {
		return reportStatementDTO;
	}

	public void setReportStatementDTO(ReportStatementDTO reportStatementDTO) {
		this.reportStatementDTO = reportStatementDTO;
	}

	@Override
	public String toString() {
		return "ReportMemberDTO [email=" + email + ", repCode=" + repCode + ", contents=" + contents + ", repDate="
				+ repDate + ", imgPath=" + imgPath + ", repEmail=" + repEmail + ", repTypeCode=" + repTypeCode
				+ ", orgImgPath=" + orgImgPath + ", repYn=" + repYn + ", repType=" + repType + ", reportStatementDTO="
				+ reportStatementDTO + "]";
	}

	
	
	
}
