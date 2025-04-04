package com.kh.scvote.model.vo;

public class scNoticeVO {

	
	private int noticeNo;
	private int memNo;
	private String title;
	private String content;
	private String date;
	private int count;
	private String status;
	
	
	public scNoticeVO() {}


	public scNoticeVO(int noticeNo, int memNo, String title, String content, String date, int count, String status) {
		super();
		this.noticeNo = noticeNo;
		this.memNo = memNo;
		this.title = title;
		this.content = content;
		this.date = date;
		this.count = count;
		this.status = status;
	}

	

	public scNoticeVO(int noticeNo, int memNo, String title, String content, String date) {
		super();
		this.noticeNo = noticeNo;
		this.memNo = memNo;
		this.title = title;
		this.content = content;
		this.date = date;
	}


	public scNoticeVO(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}


	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "scvoteVO [noticeNo=" + noticeNo + ", memNo=" + memNo + ", title=" + title + ", content=" + content
				+ ", date=" + date + ", count=" + count + ", status=" + status + "]";
	}
	
	
	
}
