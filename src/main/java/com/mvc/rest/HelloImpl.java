package com.mvc.rest;


public class HelloImpl implements HelloApi {

	private String message;

    public void setMessage(String message) {  
        this.message = message;  
    }  

	@Override
	public String getHello() {
		// TODO Auto-generated method stub
		//System.out.println("Hello World!");  
		return message;
	}

}
