package com.test.golabang.admin;

public class BbsDTO {

	private String seq;
	private String subject; // 제목
	private String content; // 내용
	private String name; // 이름
	private String regdate; // 날짜
	private String readcount; // 조회수
	private String type; // 게시글 유형(공지,일반)
	private String itemseq;
	private String commentcnt;
	
	
	public String getCommentcnt() {
		return commentcnt;
	}
	public void setCommentcnt(String commentcnt) {
		this.commentcnt = commentcnt;
	}
	public String getItemseq() {
		return itemseq;
	}
	public void setItemseq(String itemseq) {
		this.itemseq = itemseq;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getReadcount() {
		return readcount;
	}
	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}
	
	
}
