<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<spring:url value="/resources/css/div.css" var="divCSS" />
<link href="${divCSS}" rel="stylesheet" />
<style type="text/css">

</style>
</head>
<body>
<div class="jumbotron">
	<div id="bnrDiv1"></div>
    <div id="bnrDiv2"> Hello!&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="product">Home</a></div>

</div>
</body>
</html>

