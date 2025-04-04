package com.kh.board.model.vo;

public class Board {
	private int boardNo;
    private int memNo;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private int count;
	private String writeDate;
	private String status;
	
	public Board() {}

	public Board(int boardNo, int memNo, String boardTitle, String boardContent, String boardWriter, int count, String writeDate,
			String status) {
		super();
		this.boardNo = boardNo;
		this.memNo = memNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.writeDate = writeDate;
		this.status = status;
	}

	public Board(int boardNo, String boardWriter, String boardTitle, String boardContent, int count, String writeDate) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.writeDate = writeDate;
	}
	
	public Board(int boardNo, int memNo, String boardWriter, String boardTitle, String boardContent, int count, String writeDate) {
		super();
		this.boardNo = boardNo;
		this.memNo = memNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.writeDate = writeDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	
	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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
		return "Board [boardNo=" + boardNo + ", memNo=" + memNo + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardWriter=" + boardWriter + ", count=" + count + ", writeDate=" + writeDate
				+ ", status=" + status + "]";
	}

}
