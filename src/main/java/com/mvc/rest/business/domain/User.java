package com.mvc.rest.business.domain;

import java.util.Date;

public class User {
	private int id;
	private String username;
	private String password;
	private String fname;
	private String lname;
	private String email;
	private int gender;
	private int match_gender;
	private Date create_date;
	private int relationship_seek;
	private int ethnicity;
	private String about;
	private Date birthday;
	private int country_id;
    private int state_id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	public String getPassWord() {
		return password;
	}
	public void setPassWord(String passWord) {
		this.password = passWord;
	}
	 **/
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getMatch_gender() {
		return match_gender;
	}
	public void setMatch_gender(int match_gender) {
		this.match_gender = match_gender;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public int getRelationship_seek() {
		return relationship_seek;
	}
	public void setRelationship_seek(int relationship_seek) {
		this.relationship_seek = relationship_seek;
	}
	public int getEthnicity() {
		return ethnicity;
	}
	public void setEthnicity(int ethnicity) {
		this.ethnicity = ethnicity;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public int getCountry_id() {
		return country_id;
	}
	public void setCountry_id(int country_id) {
		this.country_id = country_id;
	}
	public int getState_id() {
		return state_id;
	}
	public void setState_id(int state_id) {
		this.state_id = state_id;
	}
}
