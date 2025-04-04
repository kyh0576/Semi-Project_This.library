package com.kh.book.model.vo;

public class BookAnswer {
	private int bookAnswerNo;
	private String isbnNo;
	private int memNo;
	private String nickName;
	private String answerContent;
	private int star;
	private String answerDate;
	private String status;
	
	public BookAnswer() {}

	public BookAnswer(int bookAnswerNo, String isbnNo, int memNo, String nickName, String answerContent, int star,
			String answerDate, String status) {
		super();
		this.bookAnswerNo = bookAnswerNo;
		this.isbnNo = isbnNo;
		this.memNo = memNo;
		this.nickName = nickName;
		this.answerContent = answerContent;
		this.star = star;
		this.answerDate = answerDate;
		this.status = status;
	}

	public BookAnswer(int bookAnswerNo, String isbnNo, int memNo, String nickName, String answerContent, int star,
			String answerDate) {
		super();
		this.bookAnswerNo = bookAnswerNo;
		this.isbnNo = isbnNo;
		this.memNo = memNo;
		this.nickName = nickName;
		this.answerContent = answerContent;
		this.star = star;
		this.answerDate = answerDate;
	}

	public int getBookAnswerNo() {
		return bookAnswerNo;
	}

	public void setBookAnswerNo(int bookAnswerNo) {
		this.bookAnswerNo = bookAnswerNo;
	}

	public String getIsbnNo() {
		return isbnNo;
	}

	public void setIsbnNo(String isbnNo) {
		this.isbnNo = isbnNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
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
		return "BookAnswer [bookAnswerNo=" + bookAnswerNo + ", isbnNo=" + isbnNo + ", memNo=" + memNo + ", nickName="
				+ nickName + ", answerContent=" + answerContent + ", star=" + star + ", answerDate=" + answerDate
				+ ", status=" + status + "]";
	}
	
	
}
