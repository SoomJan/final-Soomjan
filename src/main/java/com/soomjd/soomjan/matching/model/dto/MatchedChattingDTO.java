package com.soomjd.soomjan.matching.model.dto;

import java.util.Map;

public class MatchedChattingDTO {
	
	private int matchedCode;
	private int estimateCode;
	private String email;
	
	public MatchedChattingDTO() {
	}
	
	public MatchedChattingDTO(int matchedCode, int estimateCode, String email) {
		super();
		this.matchedCode = matchedCode;
		this.estimateCode = estimateCode;
		this.email = email;
	}

	public int getMatchedCode() {
		return matchedCode;
	}

	public void setMatchedCode(int matchedCode) {
		this.matchedCode = matchedCode;
	}

	public int getEstimateCode() {
		return estimateCode;
	}

	public void setEstimateCode(int estimateCode) {
		this.estimateCode = estimateCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MatchedChattingDTO [matchedCode=" + matchedCode + ", estimateCode=" + estimateCode + ", email=" + email
				+ "]";
	}

	
	
	
	

}
