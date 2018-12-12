package com.test.golabang.broker;

public class DealDTO {
	private String dealSeq;
	private String generalSeq;
	private String itemSeq;
	private String situation;
	private String regdate;
	
	public String getDealSeq() {
		return dealSeq;
	}
	public void setDealSeq(String dealSeq) {
		this.dealSeq = dealSeq;
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
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
