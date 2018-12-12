package com.test.golabang.tenant;

public class TenantDTO {
	
	private String tenantSeq;
	private String generalSeq;
	private String MobileTel;
	private String TenantPW;
	
	public String getTenantSeq() {
		return tenantSeq;
	}
	public void setTenantSeq(String tenantSeq) {
		this.tenantSeq = tenantSeq;
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
	public String getTenantPW() {
		return TenantPW;
	}
	public void setTenantPW(String tenantPW) {
		TenantPW = tenantPW;
	}
	
	@Override
	public String toString() {
		return "TenantDTO [tenantSeq=" + tenantSeq + ", generalSeq=" + generalSeq + ", MobileTel=" + MobileTel
				+ ", TenantPW=" + TenantPW + "]";
	}
	
	
	
	
}
