package com.test.golabang.tenant;

public class OptionDTO {
	
	private String itemseq;
	private String optionname;
	private String quantity;
	
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
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	@Override
	public String toString() {
		return "OptionDTO [itemseq=" + itemseq + ", optionname=" + optionname + ", quantity=" + quantity + "]";
	}
	
	
	
}
