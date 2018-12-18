package com.test.golabang.item;

public class OptionListDTO {
	private String optionSeq;
	private String itemSeq;
	private String optionName;
	private String quantity;
	private String newItem;
	public String getOptionSeq() {
		return optionSeq;
	}
	public void setOptionSeq(String optionSeq) {
		this.optionSeq = optionSeq;
	}
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getNewItem() {
		return newItem;
	}
	public void setNewItem(String newItem) {
		this.newItem = newItem;
	}
	
	@Override
	public String toString() {
		return "OptionListDTO [optionSeq=" + optionSeq + ", itemSeq=" + itemSeq + ", optionName=" + optionName
				+ ", quantity=" + quantity + ", newItem=" + newItem + "]";
	}
	
	
}
