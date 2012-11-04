package com.mvc.rest.business.domain;

public class Country {
	private int cou_id;
	private String cou_name;
	private String cc2;    
	private String cc3;
	private int ccn;           
	private String is_developed;           
	private String is_undesirable;
	private String cou_currency;
	private int not_important_for_searches;
	
	public int getCou_id() {
		return cou_id;
	}
	public void setCou_id(int cou_id) {
		this.cou_id = cou_id;
	}
	public String getCou_name() {
		return cou_name;
	}
	public void setCou_name(String cou_name) {
		this.cou_name = cou_name;
	}
	public String getCc2() {
		return cc2;
	}
	public void setCc2(String cc2) {
		this.cc2 = cc2;
	}
	public String getCc3() {
		return cc3;
	}
	public void setCc3(String cc3) {
		this.cc3 = cc3;
	}
	public int getCcn() {
		return ccn;
	}
	public void setCcn(int ccn) {
		this.ccn = ccn;
	}
	public String getIs_developed() {
		return is_developed;
	}
	public void setIs_developed(String is_developed) {
		this.is_developed = is_developed;
	}
	public String getIs_undesirable() {
		return is_undesirable;
	}
	public void setIs_undesirable(String is_undesirable) {
		this.is_undesirable = is_undesirable;
	}
	public String getCou_currency() {
		return cou_currency;
	}
	public void setCou_currency(String cou_currency) {
		this.cou_currency = cou_currency;
	}
	public int getNot_important_for_searches() {
		return not_important_for_searches;
	}
	public void setNot_important_for_searches(int not_important_for_searches) {
		this.not_important_for_searches = not_important_for_searches;
	}
	
}
