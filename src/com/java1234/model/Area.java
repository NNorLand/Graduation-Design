package com.java1234.model;

public class Area {
	private int areaId;
	private String areaName;
	
	public Area() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Area(int areaId, String areaName) {
		super();
		this.areaId = areaId;
		this.areaName = areaName;
	}
	public int getAreaId() {
		return areaId;
	}
	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

}
