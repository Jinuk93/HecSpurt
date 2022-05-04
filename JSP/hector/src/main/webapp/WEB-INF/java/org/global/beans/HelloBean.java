package org.global.beans;

public class HelloBean {

	private String name;
	private String number;
	
	public HelloBean() {
		this.name="노네임";
		this.number="노넘버";
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}	
}
