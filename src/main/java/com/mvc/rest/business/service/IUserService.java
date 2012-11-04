package com.mvc.rest.business.service;

import java.util.List;

import com.mvc.rest.beans.UserRegistForm;
import com.mvc.rest.business.domain.User;

public interface IUserService {
	public User getUser(String name);
	
	public User getUser(int id);
	
	public List<User> getUsers();
	
	public boolean saveUser(User u);
	
	public boolean saveUser(UserRegistForm f);
	
	public boolean updateUser(User u);
	
	public boolean deleteUser(List<Integer> listIds);
}
