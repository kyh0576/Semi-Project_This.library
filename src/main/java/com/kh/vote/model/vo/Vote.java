package com.kh.vote.model.vo;

public class Vote {
	private int voteNo;
	private int memNo;
	private String writer;
	private String voteTitle;
	private String book1;
	private String book2;
	private String voteStartDate;
	private String voteEndDate;
	private int voteCount1;
	private int voteCount2;
	private String book1Url;
	private String book2Url;
	private int count;
	private String status;
	
	public Vote () {}

	public Vote(int voteNo, int memNo, String writer, String voteTitle, String book1, String book2, String voteStartDate,
			String voteEndDate, int voteCount1, int voteCount2, String book1Url, String book2Url, int count, String status) {
		super();
		this.voteNo = voteNo;
		this.memNo = memNo;
		this.writer = writer;
		this.voteTitle = voteTitle;
		this.book1 = book1;
		this.book2 = book2;
		this.voteStartDate = voteStartDate;
		this.voteEndDate = voteEndDate;
		this.voteCount1 = voteCount1;
		this.voteCount2 = voteCount2;
		this.book1Url = book1Url;
		this.book2Url = book2Url;
		this.count = count;
		this.status = status;
	}
	
	public Vote(int voteNo, int memNo, String writer, String voteTitle, int count, String voteStartDate) {
		super();
		this.voteNo = voteNo;
		this.memNo = memNo;
		this.writer = writer;
		this.voteTitle = voteTitle;
		this.count = count;
		this.voteStartDate = voteStartDate;
	}
	
	public Vote(int memNo, String voteTitle, String book1, String book2, String book1Url, String book2Url, String voteEndDate) {
		super();
		this.memNo = memNo;
		this.voteTitle = voteTitle;
		this.book1 = book1;
		this.book2 = book2;
		this.book1Url = book1Url;
		this.book2Url = book2Url;
		this.voteEndDate = voteEndDate;
	}

	public Vote(int voteNo, int memNo, String writer, String voteTitle, String book1, String book2, String book1Url, String book2Url, String voteStartDate,
			String voteEndDate, int count) {
		super();
		this.voteNo = voteNo;
		this.memNo = memNo;
		this.writer = writer;
		this.voteTitle = voteTitle;
		this.book1 = book1;
		this.book2 = book2;
		this.book1Url = book1Url;
		this.book2Url = book2Url;
		this.voteStartDate = voteStartDate;
		this.voteEndDate = voteEndDate;
		this.count = count;
	}

	
	
	public Vote(int voteNo, String writer, int memNo, String voteTitle, String book1, String book2, String voteStartDate,
			String voteEndDate, int voteCount1, int voteCount2, String book1Url, String book2Url, int count,
			String status) {
		super();
		this.voteNo = voteNo;
		this.writer = writer;
		this.memNo = memNo;
		this.voteTitle = voteTitle;
		this.book1 = book1;
		this.book2 = book2;
		this.voteStartDate = voteStartDate;
		this.voteEndDate = voteEndDate;
		this.voteCount1 = voteCount1;
		this.voteCount2 = voteCount2;
		this.book1Url = book1Url;
		this.book2Url = book2Url;
		this.count = count;
		this.status = status;
	}

	public int getVoteNo() {
		return voteNo;
	}

	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getVoteTitle() {
		return voteTitle;
	}

	public void setVoteTitle(String voteTitle) {
		this.voteTitle = voteTitle;
	}

	public String getBook1() {
		return book1;
	}

	public void setBook1(String book1) {
		this.book1 = book1;
	}

	public String getBook2() {
		return book2;
	}

	public void setBook2(String book2) {
		this.book2 = book2;
	}

	public String getVoteStartDate() {
		return voteStartDate;
	}

	public void setVoteStartDate(String voteStartDate) {
		this.voteStartDate = voteStartDate;
	}

	public String getVoteEndDate() {
		return voteEndDate;
	}

	public void setVoteEndDate(String voteEndDate) {
		this.voteEndDate = voteEndDate;
	}

	public int getVoteCount1() {
		return voteCount1;
	}

	public void setVoteCount1(int voteCount1) {
		this.voteCount1 = voteCount1;
	}

	public int getVoteCount2() {
		return voteCount2;
	}

	public void setVoteCount2(int voteCount2) {
		this.voteCount2 = voteCount2;
	}

	public String getBook1Url() {
		return book1Url;
	}

	public void setBook1Url(String book1Url) {
		this.book1Url = book1Url;
	}

	public String getBook2Url() {
		return book2Url;
	}

	public void setBook2Url(String book2Url) {
		this.book2Url = book2Url;
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
		return "Vote [voteNo=" + voteNo + ", memNo=" + memNo + ", writer=" + writer + ", voteTitle=" + voteTitle
				+ ", book1=" + book1 + ", book2=" + book2 + ", voteStartDate=" + voteStartDate
				+ ", voteEndDate=" + voteEndDate + ", voteCount1=" + voteCount1 + ", voteCount2=" + voteCount2
				+ ", book1Url=" + book1Url + ", book2Url=" + book2Url + ", count=" + count + ", status=" + status + "]";
	}
	
}
