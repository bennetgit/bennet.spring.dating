package com.mvc.rest.business.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.rest.business.domain.Photo;
import com.mvc.rest.business.domain.User;
import com.mvc.rest.business.persistence.PhotoMapper;
import com.mvc.rest.business.service.IUploaderService;
import com.mvc.rest.business.web.UploadController;

import com.mvc.rest.beans.WebConfig;
import com.mvc.uitls.MultipartUploadParser;
import com.mvc.uitls.RequestParser;
import com.mvc.uitls.SpringContextUtil;

@Service
public class UploaderServiceImpl implements IUploaderService {
	
	private Logger logger = Logger.getLogger(UploadController.class.getName());
	
	static WebConfig webConfig = (WebConfig) SpringContextUtil.getBean("webConfig");

	private static String CONTENT_TYPE = "text/plain";
    private static String CONTENT_LENGTH = "Content-Length";
    private static String ENCODING = "utf-8";
    private static int RESPONSE_CODE = 200;
    private static int MAXSIZE = 1024 * 50; // 50kb
    
    public File UPLOAD_DIR;
    public File TEMP_DIR;
	
	@Autowired
	private PhotoMapper photoMapper;

	@Override
	public Map savePhoto(HttpServletRequest req, HttpServletResponse resp,
			int userid, int album) {
		// TODO Auto-generated method stub
		Map<String, Object> ret = new HashMap<String, Object>();
		//Calendar calendar = Calendar.getInstance();
		
		Photo photo = new Photo();
		photo.setAlbum(album);
		//photo.setCreated(calendar.getTime());
		photo.setDescription("test photo descr");
		photo.setName("test photo name");
		photo.setOrder(1);
		photo.setTags("test tags");
		
		int success = photoMapper.insertPhoto(photo);
		if (success < 1) {
			ret.put("error", "DB error!");
			return ret;
		}
		
		String photoId = String.valueOf(photo.getId());
	
	    List<String> fileTypes = new ArrayList();
	    fileTypes.add("jpg");
	    fileTypes.add("jpeg");
	    fileTypes.add("bmp");
	    fileTypes.add("gif");
	    fileTypes.add("png");
		
		String user_id = String.valueOf(userid);

		String patch = (String) webConfig.getParams().get("imageUploadPath") + "/"
				+ user_id.substring(user_id.length() - 1) + "/"
				+ user_id.substring(user_id.length() - 3) + "/"
				+ user_id;
		File UPLOAD_DIR = new File(patch);
		TEMP_DIR = new File("uploadsTemp");

        try
        {
    		req.setCharacterEncoding(ENCODING);
            String contentLengthHeader = req.getHeader(CONTENT_LENGTH);
            Long expectedFileSize = StringUtils.isBlank(contentLengthHeader) ? null : Long.parseLong(contentLengthHeader);
    		if (expectedFileSize > MAXSIZE) {
    			ret.put("error", "The size is more than 50kb!");
    			return ret;
    		}
            logger.info("--------- expectedFileSize " + expectedFileSize + "--------------");
            
            RequestParser requestParser;
            resp.setContentType(CONTENT_TYPE);
            resp.setStatus(RESPONSE_CODE);
            resp.setCharacterEncoding(ENCODING);
            
            if (!UPLOAD_DIR.exists()) {
            	logger.info("--------- create dirs --------------");
            	UPLOAD_DIR.mkdirs();
            }

            if (ServletFileUpload.isMultipartContent(req))
            {
                requestParser = RequestParser.getInstance(req, new MultipartUploadParser(req, TEMP_DIR, req.getServletContext()));
                String fileName = requestParser.getFilename();
                logger.info("--------- file name:" + fileName + " --------------");
                String ext = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());  
                ext = ext.toLowerCase();
                if (!fileTypes.contains(ext)) {
                	ret.put("error", "File type is not correct!");
                	return ret;
                }
                doWriteTempFileForPostRequest(requestParser, photoId);
                ret.put("success", true);
            }
            else
            {
                requestParser = RequestParser.getInstance(req, null);
                String fileName = requestParser.getFilename();
                logger.info("--------- file name:" + fileName + " --------------");
                String ext = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());  
                ext = ext.toLowerCase();
                if (!fileTypes.contains(ext)) {
                	ret.put("error", "File type is not correct!");
                	return ret;
                }
                writeToTempFile(req.getInputStream(), new File(UPLOAD_DIR, photoId + ".jpg"), expectedFileSize);
                ret.put("success", true);
            }
        } catch (Exception e)
        {
        	logger.error("Problem handling upload request", e);
            ret.put("error", "Problem handling upload request");
        }
        
		return ret;
	}
		
    private void doWriteTempFileForPostRequest(RequestParser requestParser, String photoId) throws Exception
    {
        writeToTempFile(requestParser.getUploadItem().getInputStream(), new File(UPLOAD_DIR, photoId + ".jpg"), null);
    }

    private File writeToTempFile(InputStream in, File out, Long expectedFileSize) throws IOException
    {
        FileOutputStream fos = null;

        try
        {
            fos = new FileOutputStream(out);

            IOUtils.copy(in, fos);

            if (expectedFileSize != null)
            {
                Long bytesWrittenToDisk = out.length();
                if (!expectedFileSize.equals(bytesWrittenToDisk))
                {
                	logger.warn(String.format("Expected file %s to be %s bytes; file on disk is %s bytes", out.getAbsolutePath(), expectedFileSize, 1));
                    throw new IOException(String.format("Unexpected file size mismatch. Actual bytes %s. Expected bytes %s.", bytesWrittenToDisk, expectedFileSize));
                }
            }

            return out;
        }
        catch (Exception e)
        {
            throw new IOException(e);
        }
        finally
        {
            IOUtils.closeQuietly(fos);
        }
    }
}
