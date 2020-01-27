<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="${contextPath}/common/header.jsp"></jsp:include>
<meta charset="utf-8">
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>

<body>
	<div class="container" align="center">
		<c:if test="${message != null}">
			<div class='logout' style="width: 300px;">${message}</div>
		</c:if>
		<c:if test="${error != null}">
			<div class='logout' style="width: 300px;">${error}</div>
		</c:if>
		<br />
		<div id='default-panel' class="panel panel-default"
			style="display: inline-block">
			<div class="panel-heading">
				<div class="font">Login Information</div>
			</div>
			<div class="panel-body">
				<form method="POST" action="${contextPath}/login"
					class="form-signin">
					<div class="form-group ${error != null ? 'has-error' : ''}">
						<table>
							<tr>
								<th id='username'>UserName*</th>
								<td><input name="username" type="text" class="form-control"
									placeholder="Username" required="required"/></td>
							</tr>
							<tr>
								<th id='password'>PassWord*</th>
								<td><input name="password" type="password"
									class="form-control" placeholder="Password" required="required"/></td>
							</tr>
						</table>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<button class="btn btn-lg btn-primary btn-block" type="submit">Log
							In</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"/>
	<script src="${contextPath}/resources/js/bootstrap.min.js"/>
</body>
</html>
