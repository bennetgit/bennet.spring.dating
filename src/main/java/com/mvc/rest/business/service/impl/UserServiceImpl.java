package com.mvc.rest.business.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.rest.beans.UserRegistForm;
import com.mvc.rest.business.domain.User;
import com.mvc.rest.business.persistence.UserMapper;
import com.mvc.rest.business.service.IUserService;

import org.apache.log4j.Logger;

@Service
public class UserServiceImpl implements IUserService {
	
	private Logger logger = Logger.getLogger(UserServiceImpl.class.getName());
	
	@Autowired
	private UserMapper userMapper;

	private List<User> list;
	
	@Override
	public User getUser(String name) {
		// TODO Auto-generated method stub
		User user = userMapper.selectUserByName(name);
		return user;
	}
	
	@Override
	public User getUser(int id) {
		// TODO Auto-generated method stub
		User user = userMapper.selectUserById(id);
		return user;
	}

	@Override
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		List<User> list = (List<User>) userMapper.selectUsers();
		return list;
	}
	
	@Override
	public boolean saveUser(User u) {
		// TODO Auto-generated method stub
		int success = 0;
		try
        {
			success = userMapper.insertUser(u);
        }
		catch(RuntimeException e)
		{
			throw e;
		}

		return success > 0;
	}

	@Override
	public boolean saveUser(UserRegistForm f) {
		// TODO Auto-generated method stub
		User u = new User();
		
		u.setUsername(f.getUsername());
		u.setPassword(f.getPassword());
		u.setFname(f.getFname());
		u.setLname(f.getLname());		
		u.setEmail(f.getEmail());
		u.setGender(f.getGender());
		u.setMatch_gender(f.getMatch_gender());
		u.setCreate_date(new Date());
		
		int i = 0;
		for(int item : f.getRelationship_seek()) {
			i += item;
		}		
		u.setRelationship_seek(i);
		
		u.setEthnicity(f.getEthnicity());
		u.setAbout(f.getAbout());
		
		Calendar calendar = Calendar.getInstance();
		calendar.set(f.getBirthdate_year(), f.getBirthdate_month()-1, f.getBirthdate_day());
		
		//logger.info("Birthday: " + calendar.getTime().toString());
		
		u.setBirthday(calendar.getTime());
		u.setCountry_id(f.getCountry_id());
		u.setState_id(f.getState_id());
		
		int success = 0;
		try
        {
			success = userMapper.insertUser(u);
        }
		catch(RuntimeException e)
		{
			throw e;
		}
		//int success = userMapper.insertUser(u);
		return success > 0;
		
		//return true;
	}
	
	@Override
	public boolean updateUser(User u) {
		// TODO Auto-generated method stub
		int success = 0;
		try
        {
			success = userMapper.updateUser(u);
        }
		catch(RuntimeException e)
		{
			throw e;
		}
		//int success = userMapper.updateUser(u);
		return success > 0;
	}

	@Override
	public boolean deleteUser(List<Integer> listIds) {
		int success = 0;
		try
        {
			for(int i =0; i < listIds.size(); i++){
				success += userMapper.deleteUser(listIds.get(i));
			}
        }
		catch(RuntimeException e)
		{
			throw e;
		}
		return success > 0;
	}

}
