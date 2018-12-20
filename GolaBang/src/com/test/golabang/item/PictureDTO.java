package com.test.golabang.item;

public class PictureDTO {

	private String pictureSeq;
	private String pictureName;
	private String itemSeq;
	public String getPictureSeq() {
		return pictureSeq;
	}
	public void setPictureSeq(String pictureSeq) {
		this.pictureSeq = pictureSeq;
	}
	public String getPictureName() {
		return pictureName;
	}
	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}
	@Override
	public String toString() {
		return "pictureDTO [pictureSeq=" + pictureSeq + ", pictureName=" + pictureName + ", itemSeq=" + itemSeq + "]";
	}
	
	
	
}
