<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>

<%-- <spring:url value="/resources/js/validation.js" var="validationJS" />
<spring:url value="/resources/css/error.css" var="errorCss" />
<script src="${validationJS}"></script>
<link href="${errorCss}" rel="stylesheet" /> --%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="col-md-8 col-md-offset-2">
			<h2>Add Product</h2>
			<form:form method="POST" action="/OrderSpring/product"
				commandName="product" class="form-horizontal">
				<table>
					<tr>
						<td><form:label path="name"> Name</form:label></td>
						<td><form:input path="name" class="form-control" type="text"
								placeholder="Product Name" /></td>
						<td><form:errors path="name" class="error" /></td>
					</tr>
					<tr>
						<td><form:label path="price">Price</form:label></td>
						<td><form:input path="price" id="price" class="form-control"
								type="text" placeholder="Product Price" /></td>
						<td><form:errors path="price" class="error" /></td>
					</tr>
					<tr>
						<td colspan="2" align="right"><input input type="submit"
							class="btn btn-info" value="Save" /></td>
					</tr>

				</table>
			</form:form>
		</div>
	</div>
</body>
</html>