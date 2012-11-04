package com.mvc.rest.beans;

import java.util.LinkedHashMap;
import java.util.Map;

public class Ethnicity {
	private Map<Integer, String> items = new LinkedHashMap<Integer, String>();

	public Map<Integer, String> getItems() {
		return items;
	}

	public void setItems(Map<Integer, String> items) {
		this.items = items;
	}

	
}
