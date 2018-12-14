package com.test.golabang.tenant;

public class GeneralDTO {
	private String generalSeq;
	private String email;
	private String name;
	private String kindOf;
	private String pw;
	private String tel;
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getGeneralSeq() {
		return generalSeq;
	}
	public void setGeneralSeq(String generalSeq) {
		this.generalSeq = generalSeq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKindOf() {
		return kindOf;
	}
	public void setKindOf(String kindOf) {
		this.kindOf = kindOf;
	}
	@Override
	public String toString() {
		return "GeneralDTO [generalSeq=" + generalSeq + ", email=" + email + ", name=" + name + ", kindOf=" + kindOf
				+ ", pw=" + pw + ", tel=" + tel + "]";
	}

	
}
