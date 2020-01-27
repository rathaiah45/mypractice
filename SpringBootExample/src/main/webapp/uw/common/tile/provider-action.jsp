<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<jsp:include page="${contextPath}/common/header.jsp" />
</head>
<body>
	<div class="container">
		<form:form method="POST" modelAttribute="insuredInformation">
			<spring:hasBindErrors name="insuredInformation">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<div class="font">ISSUES</div>
					</div>
					<div class="panel-body">
						<c:forEach var="error" items="${errors.allErrors}">
							<img src="${contextPath}/resources/img/issue-approval.png" />
							<font color='red'> <spring:message message="${error}" />
							</font>
							<a href="">click</a>
							<br />
						</c:forEach>
					</div>
				</div>
			</spring:hasBindErrors>
			<div class="panel panel-default">
				<div class="panel-heading">Producer Information</div>
				<div class="panel-body"></div>
			</div>
		</form:form>
	</div>
</body>
</html>