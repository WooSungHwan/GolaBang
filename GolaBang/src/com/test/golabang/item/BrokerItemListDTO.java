package com.test.golabang.item;

public class BrokerItemListDTO {
	
	private String brokerSeq;
	private String itemSeq;
	private String itemAddress;
	private String itemKind;
	private String itemDealKind;
	private String itemView;
	private String itemDealSituation;
	private String itemClosedNote;
	private String itemPicture;
	private String itemFavorite;
	private String itemDeposit;
	private String itemMonthly;

	public String getBrokerSeq() {
		return brokerSeq;
	}
	public void setBrokerSeq(String brokerSeq) {
		this.brokerSeq = brokerSeq;
	}
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}
	public String getItemAddress() {
		return itemAddress;
	}
	public void setItemAddress(String itemAddress) {
		this.itemAddress = itemAddress;
	}
	public String getItemKind() {
		return itemKind;
	}
	public void setItemKind(String itemKind) {
		this.itemKind = itemKind;
	}
	public String getItemDealKind() {
		return itemDealKind;
	}
	public void setItemDealKind(String itemDealKind) {
		this.itemDealKind = itemDealKind;
	}
	public String getItemView() {
		return itemView;
	}
	public void setItemView(String itemView) {
		this.itemView = itemView;
	}
	public String getItemDealSituation() {
		return itemDealSituation;
	}
	public void setItemDealSituation(String itemDealSituation) {
		this.itemDealSituation = itemDealSituation;
	}
	public String getItemClosedNote() {
		return itemClosedNote;
	}
	public void setItemClosedNote(String itemClosedNote) {
		this.itemClosedNote = itemClosedNote;
	}
	public String getItemPicture() {
		return itemPicture;
	}
	public void setItemPicture(String itemPicture) {
		this.itemPicture = itemPicture;
	}
	public String getItemFavorite() {
		return itemFavorite;
	}
	public void setItemFavorite(String itemFavorite) {
		this.itemFavorite = itemFavorite;
	}
	public String getItemDeposit() {
		return itemDeposit;
	}
	public void setItemDeposit(String itemDeposit) {
		this.itemDeposit = itemDeposit;
	}
	public String getItemMonthly() {
		return itemMonthly;
	}
	public void setItemMonthly(String itemMonthly) {
		this.itemMonthly = itemMonthly;
	}
	
	
	@Override
	public String toString() {
		return "BrokerItemListDTO [brokerSeq=" + brokerSeq + ", itemSeq=" + itemSeq + ", itemAddress=" + itemAddress
				+ ", itemKind=" + itemKind + ", itemDealKind=" + itemDealKind + ", itemView=" + itemView
				+ ", itemDealSituation=" + itemDealSituation + ", itemClosedNote=" + itemClosedNote + ", itemPicture="
				+ itemPicture + ", itemFavorite=" + itemFavorite + ", itemDeposit=" + itemDeposit + ", itemMonthly="
				+ itemMonthly + "]";
	}
	
}
