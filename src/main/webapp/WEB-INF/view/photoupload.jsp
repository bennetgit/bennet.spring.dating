<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${initParam.staticPath }/css/color.css" type="text/css">
<!-- 
<link href="${initParam.staticPath }/fileuploader/fileuploader.css" rel="stylesheet" type="text/css">
 -->
<script src="${initParam.staticPath }/fileuploader/fileuploader.js" type="text/javascript"></script>
<script>        
function createUploader(){            
    var uploader = new qq.FileUploader({
    	debug: true,
        element: document.getElementById('file-uploader'),
        action: 'upload',
        uploadButtonText: '<span>Upload your photo now</span>',
        template: '<div class="qq-uploader">' + '<div class="qq-upload-button upload button orange">{uploadButtonText}</div>' + '<ul class="qq-upload-list"></ul>' + '</div>',
        extraDropzones: [qq.getByClass(document, 'qq-upload-extra-drop-area')[0]],
        hideDropzones: false,
        disableDefaultDropzone: true
    });           
}

// in your app create uploader as soon as the DOM is ready
// don't wait for the window to load  
window.onload = createUploader;     
</script>
</head>
<body>
	<div class="grid-16 would-you-ctn">
		<div class="would-you">
			<div class="polaroid her qq-upload-extra-drop-area"></div>
			<div class="details">
				<h1>
					<span>Would you contact this person?</span>
				</h1>
				<p>No? Well this is how you currently appear in search results.
					Upload your photo and get 10x more views from possible matches.</p>
				<div id="file-uploader">		
					<noscript>			
						<p>Please enable JavaScript to use file uploader.</p>
						<!-- or put a simple form for upload here -->
					</noscript>         
				</div>
				<p class="terms">All photos are moderated and checked before
					they are published on the site. Please do not post pornographic,
					offensive or stuff that we won't be able to approve.</p>
				<a class="skip" href="http://www.interracialdating.com/">skip
					this</a> <a class="button large button green continue"
					href="http://www.interracialdating.com/"><span>Continue</span></a>
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
		<div class="footer"></div>
	</div>	
</body>
</html>