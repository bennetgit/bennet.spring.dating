package com.mvc.rest.business.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.rest.business.domain.Album;

public interface IUploaderService {
	public Map savePhoto(HttpServletRequest req, HttpServletResponse resp, int user_id, int album);
	public Map savePhoto(HttpServletRequest req, HttpServletResponse resp, int user_id, Album album);
	public int createAlbum(Album album);
}
