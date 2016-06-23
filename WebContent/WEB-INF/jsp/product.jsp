<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<spring:url value="/resources/css/body.css" var="bodyCSS" />
<link href="${bodyCSS}" rel="stylesheet" type="text/css" />

<spring:url value="/resources/css/table.css" var="tableCSS" />
<link href="${tableCSS}" rel="stylesheet" />

<spring:url value="/resources/css/img.css" var="imgCSS" />
<link href="${imgCSS}" rel="stylesheet" />

<spring:url value="/resources/images" var="images" />

<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script>

angular.module('product', []).controller('productsCtrl', function($scope) {
		$scope.products = [
        {id:'123',name:'mouse',price:'100'},
        {id:'124',name:'screen guard',price:'10000'},
        {id:'125',name:'Tape',price:'300'},
        {id:'126',name:'adapter',price:'23000'},
        {id:'127',name:'Harddisk',price:'30000'},
        {id:'128',name:'memory stick',price:'4200'}        
        ];
});

</script>

<title>All Products</title>
</head>
<body class="body">
	<%@ include file="headerLogin.jsp"%>

	<div class="container">
		<div class="col-md-8 col-md-offset-2">
			<!-- <div class="container text-center"> -->

			<h2>Product List</h2>
			<div ng-app="product" ng-controller="productsCtrl">
				<table width="600">
					<tr>
						<td><a href="addproduct" class="btn btn-info" role="button">New
								Product</a></td>
						<td><a href="downloadCSV" class="btn btn-info" role="button">Download
								CSV</a></td>
						<td><a href="uploadCSV" class="btn btn-info" role="button">Upload
								CSV</a></td>
						<td><input type="text" class="form-control" ng-model="search" /></td>

					</tr>
				</table>

				<br>

				<%-- <div class="table-responsive">

				<table class="table table-striped">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Price</th>
						<th>Actions</th>
					</tr>
					<c:forEach var="product" items="${productList}">
						<tr>
							<td>${product.id}</td>
							<td>${product.name}</td>
							<td>${product.price}</td>
							<td><a href="editproduct?id=${product.id}"> <img
									src="${images}/edit.png" title="edit" /></a>&nbsp;<a href="deleteproduct?id=${product.id}"
								onclick="return confirm('Are you sure you want to delete?')"><img src="${images}/delete.png" title="delete" />
								
							</a></td>
						</tr>
					</c:forEach>
				</table>
			</div> --%>
				<div class="table-responsive">
					<table class="table table-striped">
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Price</th>
							<th>Actions</th>
						</tr>
						<tr ng-repeat="p in products | filter : search">
							<td>{{ p.id }}</td>
							<td>{{ p.name }}</td>
							<td>{{ p.price }}</td>
							<td><a href="editproduct?id={{ p.id }}"> <img
									src="${images}/edit.png" title="edit" /></a>&nbsp;<a href="deleteproduct?id={{ p.id }}"
								onclick="return confirm('Are you sure you want to delete?')"><img src="${images}/delete.png" title="delete" />
								
							</a></td>
						</tr>
					</table>
				<!-- 	<ul>
						<li ng-repeat="x in names">{{ x.name + ', ' +
							x.country }}</li>
					</ul> -->
				</div>
			</div>

			<br>

			<ul class="pagination">
				<c:if test="${currentPage != 1}">
					<li><a href="product?page=${currentPage - 1}">Previous</a></li>
				</c:if>
				<c:forEach begin="1" end="${noOfPages}" var="i">
					<c:choose>
						<c:when test="${currentPage eq i}">
							<li class="active"><a href="#">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="product?page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${currentPage lt noOfPages}">
					<li><a href="product?page=${currentPage + 1}">Next</a></li>
				</c:if>
			</ul>

		</div>
	</div>

</body>
</html>