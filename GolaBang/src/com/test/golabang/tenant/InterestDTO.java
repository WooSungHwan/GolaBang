package com.test.golabang.tenant;

public class InterestDTO {

	private String itemseq;
	private String kind;
	private String dealkind;
	private String deposit;
	private String monthly;
	private String floor;
	private String supplyarea;
	private String admincost;
	private String subject;
	private String registerdate;
	private String optionname;
	
	
	
	@Override
	public String toString() {
		return "InterestDTO [kind=" + kind + ", dealkind=" + dealkind + ", deposit=" + deposit + ", monthly=" + monthly
				+ ", floor=" + floor + ", supplyarea=" + supplyarea + ", admincost=" + admincost + ", subject="
				+ subject + ", registerdate=" + registerdate + ", optionname=" + optionname + "]";
	}
	
	
	
	public String getItemseq() {
		return itemseq;
	}



	public void setItemseq(String itemseq) {
		this.itemseq = itemseq;
	}



	public String getOptionname() {
		return optionname;
	}



	public void setOptionname(String optionname) {
		this.optionname = optionname;
	}



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
	public String getRegisterdate() {
		return registerdate;
	}
	public void setRegisterdate(String registerdate) {
		this.registerdate = registerdate;
	}
	
	
	
}
