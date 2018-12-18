package com.test.golabang.item;

public class DetailContentDTO {

	private String itemSeq;
	private String subject;
	private String content;
	private String closedNote;
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
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
	public String getClosedNote() {
		return closedNote;
	}
	public void setClosedNote(String closedNote) {
		this.closedNote = closedNote;
	}
	@Override
	public String toString() {
		return "DetailContentDTO [itemSeq=" + itemSeq + ", subject=" + subject + ", content=" + content
				+ ", closedNote=" + closedNote + "]";
	}
	
	
	
	
	
}
