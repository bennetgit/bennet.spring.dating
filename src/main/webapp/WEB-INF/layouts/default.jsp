<%@ page language="java" import="org.springframework.web.servlet.i18n.SessionLocaleResolver"  contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mvc.uitls.*" %>	
<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
Locale locale = new Locale("en", "US");
if (request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME) != null ) {
	locale = (Locale) request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
}
request.setAttribute("locale", locale.getLanguage());

//Properties pro = PropertyUtils.get(request.getRealPath("/WEB-INF/"));   
//request.setAttribute("imagePatch", pro.getProperty("image.root"));
//request.setAttribute("webRoot", pro.getProperty("web.root")); 
%>
<!-- 
<%= application.getInitParameter("imageRoot") %>
 ${initParam.imageRoot }
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title><decorator:title default="Register page" /> - interracial dating site </title>
    <meta name="description" content="INTERRACIAL DATING - Our website provides interracial dating services for Black and White, Asian and Latino singles open to interracial relationships. Click here for extensive Success Stories and unique Guarantee.">
    <meta name="keywords" content="interracial dating services, black and white dating, interracial dating, black white dating, black women white men dating, black men white women dating, black women white men, black men white women, black and white dating">
    <link rel="stylesheet" href="${ctx}/static/css/reset.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/static/css/style.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/static/css/color.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/static/css/widget095.css" type="text/css"> 
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/additional-methods.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/messages_${requestScope.locale}.js"></script>
    <decorator:head />
</head>
<body class="register">
    <!-- Header BEGIN -->
    <div id="header-ctn" class="wrapper dark">
        <div class="ctn-16">
            <div id="header" class="grid-16">
                <div id="header-links">
                    <div class="share-icons">
                        <!-- AddThis Button BEGIN -->
                        <div class="addthis_toolbox addthis_default_style">
                            <div class="atclear">
                                <a href="?locale=zh_CN">Chinese</a> 
    							<a href="?locale=en_US">English</a>
                            </div>
                        </div>
                        <!-- AddThis Button END -->
                    </div>
                    <!-- Strip menu BEGIN -->
                    <div id="strip">
                        <ul>
                            <li class="first"><a href="${ctx}/register">Join Free </a>
                            </li>
                            <li class="last"><a href="${ctx}/login">Login </a></li>
                        </ul>
                    </div>
                    <div class="clear">
                    </div>
                    <!-- Strip menu END -->
                </div>
            </div>
        </div>
    </div>
    <!-- header END -->
    <!-- nav BEGIN -->
    <div id="navigation-ctn" class="wrapper">
        <div class="ctn-16">
            <div id="navigation" class="grid-16">
                <div id="logo">
                    <a href="${ctx}/"><span>Where love is more than skin deep...
                    </span></a>
                </div>
                <div class="nav">
                    <ul>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- nav END -->
    <!-- content BEGIN -->
    <div id="content-ctn" class="wrapper">
    	<div id="content" class="ctn-16">
	    	<!-- main content here -->
	    	<decorator:body />
    	</div>
    </div>
    <!-- content END -->
    <!-- footer BEGIN -->
    <div class="wrapper" id="footer-ctn">
        <div class="ctn-16">
            <div class="grid-16" id="footer">
                <ul class="footer-nav">
                    <li><a href="${ctx}/interracial-couples">Success Stories </a>
                    </li>
                    <li><a href="${ctx}/online-dating-safety">Online Safety </a>
                    </li>
                    <li><a href="${ctx}/terms">Terms </a></li>
                    <li><a href="${ctx}/privacy-policy">Privacy Policy </a>
                    </li>
                    <li class="last"><a href="${ctx}/contact">Contact </a>
                    </li>
                </ul>
                <div class="clear">
                </div>
                <p class="copyright">
                    Copyright © 2003-2012 InterracialDating.com, Chellaul Corporation, All Rights Reserved.
                    <br>
                    InterracialDating.com does not conduct background checks on the members or subscribers
                    of this website <a title="102:80  M1.08 T0.17 gz">. </a>
                </p>
                <div id="powered-by" title="Powered by Interracial Dating">
                    <span>Powered by Interracial Dating </span>
                </div>
                <!-- AddThis Button BEGIN -->
                <div id="social-share" class="addthis_toolbox addthis_default_style addthis_32x32_style">
                    <a href="#" title="Facebook" class="addthis_button_facebook at300b">
                        <img src="${ctx}/static/images/social-facebook.png" alt="Facebook" border="0" height="26"
                            width="26">
                    </a><a title="Google" target="_blank" href="http://www.addthis.com/bookmark.php?v=300&amp;winname=addthis&amp;pub=chellaul&amp;source=tbx32-300&amp;lng=zh-CN&amp;s=google&amp;url=http%3A%2F%2Fwww.interracialdating.com%2Fregister&amp;title=INTERRACIAL%20DATING%20-%20interracial%20dating%20site&amp;ate=AT-chellaul/-/-/5054464a8187df91/2&amp;frommenu=1&amp;uid=5054464a0c864c79&amp;ufbl=1&amp;ct=1&amp;pre=http%3A%2F%2Fwww.interracialdating.com%2Flogin&amp;tt=0&amp;captcha_provider=nucaptcha"
                        class="addthis_button_google at300b">
                        <img src="${ctx}/static/images/social-google.png" alt="Google" border="0" height="26" width="26">
                    </a><a href="#" title="Email" target="_blank" class="addthis_button_email at300b">
                        <img src="${ctx}/static/images/social-email.png" alt="Email" border="0" height="26" width="26">
                    </a>
                    <div class="atclear">
                    </div>
                </div>
                <a id="fb-join" href="http://www.facebook.com/InterracialDatingCentral"><span>Join us
                    on Facebook </span></a>
                <!-- AddThis Button END -->
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <!-- footer END -->
    <div style="display: none;" id="cboxOverlay">
    </div>
    <div style="display: none; padding-bottom: 42px; padding-right: 42px;" class="" id="colorbox">
        <div id="cboxWrapper">
            <div>
                <div style="float: left;" id="cboxTopLeft">
                </div>
                <div style="float: left;" id="cboxTopCenter">
                </div>
                <div style="float: left;" id="cboxTopRight">
                </div>
            </div>
            <div style="clear: left;">
                <div style="float: left;" id="cboxMiddleLeft">
                </div>
                <div style="float: left;" id="cboxContent">
                    <div style="width: 0px; height: 0px; overflow: hidden; float: left;" id="cboxLoadedContent">
                    </div>
                    <div style="float: left;" id="cboxLoadingOverlay">
                    </div>
                    <div style="float: left;" id="cboxLoadingGraphic">
                    </div>
                    <div style="float: left;" id="cboxTitle">
                    </div>
                    <div style="float: left;" id="cboxCurrent">
                    </div>
                    <div style="float: left;" id="cboxNext">
                    </div>
                    <div style="float: left;" id="cboxPrevious">
                    </div>
                    <div style="float: left;" id="cboxSlideshow">
                    </div>
                    <div style="float: left;" id="cboxClose">
                    </div>
                </div>
                <div style="float: left;" id="cboxMiddleRight">
                </div>
            </div>
            <div style="clear: left;">
                <div style="float: left;" id="cboxBottomLeft">
                </div>
                <div style="float: left;" id="cboxBottomCenter">
                </div>
                <div style="float: left;" id="cboxBottomRight">
                </div>
            </div>
        </div>
        <div style="position: absolute; width: 9999px; visibility: hidden; display: none;">
        </div>
    </div>
</body>
</html>
