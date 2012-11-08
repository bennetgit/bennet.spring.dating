package com.mvc.rest.business.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.exception.FileException;
import com.mvc.rest.business.domain.User;
import com.mvc.rest.business.service.IUploaderService;


@Controller
public class UploadController {
	private Logger logger = Logger.getLogger(UploadController.class.getName());

    @Autowired
    private IUploaderService uploaderService;
	
	@ResponseBody  
	@RequestMapping("/upload")
	public Object upload(HttpServletRequest req, HttpServletResponse resp) {
		
		Map<String, Object> ret = new HashMap<String, Object>();
		
		User user = (User)req.getSession().getAttribute("loginUserInfo");
		if (user == null) {
			ret.put("error", "Please logging first!");
			return ret;
		}
		try {
			ret = uploaderService.savePhoto(req, resp, user.getId(), 1);
		} catch (RuntimeException e) {
			ret.put("error", e.getMessage());
		}
        //ret = uploaderService.savePhoto(req, resp, user.getId(), 1);
		//ret.put("success", true);
		//ret.put("error", "test error");
		return ret;
	}

}
