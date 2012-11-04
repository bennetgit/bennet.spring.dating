package com.mvc.rest.business.persistence;

import java.util.List;

import com.mvc.rest.business.domain.Country;

public interface CountryMapper {
	public Country selectCountryByName(String cou_name);
	public Country selectCountryById(int cou_id);
	public List<Country> selectCountries();
}
