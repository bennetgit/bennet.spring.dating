<%@ page language="java" import="java.util.*" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Register page 2</title>
<script type="text/javascript">
function lang(key) {   
    mylang = {   
  
        'r_gender': '<spring:message code="validator.error.r_gender"/>', 
        'r_match_gender': '<spring:message code="validator.error.r_match_gender"/>',
        'r_relationship': '<spring:message code="validator.error.r_relationship"/>',
        'r_ethnicity': '<spring:message code="validator.error.r_ethnicity"/>', 
        'r_about': '<spring:message code="validator.error.r_about"/>', 
        'l_about': '<spring:message code="validator.error.l_about"/>', 
        'r_username': '<spring:message code="validator.error.r_username"/>',
        'l_username': '<spring:message code="validator.error.l_username"/>', 
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

$().ready(function() {
	$("#registerForm").validate({
        rules: {   
        	gender: {   
                required: true
            },
            match_gender: {   
                required: true
            },
            relationship_seek: {   
                required: true
            },
            ethnicity: {   
                required: true
            },
            about: {   
                required: true,   
                rangelength: [10, 2000]   
            },
            username: {   
                required: true,   
                rangelength: [6, 20]   
            }
        },
        messages: {   
        	gender: {   
                required: lang('r_gender')
            },
            match_gender: {   
                required: lang('r_match_gender')
            },
            relationship_seek: {   
                required: lang('r_relationship')
            },
            ethnicity: {   
                required: lang('r_ethnicity')
            },
            about: {   
                required: lang('r_about'),   
                rangelength: $.format(lang('l_about'))   
            },
            username: {   
                required: lang('r_username'),   
                rangelength: $.format(lang('l_username'))   
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
			Already a member? <a href="${ctx}/static/login">Login</a>
		</div>
		<h1>Step 2 of 3</h1>
		<div class="rnd cta view-member">
			<div class="f15">
				Congratulations, as part of the InterracialDating.com launch, once
				you create your free profile today, you will receive <span
					class="strong">one month of VIP access on us</span>. It's our way
				of helping you find <span class="strong">who you want</span>.
			</div>
		</div>
		<p class="f15 strong">Please let us know what you're looking for!</p>
		<form id="registerForm" name="registerForm" method="post" action="">
			<input type="hidden" name="_page" value="2">
			<div class="section">
				<div class="row">
					<div class="row error"></div>
				</div>			
				<div class="row">
					<label class="lbl-2">I am a</label>
					<div class="choices">
						<label for="gender.1" class="s"> <input class="check checksingle " name="gender" id="gender.1" value="1"
							type="radio" <c:if test="${sessionScope.form.gender == 1}">checked="checked"</c:if>>Woman
						</label> <label for="gender.2" class="s"> <input
							class="check checksingle info2" name="gender" id="gender.2"
							value="2" type="radio" <c:if test="${sessionScope.form.gender == 2}">checked="checked"</c:if>>Man
						</label>
					</div>
				</div>

				<div class="row">
					<label class="lbl-2">Looking for a</label>
					<div class="choices">
						<label for="match_gender.1" class="s"> <input class="check checksingle " name="match_gender" id="match_gender.1" value="1"
							type="radio" <c:if test="${sessionScope.form.match_gender == 1}">checked="checked"</c:if>>Woman
						</label> <label for="match_gender.2" class="s"> <input
							class="check checksingle info3" name="match_gender" id="match_gender.2"
							value="2" type="radio" <c:if test="${sessionScope.form.match_gender == 2}">checked="checked"</c:if>>Man
						</label>
					</div>
				</div>
			</div>

			<div class="section type">
				<div class="row">
					<label class="lbl-2">Relationship seeking</label>
					<div class="choices">
						<c:if test="${not empty sessionScope.form.relationship_seek}">
						<c:forEach items="${t_relationship}" var="item" varStatus="i">
							<label for="relationship_seek.${item.key }" class="s"> <input class="check checksingle " name="relationship_seek" id="relationship_seek.${item.key }" value="${item.key }"
								type="checkbox" 
								<c:if test="${sessionScope.form.relationship_seek.indexOf(item.key) != -1 }">checked="checked"</c:if>>${item.value }
							</label>
						</c:forEach>
						</c:if>
						<c:if test="${empty sessionScope.form.relationship_seek}">
						<c:forEach items="${t_relationship}" var="item" varStatus="i">
							<label for="relationship_seek.${item.key }" class="s"> <input class="check checksingle " name="relationship_seek" id="relationship_seek.${item.key }" value="${item.key }"
								type="checkbox">${item.value }
							</label>
						</c:forEach>
						</c:if>				
					</div>
				</div>

			</div>

			<div class="section ethnicity">
				<div class="row">
					<label class="lbl-2">My ethnicity is</label>
					<div class="choices">
						<c:forEach items="${t_ethnicity}" var="item">
							<label for="ethnicity.${item.key }" class="m"> <input class="check checksingle " name="ethnicity" id="ethnicity.${item.key }" value="${item.key }"
								type="radio" <c:if test="${sessionScope.form.ethnicity == item.key}">checked="checked"</c:if>>${item.value } 
							</label>
						</c:forEach>
					</div>
				</div>

			</div>

			<div class="section describe">
				<div class="label-ctn">
					<label class="lbl-2">Describe yourself</label>
					<div class="tip">Include hobbies, favourite music, the
						perfect date. Anything that paints a picture of you and your
						personality.</div>
					<div class="counter">
						<strong><span id="display_count">0</span> words</strong><br>
						(minimum of 20 words please)
					</div>
				</div>
				<textarea class="rnd t13" cols="5" rows="2" name="about" id="word_count"
					placeholder="Tell us a bit about what makes you unique?">${sessionScope.form.about }</textarea>
			</div>

			<div class="section username">

				<div class="row">
					<div class="label-ctn">
						<label class="lbl-2" for="nickname">Choose a Nickname</label>
						<div class="tip">This is the name you go by on
							InterracialDating.com.</div>
					</div>
					<div class="choices">
						<input class="rnd t13" id="nickname" name="username" autocomplete="off" placeholder="Nickname" type="text" value="${sessionScope.form.username }" />
						<div id="nickname_status">
							<span class="notes">Must be letters, numbers, .-_ and
								between 3-12 characters</span>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>

			<div class="row action">
				<input type="submit" name="_prev" value="Back" class="button xxlarge orange" />
				<input type="submit" name="_next" value="Continue" class="button xxlarge orange" />
			</div>

		</form>
	</div>

	<script>
	
  $(document).ready(function() {
    $('#nickname').keyup(nickname_check);
    nickname_check();
  
    $('#word_count').keyup(wordCount);
    wordCount();
  }); 
  
  function wordCount()
  {	
    var word_text = $('#word_count').val();
    
    var total = 0;
    var trim_word_text = $.trim(word_text);
    total = trim_word_text.split(/\s+/).length;
    if (trim_word_text == "")
      total = 0;

    $('#display_count').html(total);
  }
  
  function nickname_check()
  {	
    var nickname = $('#nickname').val();
    var member_id = $('#member_id').val();
    if (nickname == "" || nickname.length < 3)
    {
      $('#nickname_status').html('<span class="notes">Must be letters, numbers, .-_ and between 3-12 characters</span>');
    } 
    else 
    {
      $('#nickname_status').html('<span class="notes"><img src="/dating/themes/4/image/loading_15x15.gif"></span>');
      
      $.getJSON("/register", { ajax_nickname: 1, nickname: nickname, member_id: member_id }, function(json) {
        if (json.result == 'invalid_value')
        {
          $('#nickname_status').html('<span class="notes cross">Must be letters, numbers, .-_ and between 3-12 characters</span>');
        }
        else if (json.result == 'duplicate_value')
        {
          $('#nickname_status').html('<span class="notes cross">Nickname already in use</span>');
        }
        else if (json.result == 'inappropriate_value')
        {
          $('#nickname_status').html('<span class="notes cross">Nickname not available</span>');
        }
        else if (json.result == 1)
        {
          $('#nickname_status').html('<span class="notes tick">Available</span>');    
        }
        else
        {
          $('#nickname_status').html('<span class="notes cross">Unknown error</span>');
        }
      });
    }
  }
</script>
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