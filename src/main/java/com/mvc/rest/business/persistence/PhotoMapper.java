package com.mvc.rest.business.persistence;

import java.util.List;

import com.mvc.rest.business.domain.Photo;

public interface PhotoMapper {
	public Photo selectPhotosById(int id);
	public List<Photo> selectPhotosByAlbumId(int album);
	public int insertPhoto(Photo photo);
	public int updatePhoto(Photo photo);
	public int deletePhoto(int id);
}
