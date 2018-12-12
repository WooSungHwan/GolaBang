package com.test.golabang.item;

public class addInfoDTO {

	private String itemSeq;
	private String adminCost;
	private String adminCostItem;
	private String parking;
	private String pet;
	private String elevator;
	private String balcony;
	private String builtIn;
	
	@Override
	public String toString() {
		return "addInfoDTO [itemSeq=" + itemSeq + ", adminCost=" + adminCost + ", adminCostItem=" + adminCostItem
				+ ", parking=" + parking + ", pet=" + pet + ", elevator=" + elevator + ", balcony=" + balcony
				+ ", builtIn=" + builtIn + "]";
	}
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}
	public String getAdminCost() {
		return adminCost;
	}
	public void setAdminCost(String adminCost) {
		this.adminCost = adminCost;
	}
	public String getAdminCostItem() {
		return adminCostItem;
	}
	public void setAdminCostItem(String adminCostItem) {
		this.adminCostItem = adminCostItem;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getPet() {
		return pet;
	}
	public void setPet(String pet) {
		this.pet = pet;
	}
	public String getElevator() {
		return elevator;
	}
	public void setElevator(String elevator) {
		this.elevator = elevator;
	}
	public String getBalcony() {
		return balcony;
	}
	public void setBalcony(String balcony) {
		this.balcony = balcony;
	}
	public String getBuiltIn() {
		return builtIn;
	}
	public void setBuiltIn(String builtIn) {
		this.builtIn = builtIn;
	}
	
	
	
}
