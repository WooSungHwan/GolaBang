package com.test.golabang;

public class MaxDataDTO {

	private int traffic;
	private int convenience;
	private int safe;
	private int cctv;
	private int byPyeong;
	
	
	
	@Override
	public String toString() {
		return "MaxDataDTO [traffic=" + traffic + ", convenience=" + convenience + ", safe=" + safe + ", cctv=" + cctv
				+ ", byPyeong=" + byPyeong + "]";
	}
	
	public int getTraffic() {
		return traffic;
	}
	public void setTraffic(int traffic) {
		this.traffic = traffic;
	}
	public int getConvenience() {
		return convenience;
	}
	public void setConvenience(int convenience) {
		this.convenience = convenience;
	}
	public int getSafe() {
		return safe;
	}
	public void setSafe(int safe) {
		this.safe = safe;
	}
	public int getCctv() {
		return cctv;
	}
	public void setCctv(int cctv) {
		this.cctv = cctv;
	}
	public int getByPyeong() {
		return byPyeong;
	}
	public void setByPyeong(int byPyeong) {
		this.byPyeong = byPyeong;
	}
	
	
	
	
	
}
