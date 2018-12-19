package com.test.golabang.admin;

public class joinRequestDTO {

	private String joinRequestSeq;
	private String brokerSeq;
	
	public String getJoinRequestSeq() {
		return joinRequestSeq;
	}
	public void setJoinRequestSeq(String joinRequestSeq) {
		this.joinRequestSeq = joinRequestSeq;
	}
	public String getBrokerSeq() {
		return brokerSeq;
	}
	public void setBrokerSeq(String brokerSeq) {
		this.brokerSeq = brokerSeq;
	}
	@Override
	public String toString() {
		return "joinRequestDTO [joinRequestSeq=" + joinRequestSeq + ", brokerSeq=" + brokerSeq + "]";
	}
	
	
}
