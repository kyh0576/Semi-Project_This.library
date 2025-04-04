package com.kh.board.model.vo;

public class BoardAnswer {
	private int bAnswerNo;
	private int memNo; 
	private String nickName;// 테이블에서는 작성자 회원번호지만 여기다가 작성자 닉네임 넣을거임
	private int boardNo;
	private String answerContent;
	private String answerDate;
	private String status;
	
	public BoardAnswer() {}

	public BoardAnswer(int bAnswerNo, int memNo, String nickName, int boardNo, String answerContent, String answerDate,
			String status) {
		super();
		this.bAnswerNo = bAnswerNo;
		this.memNo = memNo;
		this.nickName = nickName;
		this.boardNo = boardNo;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
		this.status = status;
	}
	
	

	public BoardAnswer(int bAnswerNo, int memNo, String nickName, String answerContent, String answerDate) {
		super();
		this.bAnswerNo = bAnswerNo;
		this.memNo = memNo;
		this.nickName = nickName;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
	}

	public int getbAnswerNo() {
		return bAnswerNo;
	}

	public void setbAnswerNo(int bAnswerNo) {
		this.bAnswerNo = bAnswerNo;
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

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
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
		return "BoardAnswer [bAnswerNo=" + bAnswerNo + ", memNo=" + memNo + ", nickName=" + nickName + ", boardNo="
				+ boardNo + ", answerContent=" + answerContent + ", answerDate=" + answerDate + ", status=" + status
				+ "]";
	}

}
