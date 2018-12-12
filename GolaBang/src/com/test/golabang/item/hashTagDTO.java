package com.test.golabang.item;

public class hashTagDTO {

	private String hashSeq;
	private String tagName;
	private String itemSeq;
	
	public String getHashSeq() {
		return hashSeq;
	}
	public void setHashSeq(String hashSeq) {
		this.hashSeq = hashSeq;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}
	
	@Override
	public String toString() {
		return "hashTagDTO [hashSeq=" + hashSeq + ", tagName=" + tagName + ", itemSeq=" + itemSeq + "]";
	}
	
	
	
}
