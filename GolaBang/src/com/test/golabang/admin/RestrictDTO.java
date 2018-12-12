package com.test.golabang.admin;

public class RestrictDTO {
	
	private String restrictSeq;
	private String generalSeq;
	private String regdate;
	
	public String getRestrictSeq() {
		return restrictSeq;
	}
	public void setRestrictSeq(String restrictSeq) {
		this.restrictSeq = restrictSeq;
	}
	public String getGeneralSeq() {
		return generalSeq;
	}
	public void setGeneralSeq(String generalSeq) {
		this.generalSeq = generalSeq;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "RestrictDTO [restrictSeq=" + restrictSeq + ", generalSeq=" + generalSeq + ", regdate=" + regdate + "]";
	}
	
	
	
}
