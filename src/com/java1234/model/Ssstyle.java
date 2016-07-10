package com.java1234.model;

public class Ssstyle {
	private int styleId;
	private String styleName;
	
	public Ssstyle() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Ssstyle(int styleId, String styleName) {
		super();
		this.styleId = styleId;
		this.styleName = styleName;
	}
	
	public int getStyleId() {
		return styleId;
	}
	public void setStyleId(int styleId) {
		this.styleId = styleId;
	}
	public String getStyleName() {
		return styleName;
	}
	public void setStyleName(String styleName) {
		this.styleName = styleName;
	}

}
