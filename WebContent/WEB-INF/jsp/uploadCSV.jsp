<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	
<spring:url value="/resources/css/errors.css" var="errorsCss" />
<link href="${errorsCss}" rel="stylesheet" />

<spring:url value="/resources/css/input.css" var="inputCss" />
<link href="${inputCss}" rel="stylesheet" />

<title>Insert title here</title>
</head>
<body>
<%@ include file="headerLogin.jsp"%>
	<div class="container">
		<div class="col-md-8 col-md-offset-2">
			<h2>Upload CSV</h2><br>
			<form method="POST" action="/OrderSpring/uploadCSV" class="form-horizontal" enctype="multipart/form-data">
				<div class="form-group">
					<div class="col-sm-2">
						<label>CSV File</label> 
					</div>
					<div class="col-sm-5">
						<input type="file" name="file" class="file" required/> 
					</div>
					<div class="col-sm-5">
						<label class="error">${errorMessage}</label>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-info" value="Upload" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>