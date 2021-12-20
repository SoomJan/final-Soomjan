package com.soomjd.soomjan.manager.model.dto;

public class ReportStatementDTO {

	private int repTypeCode;
	private String repType;
	
	public ReportStatementDTO() {
	}

	public ReportStatementDTO(int repTypeCode, String repType) {
		super();
		this.repTypeCode = repTypeCode;
		this.repType = repType;
	}

	public int getRepTypeCode() {
		return repTypeCode;
	}

	public void setRepTypeCode(int repTypeCode) {
		this.repTypeCode = repTypeCode;
	}

	public String getRepType() {
		return repType;
	}

	public void setRepType(String repType) {
		this.repType = repType;
	}

	@Override
	public String toString() {
		return "ReportStatementDTO [repTypeCode=" + repTypeCode + ", repType=" + repType + "]";
	}
	
	
	
}
