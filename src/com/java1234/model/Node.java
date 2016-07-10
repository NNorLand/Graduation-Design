package com.java1234.model;

public class Node {

	private int nodeId;
	private String tnodeName;
	private int areaId=-1;
	private String areaName;
	private float x;
	private float y;
	private String description;

	public Node() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Node(String tnodeName, String nodeDescription) {
		super();
		this.tnodeName = tnodeName;
		this.description = nodeDescription;
	}
	public Node(String tnodeName, int areaid, int x, int y,String nodeDescription) {
		super();
		this.tnodeName = tnodeName;
		this.description = nodeDescription;
		this.areaId=areaid;
		this.x=x;
		this.y=y;
	}

	public int getNodeId() {
		return nodeId;
	}
	public void setNodeId(int nodeId) {
		this.nodeId = nodeId;
	}
	public String getNodeName() {
		return tnodeName;
	}
	public void setNodeName(String tnodeName) {
		this.tnodeName = tnodeName;
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
	public float getX() {
		return x;
	}
	public void setX(float x) {
		this.x = x;
	}
	public float getY() {
		return y;
	}
	public void setY(float y) {
		this.y = y;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
