<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; 
String cur_path = request.getContextPath() + request.getServletPath();
request.setAttribute("path",path);
request.setAttribute("basePath",basePath);
request.setAttribute("cur_path",cur_path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>INTERRACIAL DATING - interracial dating site</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description"
	content="INTERRACIAL DATING - Our website provides interracial dating services for Black and White, Asian and Latino singles open to interracial relationships. Click here for extensive Success Stories and unique Guarantee.">
<meta name="keywords"
	content="interracial dating services, black and white dating, interracial dating, black white dating, black women white men dating, black men white women dating, black women white men, black men white women, black and white dating">
<link rel="stylesheet" href="${initParam.staticPath }/css/reset.css"
	type="text/css">
<link rel="stylesheet"
	href="${initParam.staticPath }/css/style_visitor.css" type="text/css">
<link rel="stylesheet"
	href="${initParam.staticPath }/css/color_visitor.css" type="text/css">
<link rel="stylesheet" href="${initParam.staticPath }/css/widget095.css"
	type="text/css">
<script type="text/javascript"
	src="${initParam.staticPath }/js/jquery-1.8.0.min.js"></script>

</head>
<body class="visitor-1 black-man-white-woman">

	<div id="content" class="wrapper">
		<div class="ctn-16">
			<div id="main" class="grid-16">
				<div id="header-links">
					<div class="share-icons">
						<!-- AddThis Button BEGIN -->

						<!-- AddThis Button END -->
					</div>
					<div id="login">
						<ul>
							<li class="first"><a href="${ctx }/register">Create
									account</a></li>
							<li class="last"><a href="${ctx }/login">Sign in</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div id="logo">
					<a href="${ctx }"><span>Where love is more than skin
							deep...</span></a>
				</div>
				<form id="search" name="searchForm" method="post"
					action="${basePath }/search">
					<div class="row dotted">
						<label class="large" for="ethnicity">I am looking for a</label> <select
							name="vs-ethnicity" id="ethnicity">
							<option selected="selected" value="black">Black</option>
							<option value="white">White</option>
							<option value="latino">Latino</option>
							<option value="asian">Asian</option>
							<option value="">Any</option>
						</select> <select name="vs-gender" id="gender">
							<option selected="selected" value="woman">Woman</option>
							<option value="man">Man</option>
						</select>
					</div>
					<div class="row">
						<label class="large" for="age">Aged</label> <select name="vs-age"
							id="age">
							<option selected="selected" value="18-25">18-25</option>
							<option value="26-40">26-40</option>
							<option value="41-55">41-55</option>
							<option value="56+">56+</option>
						</select>
					</div>
					<div class="row">

						<input name="visitor-search-submit" value="1" type="hidden">
						<div class="button xxlarge orange"
							onclick="document.searchForm.submit();">Search Now FREE</div>
					</div>
				</form>
			</div>
			<div class="ctn-16">
				<div class="grid-16 full-width" id="cta-block">
					<div class="cta-panel" id="success-stories-2">
						<div class="details">
							<h2>Success stories</h2>
							<p>
								Here's a few of the couples we've helped recently. <br> <strong>Will
									you be next?</strong> <br> <a href="${basePath }/register">Join
									for free</a>
							</p>
						</div>
						<div class="success">
							<div class="story s-1 rotate-2">
								<a href="${ctx }/register" class="link"></a>
								<div class="photo-ctn">
									<img
										src="${initParam.staticPath }/images/tn_977_1334404888.jpg"
										class="" alt="Sandy &amp; Ronnie" title="Sandy &amp; Ronnie"
										height="100" width="100">
								</div>
								<div class="name">Sandy &amp; Ronnie</div>
							</div>
							<div class="story s-2 rotate-3">
								<a href="${ctx }/register" class="link"></a>
								<div class="photo-ctn">
									<img
										src="${initParam.staticPath }/images/tn_611_1321342060.jpg"
										class="" alt="Jillian &amp; Lamont"
										title="Jillian &amp; Lamont" height="100" width="100">
								</div>
								<div class="name">Jillian &amp; Lamont</div>
							</div>
							<div class="story s-3 rotate-1">
								<a href="${ctx }/register" class="link"></a>
								<div class="photo-ctn">
									<img src="${initParam.staticPath }/images/tn_50_1315387113.jpg"
										class="" alt="Electra &amp; Hal" title="Electra &amp; Hal"
										height="100" width="100">
								</div>
								<div class="name">Electra &amp; Hal</div>
							</div>
							<div class="story s-4 rotate-2">
								<a href="${ctx }/register" class="link"></a>
								<div class="photo-ctn">
									<img src="${initParam.staticPath }/images/tn_22_1315369472.jpg"
										class="" alt="Kim &amp; Neapah" title="Kim &amp; Neapah"
										height="100" width="100">
								</div>
								<div class="name">Kim &amp; Neapah</div>
							</div>
							<div class="story s-5 rotate-3">
								<a href="${ctx }/register" class="link"></a>
								<div class="photo-ctn">
									<img src="${initParam.staticPath }/images/tn_97_1316932133.jpg"
										class="" alt="Corey &amp; Gigi" title="Corey &amp; Gigi"
										height="100" width="100">
								</div>
								<div class="name">Corey &amp; Gigi</div>
							</div>
							<div class="story s-6 rotate-1">
								<a href="${ctx }/register" class="link"></a>
								<div class="photo-ctn">
									<img
										src="${initParam.staticPath }/images/tn_914_1329717507.jpg"
										class="" alt="Raniel &amp; Michael"
										title="Raniel &amp; Michael" height="100" width="100">
								</div>
								<div class="name">Raniel &amp; Michael</div>
							</div>
							<div class="story s-7 rotate-2">
								<a href="${ctx }/register" class="link"></a>
								<div class="photo-ctn">
									<img
										src="${initParam.staticPath }/images/tn_222_1319436924.jpg"
										class="" alt="Tiffane &amp; Kai" title="Tiffane &amp; Kai"
										height="100" width="100">
								</div>
								<div class="name">Tiffane &amp; Kai</div>
							</div>
							<div class="story s-8 rotate-3">
								<a href="${basePath }/register" class="link"></a>
								<div class="photo-ctn">
									<img src="${initParam.staticPath }/images/tn_9_1315370465.jpg"
										class="" alt="Napoleon &amp; Kasia"
										title="Napoleon &amp; Kasia" height="100" width="100">
								</div>
								<div class="name">Napoleon &amp; Kasia</div>
							</div>

							<div class="clear"></div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="ctn-16">
				<div class="grid-16" id="details">
					<div class="truncate-more"></div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- footer BEGIN -->
	<div class="wrapper" id="footer-ctn">
		<div class="ctn-16">
			<div class="grid-16" id="footer">
				<ul class="footer-nav">
					<li><a href="${ctx }/interracial-couples">Success Stories</a></li>


					<li><a href="${ctx }/online-dating-safety">Online Safety</a></li>
					<li><a href="${ctx }/terms">Terms</a></li>
					<li><a href="${ctx }/privacy-policy">Privacy Policy</a></li>
					<li class="last"><a href="${ctx }/contact">Contact</a></li>
				</ul>
				<div class="clear"></div>
				<p class="copyright">
					Copyright © 2003-2012 InterracialDating.com, Chellaul Corporation,
					All Rights Reserved. <br> InterracialDating.com does not
					conduct background checks on the members or subscribers of this
					website<a title="102:80  M2.35 T0.09 gz">.</a>
				</p>
				<div id="powered-by" title="Powered by Interracial Dating">
					<span>Powered by Interracial Dating</span>
				</div>
				<!-- AddThis Button BEGIN -->
				<div id="social-share"
					class="addthis_toolbox addthis_default_style addthis_32x32_style">
					<a href="#" title="Facebook" class="addthis_button_facebook at300b"><img
						src="${initParam.staticPath }/images/social-facebook.png"
						alt="Facebook" border="0" height="26" width="26"></a> <a
						title="Google" target="_blank"
						href="http://www.addthis.com/bookmark.php?v=300&amp;winname=addthis&amp;pub=chellaul&amp;source=tbx32-300&amp;lng=zh-CN&amp;s=google&amp;url=http%3A%2F%2Fwww.interracialdating.com%2F&amp;title=INTERRACIAL%20DATING%20-%20interracial%20dating%20site&amp;ate=AT-chellaul/-/-/50540cc7457353bf/2&amp;frommenu=1&amp;uid=50540cc7803c138b&amp;ufbl=1&amp;ct=1&amp;pre=http%3A%2F%2Fwww.interracialdating.com%2Flogin&amp;tt=0&amp;captcha_provider=nucaptcha"
						class="addthis_button_google at300b"><img
						src="${initParam.staticPath }/images/social-google.png"
						alt="Google" border="0" height="26" width="26"></a> <a href="#"
						title="Email" target="_blank" class="addthis_button_email at300b"><img
						src="${initParam.staticPath }/images/social-email.png" alt="Email"
						border="0" height="26" width="26"></a>
					<div class="atclear"></div>
				</div>
				<a id="fb-join"
					href="http://www.facebook.com/InterracialDatingCentral"><span>Join
						us on Facebook</span></a>
				<!-- AddThis Button END -->
			</div>
		</div>
		<div class="clear"></div>


	</div>
	<!-- footer END -->

	<script type="text/javascript">
$(document).ready(function() {
  $('div.truncate-more').expander({
    slicePoint: 600,  // default is 100
  });
  $(function(){
    $('.register-chat').click(function(){
      window.location = $('#register-chat').attr('href');
    });
  }); 
  $(function(){
    $('.register').click(function(){
      window.location = $('#register').attr('href');
    });
  }); 
  $("li:first").addClass("first");
  $("li:last-child").addClass("last"); 
});
</script>


	<div style="display: none;" id="cboxOverlay"></div>
	<div style="display: none; padding-bottom: 42px; padding-right: 42px;"
		class="" id="colorbox">
		<div id="cboxWrapper">
			<div>
				<div style="float: left;" id="cboxTopLeft"></div>
				<div style="float: left;" id="cboxTopCenter"></div>
				<div style="float: left;" id="cboxTopRight"></div>
			</div>
			<div style="clear: left;">
				<div style="float: left;" id="cboxMiddleLeft"></div>
				<div style="float: left;" id="cboxContent">
					<div
						style="width: 0px; height: 0px; overflow: hidden; float: left;"
						id="cboxLoadedContent"></div>
					<div style="float: left;" id="cboxLoadingOverlay"></div>
					<div style="float: left;" id="cboxLoadingGraphic"></div>
					<div style="float: left;" id="cboxTitle"></div>
					<div style="float: left;" id="cboxCurrent"></div>
					<div style="float: left;" id="cboxNext"></div>
					<div style="float: left;" id="cboxPrevious"></div>
					<div style="float: left;" id="cboxSlideshow"></div>
					<div style="float: left;" id="cboxClose"></div>
				</div>
				<div style="float: left;" id="cboxMiddleRight"></div>
			</div>
			<div style="clear: left;">
				<div style="float: left;" id="cboxBottomLeft"></div>
				<div style="float: left;" id="cboxBottomCenter"></div>
				<div style="float: left;" id="cboxBottomRight"></div>
			</div>
		</div>
		<div
			style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
	</div>
</body>
</html>