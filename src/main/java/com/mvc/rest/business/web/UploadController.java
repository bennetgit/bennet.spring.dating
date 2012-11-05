package com.mvc.rest.business.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.rest.beans.WebConfig;
import com.mvc.uitls.MultipartUploadParser;
import com.mvc.uitls.RequestParser;
import com.mvc.uitls.SpringContextUtil;

@Controller
public class UploadController {
	private Logger logger = Logger.getLogger(UploadController.class.getName());

	static WebConfig webConfig = (WebConfig) SpringContextUtil.getBean("webConfig");
    private static File UPLOAD_DIR = new File((String) webConfig.getParams().get("imageUploadPath"));
    private static File TEMP_DIR = new File("uploadsTemp");

    private static String CONTENT_TYPE = "text/plain";
    private static String CONTENT_LENGTH = "Content-Length";
    private static String ENCODING = "utf-8";
    private static int RESPONSE_CODE = 200;
	
	@ResponseBody  
	@RequestMapping("/upload")
	public Object upload(HttpServletRequest req, HttpServletResponse resp) {
		
		Map<String, Object> ret = new HashMap<String, Object>();
        
        try
        {
    		req.setCharacterEncoding(ENCODING);
            String contentLengthHeader = req.getHeader(CONTENT_LENGTH);
            Long expectedFileSize = StringUtils.isBlank(contentLengthHeader) ? null : Long.parseLong(contentLengthHeader);
    		
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
                doWriteTempFileForPostRequest(requestParser);
                ret.put("success", true);
            }
            else
            {
                requestParser = RequestParser.getInstance(req, null);
                writeToTempFile(req.getInputStream(), new File(UPLOAD_DIR, requestParser.getFilename()), expectedFileSize);
                ret.put("success", true);
            }
        } catch (Exception e)
        {
        	logger.error("Problem handling upload request", e);
            ret.put("error", "test error");
        }
        
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
