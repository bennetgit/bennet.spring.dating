package com.mvc.rest.business.domain;

public class State {
	private int stt_id;
	private int stt_cou_id;
	private String stt_name;
	private String stt_abbr;
	private int parent_stt_id;
	
	public int getStt_id() {
		return stt_id;
	}
	public void setStt_id(int stt_id) {
		this.stt_id = stt_id;
	}
	public int getStt_cou_id() {
		return stt_cou_id;
	}
	public void setStt_cou_id(int stt_cou_id) {
		this.stt_cou_id = stt_cou_id;
	}
	public String getStt_name() {
		return stt_name;
	}
	public void setStt_name(String stt_name) {
		this.stt_name = stt_name;
	}
	public String getStt_abbr() {
		return stt_abbr;
	}
	public void setStt_abbr(String stt_abbr) {
		this.stt_abbr = stt_abbr;
	}
	public int getParent_stt_id() {
		return parent_stt_id;
	}
	public void setParent_stt_id(int parent_stt_id) {
		this.parent_stt_id = parent_stt_id;
	}
}
