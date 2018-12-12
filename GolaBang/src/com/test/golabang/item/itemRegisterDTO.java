package com.test.golabang.item;

public class itemRegisterDTO {

	private String itemSeq;
	private String brokerSeq;
	private String kind;
	private String address;
	private String dealkind;
	private String supplyArea;
	private String totalFloor;
	private String floor;
	private String useArea;
	private String heatingKind;
	private String moveDate;
	private String view;
	private String registerDate;
	private String dealSituation;
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}
	public String getBrokerSeq() {
		return brokerSeq;
	}
	public void setBrokerSeq(String brokerSeq) {
		this.brokerSeq = brokerSeq;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDealkind() {
		return dealkind;
	}
	public void setDealkind(String dealkind) {
		this.dealkind = dealkind;
	}
	public String getSupplyArea() {
		return supplyArea;
	}
	public void setSupplyArea(String supplyArea) {
		this.supplyArea = supplyArea;
	}
	public String getTotalFloor() {
		return totalFloor;
	}
	public void setTotalFloor(String totalFloor) {
		this.totalFloor = totalFloor;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getUseArea() {
		return useArea;
	}
	public void setUseArea(String useArea) {
		this.useArea = useArea;
	}
	public String getHeatingKind() {
		return heatingKind;
	}
	public void setHeatingKind(String heatingKind) {
		this.heatingKind = heatingKind;
	}
	public String getMoveDate() {
		return moveDate;
	}
	public void setMoveDate(String moveDate) {
		this.moveDate = moveDate;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	public String getDealSituation() {
		return dealSituation;
	}
	public void setDealSituation(String dealSituation) {
		this.dealSituation = dealSituation;
	}
	
	@Override
	public String toString() {
		return "itemRegisterDTO [itemSeq=" + itemSeq + ", brokerSeq=" + brokerSeq + ", kind=" + kind + ", address="
				+ address + ", dealkind=" + dealkind + ", supplyArea=" + supplyArea + ", totalFloor=" + totalFloor
				+ ", floor=" + floor + ", useArea=" + useArea + ", heatingKind=" + heatingKind + ", moveDate="
				+ moveDate + ", view=" + view + ", registerDate=" + registerDate + ", dealSituation=" + dealSituation
				+ "]";
	}
	
	
	
}
