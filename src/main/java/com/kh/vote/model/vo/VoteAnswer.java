package com.kh.vote.model.vo;

public class VoteAnswer {
	private int vAnswerNo;
	private int voteNo;
	private String nickName; // 테이블에서는 작성자 회원번호지만 여기다가 작성자 닉네임 넣을거임
	private int memNo;
	private String vAnswer;
	private String answerDate;
	private String status;
	
	public VoteAnswer() {}

	public VoteAnswer(int vAnswerNo, int voteNo, String nickName, int memNo, String vAnswer, String answerDate,
			String status) {
		super();
		this.vAnswerNo = vAnswerNo;
		this.voteNo = voteNo;
		this.nickName = nickName;
		this.memNo = memNo;
		this.vAnswer = vAnswer;
		this.answerDate = answerDate;
		this.status = status;
	}

	
	public VoteAnswer(int vAnswerNo, String nickName, int memNo, String vAnswer, String answerDate) {
		super();
		this.vAnswerNo = vAnswerNo;
		this.nickName = nickName;
		this.memNo = memNo;
		this.vAnswer = vAnswer;
		this.answerDate = answerDate;
	}

	public int getvAnswerNo() {
		return vAnswerNo;
	}

	public void setvAnswerNo(int vAnswerNo) {
		this.vAnswerNo = vAnswerNo;
	}

	public int getVoteNo() {
		return voteNo;
	}

	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getvAnswer() {
		return vAnswer;
	}

	public void setvAnswer(String vAnswer) {
		this.vAnswer = vAnswer;
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
		return "VoteAnswer [vAnswerNo=" + vAnswerNo + ", voteNo=" + voteNo + ", nickName=" + nickName + ", memNo="
				+ memNo + ", vAnswer=" + vAnswer + ", answerDate=" + answerDate + ", status=" + status + "]";
	}
	
}
