<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%-- <spring:url value="/resources/js/validation.js" var="validationJS" />
<script src="${validationJS}"></script>--%>
<spring:url value="/resources/css/errors.css" var="errorsCss" />
<link href="${errorsCss}" rel="stylesheet"/> 

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="col-md-8 col-md-offset-2">

			<h2>Edit Product</h2>

			<form:form method="POST" id="form" action="/OrderSpring/product"
				commandName="product" class="form-horizontal" role="form">
				<form:hidden path="id" />
				<table class="table">
					<tr>
						<td><form:label path="name"> Name</form:label></td>
						<td><form:input path="name" class="form-control" type="text"
								placeholder="Product Name" /></td>
						<td><form:errors path="name" class="error"/></td>
					</tr>
					<tr>
						<td><form:label path="price">Price</form:label></td>
						<td><form:input path="price" class="form-control" type="text"
								placeholder="Product Name" /></td>
						<!-- id="price" -->
						<td><form:errors path="price" class="error" /></td>
					</tr>
					<tr>
						<td colspan="2" align="right"><input type="submit"
							class="btn btn-info" value="Save" /></td>
						<!-- onclick="javascript: return isNumber('price');" -->
					</tr>
				</table>
			</form:form>
		</div>
	</div>

</body>
</html>