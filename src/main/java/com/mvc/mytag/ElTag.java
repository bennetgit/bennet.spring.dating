package com.mvc.mytag;

public class ElTag {
    public static String reverse(String name){  
        return new StringBuffer(name).reverse().toString();  
    }  
      
    public static int countChar(String text){  
        return text.trim().length();  
    } 
    
    public static Integer bitAnd(Integer arg1, Integer arg2) {
    	return arg1 & arg2;
    }
}
