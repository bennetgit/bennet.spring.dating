package com.mvc.rest.business.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.rest.business.domain.Album;
import com.mvc.rest.business.persistence.AlbumMapper;
import com.mvc.rest.business.service.IAlbumService;

@Service
public class AlbumServiceImpl implements IAlbumService {
	
	private Logger logger = Logger.getLogger(AlbumServiceImpl.class.getName());

	@Autowired
	AlbumMapper albumMapper;
	
	@Override
	public boolean createAlbum(Album album) {
		// TODO Auto-generated method stub
		int success = 0;
		try
        {
			success = albumMapper.insertAlbum(album);
        }
		catch(RuntimeException e)
		{
			throw e;
		}
		return success > 0;
	}

	@Override
	public boolean updateAlbum(Album album) {
		// TODO Auto-generated method stub
		int success = 0;
		try
        {
			success = albumMapper.updateAlbum(album);
        }
		catch(RuntimeException e)
		{
			throw e;
		}
		return success > 0;
	}

	@Override
	public boolean deleteAlbum(int id) {
		// TODO Auto-generated method stub
		int success = 0;
		try
        {
			success = albumMapper.deleteAlbum(id);
        }
		catch(RuntimeException e)
		{
			throw e;
		}
		return success > 0;
	}

	@Override
	public Album getAlbumByCategory(int user_id, int category) {
		// TODO Auto-generated method stub
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("user_id", user_id);
		params.put("category", category);
		Album album = albumMapper.selectAlbumByCategory(params);
		return album;
	}

	@Override
	public List<Album> getAlbumsByUserId(int user_id) {
		// TODO Auto-generated method stub
		List<Album> list = albumMapper.selectAlbumsByUserId(user_id);
		return list;
	}

}
