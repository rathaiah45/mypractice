<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Congratulations!</title>
<jsp:include page="${contextPath}/common/header.jsp" />
</head>
<body>
	<div align="center">
		<div class='logout'>Congratulations! Your account has been
			activated and email is verified!</div>
	</div>
	<div class="container">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Firstname</th>
						<th>Lastname</th>
						<th>Age</th>
						<th>City</th>
						<th>Country</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Anna</td>
						<td>Pitt</td>
						<td>35</td>
						<td>New York</td>
						<td>USA</td>
						<td><a href=''>click</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>
