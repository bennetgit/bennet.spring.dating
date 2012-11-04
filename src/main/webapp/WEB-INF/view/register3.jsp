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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register page 3</title>
<script type="text/javascript">
function lang(key) {   
    mylang = {   
  
        'r_fname': '<spring:message code="validator.error.r_fname"/>', 
        'l_fname': '<spring:message code="validator.error.l_fname"/>', 
        'r_lname': '<spring:message code="validator.error.r_lname"/>',
        'l_lname': '<spring:message code="validator.error.l_lname"/>', 
        '':''  
    };
    return mylang[key];   
}  
// only for demo purposes
$.validator.setDefaults({
	submitHandler: function(form) {
		//alert("submitted! (skipping validation for cancel button)");
		form.submit(); 
	}
});
//$.metadata.setType("attr", "validate");
$().ready(function() {
	$("#registerForm").validate({
        rules: {   
        	fname: {   
                required: true,   
                rangelength: [3, 10] 
            },   
            lname: {   
                required: true,   
                rangelength: [3, 10]   
            }   
        },
        messages: {   
        	fname: {   
                required: lang('r_fname'),   
                rangelength: lang('l_fname')   
            },   
            lname: {   
                required: lang('r_lname'),   
                rangelength: $.format(lang('l_lname'))   
            }   
        },
		errorLabelContainer: $("#registerForm div.error"),
		wrapper: 'div'
	});

});
</script>
<script type="text/javascript">
$(document).ready(function(){

	// Get regions on country change
	$('#country-select').change(function(){
		var cou = $(this).val();
		$('#region-select').find('option').remove().end();
		$.getJSON('getstates', {'typ':'regions','country':cou}, function(result){
			//console.log(result);
			if (result !== null) {
			  $.each(result, function(i,v) {
				  	var dd = $("#region-select");
          			dd.append($("<option />").val(v.stt_id).text(v.stt_name));
			  });
			  $("#region-select").show();
			}
		});
	});
	$('#country-select').change();
});
</script>
</head>
<body>


	<div class="grid-12 aleft" id="main">
		<div class="signin">
			Already a member? <a href="${ctx}/static/login">Login</a>
		</div>
		<h1>Step 3 of 3</h1>
		<p class="f15 strong">Almost there. Just some personal details and
			you're done ;)</p>
		<form id="registerForm" name="registerForm" method="post" action="">
			<input type="hidden" name="_page" value="3">

			<div class="section">
				<div class="row">
					<div class="row error"></div>
				</div>				
				<div class="row">
					<label class="lbl-2" for="fname">First name</label> <input class="rnd t13 " name="fname" id="fname" placeholder="First name"
						type="text" value="${sessionScope.form.fname }" />
				</div>
				<div class="row">
					<label class="lbl-2" for="lname">Last name</label> <input class="rnd t13 " name="lname" id="lname" placeholder="Last name"
						type="text" value="${sessionScope.form.lname }" />
				</div>


				<div class="row">
					<label class="lbl-2">Date of birth</label>
					<div class="choices">
						<select class="rnd" name="birthdate_day">
						<% for(int i=1; i<=31; i++) { %>
							<option <%= i == 1 ? "selected=\"selected\"" : ""  %> value="<%= i %>"><%= i %></option>
						<% } %>
						</select> 
						<select class="rnd" name="birthdate_month">
							<option selected="selected" value="1">January</option>
							<option value="2">February</option>
							<option value="3">March</option>
							<option value="4">April</option>
							<option value="5">May</option>
							<option value="6">June</option>
							<option value="7">July</option>
							<option value="8">August</option>
							<option value="9">September</option>
							<option value="10">October</option>
							<option value="11">November</option>
							<option value="12">December</option>
						</select> 
						<select class="rnd" name="birthdate_year">
						<% for(int i=1995; i>=1900; i--) { %>
							<option <%= i == 1995 ? "selected=\"selected\"" : ""  %> value=<%= i %>><%= i %></option>
						<% } %>
						</select>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>

			</div>

			<div class="section country">
				<div class="row">
					<label class="lbl-2">Where do you reside?&nbsp;</label>
					<div class="choices">
						<select id="country-select" name="country_id" style="">
						<c:forEach items="${sessionScope.countries}" var="c">
							<option value="${c.cou_id }">${c.cou_name }</option>
						</c:forEach>
						</select>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="row">
					<label class="lbl-2">&nbsp;</label>
					<div class="choices">
						<select id="region-select" name="state_id"
							style="display: none">
						</select>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
				<!-- 
				<div class="row">
					<label class="lbl-2">&nbsp;</label>
					<div class="choices">
						<select id="city-select" name="city-select" style="display: none">
						</select>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
				 -->
			</div>

			<div class="row action">
				<span class="notes"> By continuing, you accept the <a
					href="${ctx}/static/terms" target="_blank">Terms
						of use</a> and confirm that you are <br> 18 or older. We will
					never share your private contact info.
				</span>
				<input type="submit" name="_prev" value="Back" class="button xxlarge orange" />
				<input type="submit" name="_cancel" value="Cancel" class="button xxlarge orange" />
				<input type="submit" name="_finish" value="Finish" class="button xxlarge orange" />
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