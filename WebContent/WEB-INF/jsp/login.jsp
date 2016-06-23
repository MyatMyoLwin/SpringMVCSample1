<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<spring:url value="/resources/js/validation.js" var="validationJS" />
<script src="${validationJS}"></script>
<spring:url value="/resources/css/errors.css" var="errorsCss" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="col-md-8 col-md-offset-2">
			<h2>Login</h2>
			<form method="POST" action="<c:url value='/j_spring_security_check' />" class="form-horizontal">
				<div class="form-group">
					<div class="col-sm-2">
					<label>User Name</label>
					</div>
					<div class="col-sm-5">
						<input class="form-control" type="text" name ="j_username"
							placeholder="User Name" />
					</div>
					<div class="col-sm-5">
						<form:errors class="error" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2">
					<label>Password</label>
					</div>
					<div class="col-sm-5">
						<input  id="password" class="form-control" name="j_password"
							type="password" placeholder="Password" />
					</div>
					<div class="col-sm-5">
						<form:errors class="error" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-info" value="Login" />
					</div>
				</div>
				
				 <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

				
			</form>
		</div>
	</div>
</body>
</html>


<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
</style>
</head>
<body onload='document.loginForm.username.focus();'>

	<h1>Spring Security Custom Login Form (XML)</h1>

	<div id="login-box">

		<h2>Login with Username and Password</h2>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='loginForm'
		  action="<c:url value='j_spring_security_check' />" method='POST'>

		  <table>
			<tr>
				<td>User:</td>
				<td><input type='text' name='username' value=''></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='password' /></td>
			</tr>
			<tr>
				<td colspan='2'><input name="submit" type="submit"
					value="submit" /></td>
			</tr>
		  </table>

		  <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

		</form>
	</div>

</body>
</html> --%>