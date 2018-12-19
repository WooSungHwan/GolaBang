package com.test.golabang.tenant;

public class DetermineRoomDTO {

	private String kind;
	private String dealkind;
	private String deposit;
	private String monthly;
	private String floor;
	private String supplyarea;
	private String admincost;
	private String subject;
	
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getDealkind() {
		return dealkind;
	}
	public void setDealkind(String dealkind) {
		this.dealkind = dealkind;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public String getMonthly() {
		return monthly;
	}
	public void setMonthly(String monthly) {
		this.monthly = monthly;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getSupplyarea() {
		return supplyarea;
	}
	public void setSupplyarea(String supplyarea) {
		this.supplyarea = supplyarea;
	}
	public String getAdmincost() {
		return admincost;
	}
	public void setAdmincost(String admincost) {
		this.admincost = admincost;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

	
	@Override
	public String toString() {
		return "DetermineRoomDTO [kind=" + kind + ", dealkind=" + dealkind + ", deposit=" + deposit + ", monthly="
				+ monthly + ", floor=" + floor + ", supplyarea=" + supplyarea + ", admincost=" + admincost
				+ ", subject=" + subject + "]";
	}
	
	
	
	
}
