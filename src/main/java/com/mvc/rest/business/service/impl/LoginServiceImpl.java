package com.mvc.rest.business.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.rest.beans.UserLoginForm;
import com.mvc.rest.business.domain.User;
import com.mvc.rest.business.persistence.UserMapper;
import com.mvc.rest.business.service.ILoginService;

@Service
public class LoginServiceImpl implements ILoginService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int Login(UserLoginForm f) {
		// TODO Auto-generated method stub
		User user = userMapper.selectUserByNameOrEmail(f);
		if (user != null) {
			if (user.getPassword().equals(f.getPassword())) {
				return user.getId();
			} else {
				return -1;
			}
		} else {
			return 0;
		}
	}

	@Override
	public boolean Logout(UserLoginForm f) {
		// TODO Auto-generated method stub
		return false;
	}

}
