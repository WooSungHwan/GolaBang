package com.test.golabang.broker;

public class alarmDTO {

	private String alarmSeq;
	private String dealSeq;
	private String alarmContent;
	
	
	public String getAlarmSeq() {
		return alarmSeq;
	}
	public void setAlarmSeq(String alarmSeq) {
		this.alarmSeq = alarmSeq;
	}
	public String getDealSeq() {
		return dealSeq;
	}
	public void setDealSeq(String dealSeq) {
		this.dealSeq = dealSeq;
	}
	public String getAlarmContent() {
		return alarmContent;
	}
	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}
	@Override
	public String toString() {
		return "alarmDTO [alarmSeq=" + alarmSeq + ", dealSeq=" + dealSeq + ", alarmContent=" + alarmContent + "]";
	}
	
	
}
