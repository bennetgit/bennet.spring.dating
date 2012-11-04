package com.mvc.rest.business.service;

import com.mvc.rest.beans.UserLoginForm;

public interface ILoginService {
	public int Login(UserLoginForm f);
	public boolean Logout(UserLoginForm f);
}
