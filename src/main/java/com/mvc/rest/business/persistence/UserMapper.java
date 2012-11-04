package com.mvc.rest.business.persistence;

import java.util.List;

import com.mvc.rest.beans.UserLoginForm;
import com.mvc.rest.business.domain.User;

public interface UserMapper {
	public User selectUserByName(String name);
	public User selectUserById(int id);
	public int insertUser(User u);
	public int updateUser(User u);
	public int deleteUser(int id);
	public List<User> selectUsers();
	public User selectUserByNameOrEmail(UserLoginForm f);
}
