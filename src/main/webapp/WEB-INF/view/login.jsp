<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
</head>
<body>
	<div id="login-panel" class="rnd">
		<div id="login-account">
			<form name="loginForm" action="" method="post">
				<h2>Login to InterracialDating.com</h2>

				<div class="row">
					<input class="rnd t15 field" name="login"
						placeholder="Email/Nickname" value="" type="text">
				</div>
				<div class="row">
					<input class="rnd t15 field" name="password"
						placeholder="Password" type="password">
				</div>
				<div class="row">
					<a class="forgot" href="forgot">Forgot password</a>
				</div>
				<div class="row">
					<div class="button xxlarge orange login"
						onclick="document.loginForm.submit()">
						<span>Log in</span>
					</div>
					<label class="remember" for="remember"><input class="check"
						id="remember" name="autologin" value="forever" type="checkbox">Remember
						me next time</label>
				</div>
				<div class="clear"></div>
			</form>
		</div>
		<div id="create-account">
			Not a member? <a href="/register">Create your FREE account</a>
		</div>
	</div>

	<div class="clear"></div>

</body>
</html>