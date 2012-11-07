package com.mvc.rest.business.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.rest.beans.WebConfig;
import com.mvc.rest.business.domain.User;
import com.mvc.rest.business.service.IUploaderService;
import com.mvc.uitls.MultipartUploadParser;
import com.mvc.uitls.RequestParser;
import com.mvc.uitls.SpringContextUtil;

@Controller
public class UploadController {
	private Logger logger = Logger.getLogger(UploadController.class.getName());

	static WebConfig webConfig = (WebConfig) SpringContextUtil.getBean("webConfig");

	private static String CONTENT_TYPE = "text/plain";
    private static String CONTENT_LENGTH = "Content-Length";
    private static String ENCODING = "utf-8";
    private static int RESPONSE_CODE = 200;
    private static int MAXSIZE = 1024 * 50; // 5kb
    
    public File UPLOAD_DIR;
    public File TEMP_DIR;
    
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
		
        ret = uploaderService.savePhoto(req, resp, user.getId(), 3);
		//ret.put("success", true);
		//ret.put("error", "test error");
		return ret;
	}
	
    private void doWriteTempFileForPostRequest(RequestParser requestParser) throws Exception
    {
        writeToTempFile(requestParser.getUploadItem().getInputStream(), new File(UPLOAD_DIR, requestParser.getFilename()), null);
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
