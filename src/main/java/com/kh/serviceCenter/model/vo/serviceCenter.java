package com.kh.serviceCenter.model.vo;

public class serviceCenter {
	
	private int inquiryNo;
	private int memNo;
	private String title;
	private String content;
	private String answer;
	private String inquiryDate;
	private String answerDate;
	private String status;
	private String name;
	private String email;
	private String phone;
	
	public serviceCenter() {}

	

	public serviceCenter(int inquiryNo, int memNo, String title, String content, String answer, String inquiryDate, String answerDate,
			String status, String name, String email, String phone) {
		super();
		this.inquiryNo = inquiryNo;
		this.memNo = memNo;
		this.title = title;
		this.content = content;
		this.answer = answer;
		this.inquiryDate = inquiryDate;
		this.answerDate = answerDate;
		this.status = status;
		this.name = name;
		this.email = email;
		this.phone = phone;
		
	}

	
	



	public serviceCenter(int inquiryNo, int memNo, String title, String content, String answer, String inquiryDate,
			String answerDate, String status, String name) {
		super();
		this.inquiryNo = inquiryNo;
		this.memNo = memNo;
		this.title = title;
		this.content = content;
		this.answer = answer;
		this.inquiryDate = inquiryDate;
		this.answerDate = answerDate;
		this.status = status;
		this.name = name;
	}



	public serviceCenter(int inquiryNo, int memNo, String title, String content, String answer, String inquiryDate,
			String answerDate, String name) {
		super();
		this.inquiryNo = inquiryNo;
		this.memNo = memNo;
		this.title = title;
		this.content = content;
		this.answer = answer;
		this.inquiryDate = inquiryDate;
		this.answerDate = answerDate;
		this.name = name;
	}



	public serviceCenter(int memNo, String content, String name, String email, String phone, String title) {
		super();
		this.memNo = memNo;
		this.title = title;
		this.content = content;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	
	
	
	

	public serviceCenter(int inquiryNo, int memNo, String title, String content, String answer, String inquiryDate,
			String answerDate) {
		super();
		this.inquiryNo = inquiryNo;
		this.memNo = memNo;
		this.title = title;
		this.content = content;
		this.answer = answer;
		this.inquiryDate = inquiryDate;
		this.answerDate = answerDate;
	}
	


	public serviceCenter(int inquiryNo, String title, String content, String inquiryDate, String name) {
		super();
		this.inquiryNo = inquiryNo;
		this.title = title;
		this.content = content;
		this.inquiryDate = inquiryDate;
		this.name = name;
	}
	


	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(String inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	public String getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "serviceCenter [inquiryNo=" + inquiryNo + ", memNo=" + memNo + ", content=" + content + ", answer="
				+ answer + ", inquiryDate=" + inquiryDate + ", answerDate=" + answerDate + ", status=" + status
				+ ", name=" + name + ", email=" + email + ", phone=" + phone + ", title=" + title + "]";
	}

	
}
