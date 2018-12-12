package com.test.golabang.admin;

public class QuestionDTO {
	
	private String questionSeq;
	private String generalSeq;
	private String itemSeq;
	private String title;
	private String content;
	private String regdate;
	
	public String getQuestionSeq() {
		return questionSeq;
	}
	public void setQuestionSeq(String questionSeq) {
		this.questionSeq = questionSeq;
	}
	public String getGeneralSeq() {
		return generalSeq;
	}
	public void setGeneralSeq(String generalSeq) {
		this.generalSeq = generalSeq;
	}
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "QuestionDTO [questionSeq=" + questionSeq + ", generalSeq=" + generalSeq + ", itemSeq=" + itemSeq
				+ ", title=" + title + ", content=" + content + ", regdate=" + regdate + "]";
	}
	

}
