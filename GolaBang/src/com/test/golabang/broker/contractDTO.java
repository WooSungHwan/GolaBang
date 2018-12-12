package com.test.golabang.broker;

public class contractDTO {

	private String dealSeq;
	private String tenantAgree;
	private String brokerAgree;
	
	public String getDealSeq() {
		return dealSeq;
	}
	public void setDealSeq(String dealSeq) {
		this.dealSeq = dealSeq;
	}
	public String getTenantAgree() {
		return tenantAgree;
	}
	public void setTenantAgree(String tenantAgree) {
		this.tenantAgree = tenantAgree;
	}
	public String getBrokerAgree() {
		return brokerAgree;
	}
	public void setBrokerAgree(String brokerAgree) {
		this.brokerAgree = brokerAgree;
	}
	
	@Override
	public String toString() {
		return "contractDTO [dealSeq=" + dealSeq + ", tenantAgree=" + tenantAgree + ", brokerAgree=" + brokerAgree
				+ "]";
	}
	
	
	
}

