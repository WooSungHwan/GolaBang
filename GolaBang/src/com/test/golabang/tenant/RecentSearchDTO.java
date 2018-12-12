package com.test.golabang.tenant;

public class RecentSearchDTO {
	private String recentSearchSeq;
	private String generalSeq;
	private String itemSeq;
	private String regdate;
	
	
	
	
	@Override
	public String toString() {
		return "RecentSearchDTO [recentSearchSeq=" + recentSearchSeq + ", generalSeq=" + generalSeq + ", itemSeq="
				+ itemSeq + ", regdate=" + regdate + "]";
	}
	public String getRecentSearchSeq() {
		return recentSearchSeq;
	}
	public void setRecentSearchSeq(String recentSearchSeq) {
		this.recentSearchSeq = recentSearchSeq;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
