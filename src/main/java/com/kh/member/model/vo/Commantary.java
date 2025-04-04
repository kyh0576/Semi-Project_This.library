package com.kh.member.model.vo;

public class Commantary {

	
	private int writeNo;
	private int memNo;
	private String author;
	private String title;
	private String content;
	private int rating;
	private String writeDate;
	private String status;
	
	
	public Commantary() {}
	
	
	
	
	
	public Commantary(int writeNo, int memNo, String author, String title, String content, String writeDate) {
		super();
		this.writeNo = writeNo;
		this.memNo = memNo;
		this.author = author;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
	}
	public Commantary(int writeNo, int memNo, String content, int rating, String writeDate, String status) {
		super();
		this.writeNo = writeNo;
		this.memNo = memNo;
		this.content = content;
		this.rating = rating;
		this.writeDate = writeDate;
		this.status = status;
	}
	
	public Commantary(int memNo, String author, String title, String content) {
		super();
		this.memNo = memNo;
		this.author = author;
		this.title = title;
		this.content = content;
	}
	
	




	public Commantary(int writeNo, int memNo, String author, String title, String content) {
		super();
		this.writeNo = writeNo;
		this.memNo = memNo;
		this.author = author;
		this.title = title;
		this.content = content;
	}





	public String getAuthor() {
		return author;
	}





	public void setAuthor(String author) {
		this.author = author;
	}





	public String getTitle() {
		return title;
	}





	public void setTitle(String title) {
		this.title = title;
	}





	public int getWriteNo() {
		return writeNo;
	}
	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
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
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	@Override
	public String toString() {
		return "Commantary [writeNo=" + writeNo + ", memNo=" + memNo + ", author=" + author + ", title=" + title
				+ ", content=" + content + ", rating=" + rating + ", writeDate=" + writeDate + ", status=" + status
				+ "]";
	}
	
	
	
	
	
	
	
}
