package com.mvc.rest.business.persistence;

import java.util.List;

import com.mvc.rest.business.domain.Album;

public interface AlbumMapper {
	public Album selectAlbumById(int id);
	public List<Album> selectAlbumsByUserId(int user_id);
	public int insertAlbum(Album album);
	public int updateAlbum(Album album);
	public int deleteAlbum(int id);
}
