package com.java1234.model;

public class Ss {

	private int ssId;
	private String ssName;
	private int nodeId=-1;
	private String tnodeName;
	private int styleId;
	private String styleName;

	public Ss() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Ss(String ssName, int nodeId,
			int styleId) {
		super();
		this.ssName = ssName;
		this.nodeId = nodeId;
		this.styleId = styleId;
	}

	public int getSsId() {
		return ssId;
	}

	public void setSsId(int ssId) {
		this.ssId = ssId;
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

	public int getStyleId() {
		return styleId;
	}

	public void setStyleId(int styleId) {
		this.styleId = styleId;
	}

	public String getSsName() {
		return ssName;
	}

	public void setSsName(String ssName) {
		this.ssName = ssName;
	}

	public String getStyleName() {
		return styleName;
	}

	public void setStyleName(String styleName) {
		this.styleName = styleName;
	}

}
