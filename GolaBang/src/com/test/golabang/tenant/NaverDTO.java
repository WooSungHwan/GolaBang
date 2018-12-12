package com.test.golabang.tenant;

public class NaverDTO {
	
	private String naverSeq;
	private String generalSeq;
	private String MobileTel;
	
	
	public String getNaverSeq() {
		return naverSeq;
	}
	public void setNaverSeq(String naverSeq) {
		this.naverSeq = naverSeq;
	}
	public String getGeneralSeq() {
		return generalSeq;
	}
	public void setGeneralSeq(String generalSeq) {
		this.generalSeq = generalSeq;
	}
	public String getMobileTel() {
		return MobileTel;
	}
	public void setMobileTel(String mobileTel) {
		MobileTel = mobileTel;
	}
	
	@Override
	public String toString() {
		return "NaverDTO [naverSeq=" + naverSeq + ", generalSeq=" + generalSeq + ", MobileTel=" + MobileTel + "]";
	}
	
	
	
	
}
