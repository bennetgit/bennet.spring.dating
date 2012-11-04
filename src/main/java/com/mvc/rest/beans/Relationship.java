package com.mvc.rest.beans;

import java.util.LinkedHashMap;
import java.util.Map;

public class Relationship {
	private Map<Integer, String> items = new LinkedHashMap<Integer, String>();

	public Map<Integer, String> getItems() {
		return items;
	}

	public void setItems(Map<Integer, String> items) {
		for (Map.Entry<Integer, String> entry : items.entrySet()) {
			//System.out.print(entry.getKey() + ":" + entry.getValue() + "\t");
			this.items.put((int) Math.pow(2,entry.getKey()), entry.getValue());
		}
		//this.items = items;
	}
}
