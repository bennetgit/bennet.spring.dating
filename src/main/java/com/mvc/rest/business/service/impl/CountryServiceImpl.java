package com.mvc.rest.business.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.rest.business.domain.Country;
import com.mvc.rest.business.persistence.CountryMapper;
import com.mvc.rest.business.service.ICountryService;

@Service
public class CountryServiceImpl implements ICountryService {
	
	@Autowired
	private CountryMapper countryMapper;

	@Override
	public Country getCountry(String cou_name) {
		// TODO Auto-generated method stub
		Country c = countryMapper.selectCountryByName(cou_name);
		return c;
	}

	@Override
	public Country getCountry(int cou_id) {
		// TODO Auto-generated method stub
		Country c = countryMapper.selectCountryById(cou_id);
		return c;
	}

	@Override
	public List<Country> getCountries() {
		// TODO Auto-generated method stub
		List<Country> list = (List<Country>) countryMapper.selectCountries();
		return list;
	}

}
