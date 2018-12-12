package com.test.golabang.broker;

public class BrokerDTO {
	private String brokerSeq;
	private String brokername;
	private String bussiness;
	private String brokerAddress;
	private String brokerRepre;
	private String brokerTel;
	private String brokerPW;
	private String generalSeq;
	private String approval;
	
	public String getBrokerSeq() {
		return brokerSeq;
	}
	public void setBrokerSeq(String brokerSeq) {
		this.brokerSeq = brokerSeq;
	}
	public String getBrokername() {
		return brokername;
	}
	public void setBrokername(String brokername) {
		this.brokername = brokername;
	}
	public String getBussiness() {
		return bussiness;
	}
	public void setBussiness(String bussiness) {
		this.bussiness = bussiness;
	}
	public String getBrokerAddress() {
		return brokerAddress;
	}
	public void setBrokerAddress(String brokerAddress) {
		this.brokerAddress = brokerAddress;
	}
	public String getBrokerRepre() {
		return brokerRepre;
	}
	public void setBrokerRepre(String brokerRepre) {
		this.brokerRepre = brokerRepre;
	}
	public String getBrokerTel() {
		return brokerTel;
	}
	public void setBrokerTel(String brokerTel) {
		this.brokerTel = brokerTel;
	}
	public String getBrokerPW() {
		return brokerPW;
	}
	public void setBrokerPW(String brokerPW) {
		this.brokerPW = brokerPW;
	}
	public String getGeneralSeq() {
		return generalSeq;
	}
	public void setGeneralSeq(String generalSeq) {
		this.generalSeq = generalSeq;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	
	@Override
	public String toString() {
		return "BrokerDTO [brokerSeq=" + brokerSeq + ", brokername=" + brokername + ", bussiness=" + bussiness
				+ ", brokerAddress=" + brokerAddress + ", brokerRepre=" + brokerRepre + ", brokerTel=" + brokerTel
				+ ", brokerPW=" + brokerPW + ", generalSeq=" + generalSeq + ", approval=" + approval + "]";
	}
	
	
	
}
