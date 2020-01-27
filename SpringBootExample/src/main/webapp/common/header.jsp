<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Welcome ${pageContext.request.userPrincipal.name}</title>
<link rel="shortcut icon" href="${contextPath}/resources/img/logo.png" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>
	<img src="${contextPath}/resources/img/logo.png" width="100"
		height="50" />
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"></a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="./">Home</a></li>
				<li><a href="${contextPath}/account-request-user">Underwriting</a></li>
				<li><a href="#">Claims</a></li>
			</ul>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<c:if test="${insuredInformationTile != true}">
						<li><a href="${contextPath}/insuredinformation">Start
								Quote</a></li>
					</c:if>
					<li><a onclick="document.forms['logoutForm'].submit()">Logout</a></li>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<c:if test="${registration != true}">
						<li><a href="${contextPath}/registration"><span
								class="glyphicon glyphicon-user"></span>Sign Up</a></li>
					</c:if>
					<li><a href="${contextPath}/login"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<form id="logoutForm" method="POST" action="${contextPath}/logout">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</c:if>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
