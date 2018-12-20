package com.test.golabang.admin;

public class FakeItemBoardDTO {

	private String fakeItemBoardSeq;
	private String generalSeq;
	private String itemSeq;
	private String title;
	private String content;
	private String type;
	private String regdate;
	private String readcount;
	
	public String getReadcount() {
		return readcount;
	}
	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}
	public String getFakeItemBoardSeq() {
		return fakeItemBoardSeq;
	}
	public void setFakeItemBoardSeq(String fakeItemBoardSeq) {
		this.fakeItemBoardSeq = fakeItemBoardSeq;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "FakeItemBoardDTO [fakeItemBoardSeq=" + fakeItemBoardSeq + ", generalSeq=" + generalSeq + ", itemSeq="
				+ itemSeq + ", title=" + title + ", content=" + content + ", type=" + type + ", regdate=" + regdate
				+ ", readcount=" + readcount + "]";
	}

	
	
	
	
}
