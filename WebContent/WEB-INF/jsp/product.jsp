<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<spring:url value="/resources/css/table.css" var="tableCSS" />
<link href="${tableCSS}" rel="stylesheet" />
<title>All Products</title>
</head>
<body>
<h2>Product List</h2>
	<table>
		<tr>
			<td><a href="addproduct">New Product</a></td>
			<td><a href="downloadCSV">Download CSV</a></td>
		</tr>
	</table>
	
	<br>

	<table class="dbtable">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Price</th>
			<th colspan="2"></th>
		</tr>
		<c:forEach var="product" items="${productList}">
			<tr align="center">
				<td>${product.id}</td>
				<td>${product.name}</td>
				<td>${product.price}</td>
				<td><a href="editproduct?id=${product.id}">Edit</a></td>
				<td><a href="deleteproduct?id=${product.id}"
					onclick="return confirm('Are you sure you want to delete?')">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<br>

	<table cellpadding="5" cellspacing="0">
		<tr>
			<c:if test="${currentPage != 1}">
				<td><a href="product?page=${currentPage - 1}">Previous</a></td>
			</c:if>
			<c:forEach begin="1" end="${noOfPages}" var="i">
				<c:choose>
					<c:when test="${currentPage eq i}">
						<td>${i}</td>
					</c:when>
					<c:otherwise>
						<td><a href="product?page=${i}">${i}</a></td>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${currentPage lt noOfPages}">
				<td><a href="product?page=${currentPage + 1}">Next</a></td>
			</c:if>
		</tr>
	</table>

</body>
</html>