package com.mvc.rest.business.service;

import java.util.List;

import com.mvc.rest.business.domain.Album;

public interface IAlbumService {
	public boolean createAlbum(Album album);
	public boolean updateAlbum(Album album);
	public boolean deleteAlbum(int id);
	public Album getAlbumByCategory(int user_id, int category);
	public List<Album> getAlbumsByUserId(int user_id);
}
