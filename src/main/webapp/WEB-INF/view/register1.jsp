<%@ page language="java" import="java.util.*"
	contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>Register page 1</title>
<script type="text/javascript">

function lang(key) {   
    mylang = {   
  
        'r_email': '<spring:message code="validator.error.r_email"/>', 
        'f_email': '<spring:message code="validator.error.f_email"/>',
        'r_password': '<spring:message code="validator.error.r_password"/>',   
        'l_password': '<spring:message code="validator.error.l_password"/>', 
        '':''  
    };
    return mylang[key];   
}  

// only for demo purposes
$.validator.setDefaults({
	//debug: true,
	submitHandler: function(form) {
		//alert("submitted! (skipping validation for cancel button)");
		form.submit(); 
	}
});

$().ready(function() {
	$("#registerForm").validate({	
        rules: {   
        	email: {   
                required: true,   
                email: true  
            },   
            password: {   
                required: true,   
                rangelength: [6, 20]   
            }   
        },
        messages: {   
        	email: {   
                required: lang('r_email'),   
                email: lang('f_email')   
            },   
            password: {   
                required: lang('r_password'),   
                rangelength: $.format(lang('l_password'))   
            }   
        },
		errorLabelContainer: $("#registerForm div.error"),
		wrapper: 'div'
	});

});
</script>
</head>
<body>

	<div class="grid-12 aleft" id="main">
		<div class="signin">
			Already a member? <a href="${ctx}/static/login">Login
			</a>
		</div>
		<h1>Become an InterracialDating.com Member</h1>
		<p class="f15">Join the millions of InterracialDating.com members
			already looking for love online</p>
		<form id="registerForm" name="registerForm" method="post" action="">
			<input type="hidden" name="_page" value="1">
			<div class="row">
				<div class="row error">
				</div>
			</div>
			<div class="row">
				<label for="email" class="lbl-1"> <spring:message code="email"/> </label>
				<div class="choices">
					<input class="rnd t15"  name="email" id="email" value="${sessionScope.form.email }"
						placeholder="Email address" type="text"> <span
						class="notes"><spring:message code="form.register.email"/></span>
				</div>
			</div>
			<div class="clear"></div>
			<div class="row">
				<label for="password" class="lbl-1"> <spring:message code="Password"/> </label>
				<div class="choices">
					<input class="rnd t15" name="password" id="password" value="${sessionScope.form.password }"
						placeholder="Password" type="password">
					<div id="password-status">
						<span class="notes"><spring:message code="form.register.password"/></span>
					</div>
				</div>
			</div>
			<div class="row action">
				<span class="notes">By continuing, you accept the <a
					href="${ctx}/static/terms" target="_blank">Terms of
						use </a>and confirm that you are <br> 18 or older. We will never
					share your private contact info.
				</span>
				<input type="submit" name="_next" value="Continue" class="button xxlarge orange" />
			</div>
		</form>
	</div>
	<div class="grid-4 aright">
		<div class="cta rnd new-members">
			<h4>New members</h4>
			<p>Some new members who've joined InterracialDating.com...</p>
			<div class="photos">
				<div class="photo-ctn ">
					<div class="photo photo-80x100">
						<img class="last"
							src="${ctx}/static/images/tn_m7927665_13476684786157.jpg"
							alt="" height="100" width="80">
					</div>
				</div>
				<div class="photo-ctn last">
					<div class="photo photo-80x100">
						<img class="last"
							src="${ctx}/static/images/tn_m7635908_12385290149263.jpg"
							alt="" height="100" width="71">
					</div>
				</div>
				<div class="photo-ctn ">
					<div class="photo photo-80x100">
						<img class="last"
							src="${ctx}/static/images/tn_m7413959_13471537492730.jpg"
							alt="" height="100" width="80">
					</div>
				</div>
				<div class="photo-ctn last">
					<div class="photo photo-80x100">
						<img class="last"
							src="${ctx}/static/images/tn_m7454157_13471339181667.jpg"
							alt="" height="100" width="80">
					</div>
				</div>
				<div class="photo-ctn ">
					<div class="photo photo-80x100">
						<img class="last"
							src="${ctx}/static/images/tn_m7861466_13475050929839.jpg"
							alt="" height="100" width="80">
					</div>
				</div>
				<div class="photo-ctn last">
					<div class="photo photo-80x100">
						<img class="last"
							src="${ctx}/static/images/tn_m8045986_13476576609585.jpg"
							alt="" height="100" width="80">
					</div>
				</div>
				<div class="photo-ctn ">
					<div class="photo photo-80x100">
						<img class="last"
							src="${ctx}/static/images/tn_m38949_12352835902375.jpg"
							alt="" height="100" width="69">
					</div>
				</div>
				<div class="photo-ctn last">
					<div class="photo photo-80x100">
						<img class="last"
							src="${ctx}/static/images/tn_m7350382_13285697611380.jpg"
							alt="" height="100" width="80">
					</div>
				</div>
				<div class="photo-ctn ">
					<div class="photo photo-80x100">
						<img class="last"
							src="${ctx}/static/images/tn_m7817655_13453522038852.jpg"
							alt="" height="100" width="80">
					</div>
				</div>
				<div class="photo-ctn last">
					<div class="photo photo-80x100">
						<img class="last"
							src="${ctx}/static/images/tn_m7850751_13173248585586.jpg"
							alt="" height="100" width="80">
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="clear"></div>

</body>
</html>