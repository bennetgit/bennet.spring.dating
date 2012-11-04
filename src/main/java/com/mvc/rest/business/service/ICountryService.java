package com.mvc.rest.business.service;

import java.util.List;

import com.mvc.rest.business.domain.Country;


public interface ICountryService {
	public Country getCountry(String cou_name);	
	public Country getCountry(int cou_id);	
	public List<Country> getCountries();
}
