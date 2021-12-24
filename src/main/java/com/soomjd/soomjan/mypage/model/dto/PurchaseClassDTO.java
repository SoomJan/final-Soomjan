package com.soomjd.soomjan.mypage.model.dto;

import java.sql.Date;

import com.soomjd.soomjan.classRoom.model.dto.ClassDTO;
import com.soomjd.soomjan.classRoom.model.dto.PaymentDTO;
import com.soomjd.soomjan.jandi.model.dto.CalculateDTO;
import com.soomjd.soomjan.jandi.model.dto.JandiDTO;
import com.soomjd.soomjan.matching.model.dto.CategoryDTO;

public class PurchaseClassDTO {

	private String email;
	private int classCode;
	private char status;
	private int payCode;
	private int classPurcCode;
	private java.sql.Date endDate;
	private String teacher;
	
	private ClassDTO classDTO;
    private CategoryDTO categoryDTO;
    private JandiDTO jandiDTO;
    private PaymentDTO paymentDTO;
    private ReviewDTO reviewDTO;
    private CalculateDTO calculateDTO;
	
	public PurchaseClassDTO() {}

	
	
	public PurchaseClassDTO(String email, int classCode, char status, int payCode, int classPurcCode, Date endDate,
			String teacher, ClassDTO classDTO, CategoryDTO categoryDTO, JandiDTO jandiDTO, PaymentDTO paymentDTO,
			ReviewDTO reviewDTO, CalculateDTO calculateDTO) {
		super();
		this.email = email;
		this.classCode = classCode;
		this.status = status;
		this.payCode = payCode;
		this.classPurcCode = classPurcCode;
		this.endDate = endDate;
		this.teacher = teacher;
		this.classDTO = classDTO;
		this.categoryDTO = categoryDTO;
		this.jandiDTO = jandiDTO;
		this.paymentDTO = paymentDTO;
		this.reviewDTO = reviewDTO;
		this.calculateDTO = calculateDTO;
	}



	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public int getClassPurcCode() {
		return classPurcCode;
	}

	public void setClassPurcCode(int classPurcCode) {
		this.classPurcCode = classPurcCode;
	}

	public java.sql.Date getEndDate() {
		return endDate;
	}

	public void setEndDate(java.sql.Date endDate) {
		this.endDate = endDate;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public ClassDTO getClassDTO() {
		return classDTO;
	}

	public void setClassDTO(ClassDTO classDTO) {
		this.classDTO = classDTO;
	}

	public CategoryDTO getCategoryDTO() {
		return categoryDTO;
	}

	public void setCategoryDTO(CategoryDTO categoryDTO) {
		this.categoryDTO = categoryDTO;
	}

	public JandiDTO getJandiDTO() {
		return jandiDTO;
	}

	public void setJandiDTO(JandiDTO jandiDTO) {
		this.jandiDTO = jandiDTO;
	}

	public PaymentDTO getPaymentDTO() {
		return paymentDTO;
	}

	public void setPaymentDTO(PaymentDTO paymentDTO) {
		this.paymentDTO = paymentDTO;
	}

	public ReviewDTO getReviewDTO() {
		return reviewDTO;
	}

	public void setReviewDTO(ReviewDTO reviewDTO) {
		this.reviewDTO = reviewDTO;
	}

	public CalculateDTO getCalculateDTO() {
		return calculateDTO;
	}



	public void setCalculateDTO(CalculateDTO calculateDTO) {
		this.calculateDTO = calculateDTO;
	}



	@Override
	public String toString() {
		return "PurchaseClassDTO [email=" + email + ", classCode=" + classCode + ", status=" + status + ", payCode="
				+ payCode + ", classPurcCode=" + classPurcCode + ", endDate=" + endDate + ", teacher=" + teacher
				+ ", classDTO=" + classDTO + ", categoryDTO=" + categoryDTO + ", jandiDTO=" + jandiDTO + ", paymentDTO="
				+ paymentDTO + ", reviewDTO=" + reviewDTO + ", calculateDTO=" + calculateDTO + "]";
	}


	
	
}
