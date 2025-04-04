package com.kh.member.model.vo;

public class Book {
	
	int bookNo;
	String gCode;
	String bookTitle;
	String bookImage;
	String bookWriter;
	String bookEditor;
	String bookPublisher;
	String story;
	int bookLike;
	int voteResult;

	public Book() {}

	public Book(int bookNo, String gCode, String bookTitle, String bookImage, String bookWriter, String bookEditor,
			String bookPublisher, String story, int bookLike, int voteResult) {
		super();
		this.bookNo = bookNo;
		this.gCode = gCode;
		this.bookTitle = bookTitle;
		this.bookImage = bookImage;
		this.bookWriter = bookWriter;
		this.bookEditor = bookEditor;
		this.bookPublisher = bookPublisher;
		this.story = story;
		this.bookLike = bookLike;
		this.voteResult = voteResult;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getgCode() {
		return gCode;
	}

	public void setgCode(String gCode) {
		this.gCode = gCode;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getBookImage() {
		return bookImage;
	}

	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}

	public String getBookWriter() {
		return bookWriter;
	}

	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}

	public String getBookEditor() {
		return bookEditor;
	}

	public void setBookEditor(String bookEditor) {
		this.bookEditor = bookEditor;
	}

	public String getBookPublisher() {
		return bookPublisher;
	}

	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public int getBookLike() {
		return bookLike;
	}

	public void setBookLike(int bookLike) {
		this.bookLike = bookLike;
	}

	public int getVoteResult() {
		return voteResult;
	}

	public void setVoteResult(int voteResult) {
		this.voteResult = voteResult;
	}

	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", gCode=" + gCode + ", bookTitle=" + bookTitle + ", bookImage=" + bookImage
				+ ", bookWriter=" + bookWriter + ", bookEditor=" + bookEditor + ", bookPublisher=" + bookPublisher
				+ ", story=" + story + ", bookLike=" + bookLike + ", voteResult=" + voteResult + "]";
	}
	
	
}
