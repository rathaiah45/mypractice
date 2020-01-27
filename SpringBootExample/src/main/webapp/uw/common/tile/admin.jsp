<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Congratulations!</title>
<jsp:include page="${contextPath}/common/header.jsp" />
</head>
<body>
	<c:if test="${activation !=null}">
		<div align="center">
			<div class='logout' style="width: 500px;">${activation}</div>
		</div>
	</c:if>
	<div class="container">
		<div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Id</th>
						<th>FirstName</th>
						<th>LastName</th>
						<th>AccountNo</th>
						<th>Email</th>
						<th>MobileNumber</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="token" items="${tokens}">
						<c:if test="${token.user.enabled == true}">
							<tr class='table-active'>
								<td>${token.user.id}</td>
								<td>${token.user.firstname}</td>
								<td>${token.user.lastname}</td>
								<td>${token.user.acccountNumber}</td>
								<td>${token.user.emailId}</td>
								<td>${token.user.mobileNumber}</td>
								<td><c:if test="${token.user.enabled == true}">
										<a href="./confirm-account?token=${token.confirmationToken}">Deactivate</a>
									</c:if> <c:if test="${token.user.enabled == false}">
										<a href="./confirm-account?token=${token.confirmationToken}">Activate</a>
									</c:if></td>
							</tr>
						</c:if>
						<c:if test="${token.user.enabled == false}">
							<tr class='danger'>
								<td>${token.user.id}</td>
								<td>${token.user.firstname}</td>
								<td>${token.user.lastname}</td>
								<td>${token.user.acccountNumber}</td>
								<td>${token.user.emailId}</td>
								<td>${token.user.mobileNumber}</td>
								<td><c:if test="${token.user.enabled == true}">
										<a href="./confirm-account?token=${token.confirmationToken}">Deactivate</a>
									</c:if> <c:if test="${token.user.enabled == false}">
										<a href="./confirm-account?token=${token.confirmationToken}">Activate</a>
									</c:if></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>