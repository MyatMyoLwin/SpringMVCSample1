<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<spring:url value="/resources/js/validation.js" var="validationJS" />
<spring:url value="/resources/css/error.css" var="errorCss" />

<script src="${validationJS}"></script>
<link href="${errorCss}" rel="stylesheet" />
</head>
<body>

<h2>Edit Product</h2>
	<form:form method="POST" id="form" action="/OrderSpring/product" commandName="product">
		<form:hidden path="id"/>
		<table>
			<tr>
				<td><form:label path="name"> Name</form:label></td>
				<td><form:input path="name"/></td>
				<td><form:errors path="name" class="error"/></td>
			</tr>
			<tr>
				<td><form:label path="price">Price</form:label></td>
				<td><form:input path="price"/></td> <!-- id="price" -->
				<td><form:errors path="price" class="error"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="Submit" /></td><!-- onclick="javascript: return isNumber('price');" -->
			</tr>

		</table>
	</form:form>


</body>
</html>