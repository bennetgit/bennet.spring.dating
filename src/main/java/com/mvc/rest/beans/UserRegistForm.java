package com.mvc.rest.beans;

import java.util.List;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class UserRegistForm implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    @NotNull(message = "用户名不能为空！")  
    @Size(min=6, max = 20, message = "用户名不能为空！")  
	private String username;
	
    @NotNull  
    @Size(min = 6, max = 20, message = "密码长度必须在6-20之间！") 
	private String password;
	
    @NotNull  
    @Size(min = 3, max = 10, message = "fname长度必须在3-10之间！") 
	private String fname;
	
    @NotNull  
    @Size(min = 3, max = 10, message = "lname长度必须在3-10之间！")  
	private String lname;
	
    @NotEmpty 
    @Email
	private String email;
	
    @NotNull
    @Digits(fraction = 0, integer = 2)
	private int gender;
    
    @NotNull
    @Digits(fraction = 0, integer = 2)
	private int match_gender;
    
    @NotNull
    @Size(min = 1, message = "relationship 必须最少选择一项！")
	private List<Integer> relationship_seek;
    
    @NotNull
    @Digits(fraction = 0, integer = 2)
	private int ethnicity;
	
    @NotNull  
    @Size(min = 10, max = 2000, message = "about 长度必须在10-2000之间！") 
	private String about;
    
    @NotNull
    @Min(1)
    @Max(31)
    private int birthdate_day;
    @NotNull
    @Min(1)
    @Max(12)
    private int birthdate_month;
    @NotNull
    @Min(1900)
    @Max(1995)
    private int birthdate_year;
    
    @NotNull
    private int country_id;
    @NotNull
    private int state_id;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
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
	public List<Integer> getRelationship_seek() {
		return relationship_seek;
	}
	public void setRelationship_seek(List<Integer> relationship_seek) {
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
	public int getBirthdate_day() {
		return birthdate_day;
	}
	public void setBirthdate_day(int birthdate_day) {
		this.birthdate_day = birthdate_day;
	}
	public int getBirthdate_month() {
		return birthdate_month;
	}
	public void setBirthdate_month(int birthdate_month) {
		this.birthdate_month = birthdate_month;
	}
	public int getBirthdate_year() {
		return birthdate_year;
	}
	public void setBirthdate_year(int birthdate_year) {
		this.birthdate_year = birthdate_year;
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
