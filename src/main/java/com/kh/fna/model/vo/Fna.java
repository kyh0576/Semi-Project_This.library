package com.kh.fna.model.vo;

public class Fna {

	private int fna_no;
	private String fna_title;
	private String content;
	private String answer;
	private String date;
	private String status;
	
	public Fna() {}

	public Fna(int fna_no, String fna_title, String content, String answer, String date, String status) {
		super();
		this.fna_no = fna_no;
		this.fna_title = fna_title;
		this.content = content;
		this.answer = answer;
		this.date = date;
		this.status = status;
	}
	public Fna(int fna_no, String fna_title, String content, String answer, String date) {
		super();
		this.fna_no = fna_no;
		this.fna_title = fna_title;
		this.content = content;
		this.answer = answer;
		this.date = date;
	}
	public Fna(int fna_no, String answer) {
		super();
		this.answer = answer;
		this.fna_no = fna_no;
		
	}

	public int getFna_no() {
		return fna_no;
	}

	public void setFna_no(int fna_no) {
		this.fna_no = fna_no;
	}

	public String getFna_title() {
		return fna_title;
	}

	public void setFna_title(String fna_title) {
		this.fna_title = fna_title;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Fna [fna_no=" + fna_no + ", fna_title=" + fna_title + ", content=" + content + ", answer=" + answer
				+ ", date=" + date + ", status=" + status + "]";
	}
	
	
	

}
