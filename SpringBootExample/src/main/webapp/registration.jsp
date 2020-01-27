<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Registration</title>
<jsp:include page="${contextPath}/common/header.jsp" />
</head>
<body>
	<div class="container">
		<form:form method="POST" modelAttribute="userForm">
			<spring:hasBindErrors name="userForm">
				<div class="panel panel-danger">
					<div class="panel-heading">ISSUES</div>
					<div class="panel-body">
						<c:forEach var="error" items="${errors.allErrors}">
							<img src="${contextPath}/resources/img/issue-error.png" />
							<font color='red'> <spring:message message="${error}" />
							</font>
							<a href="">click</a>
							<br />
						</c:forEach>
					</div>
				</div>
			</spring:hasBindErrors>
			<div id='default-panel' class="panel panel-default">
				<div class="panel-heading">Registration Information</div>
				<div class="panel-body">
					<table>
						<tr>
							<th id="firstname">First Name*</th>
							<td id='firstname'><spring:bind path="firstname">
									<form:input type="text" path="firstname"
										placeholder="First Name" class='form-control' autofocus="true"
										requred="true" value="${firstname}"></form:input>
								</spring:bind></td>
							<th id='lastname'>Last Name*</th>
							<td id='lastname'><spring:bind path="lastname">
									<form:input type="text" path="lastname" placeholder="Last Name"
										class='form-control' autofocus="true" value="${lastname}"></form:input>
								</spring:bind></td>
						</tr>
						<tr id='username'>
							<th>User Name*</th>
							<td><spring:bind path="username">
									<form:input type="text" path="username" placeholder="Username"
										class='form-control' autofocus="true" value="${username}"></form:input>
								</spring:bind></td>
							<th></th>
							<td></td>
						</tr>
						<tr id='password'>
							<th>PassWord*</th>
							<td><spring:bind path="password">
									<form:input type="password" path="password"
										class="form-control" placeholder="Password" value="${password}"></form:input>
								</spring:bind></td>
							<th>Confirm Password*</th>
							<td><spring:bind path="passwordConfirm">
									<form:input type="password" path="passwordConfirm"
										class="form-control" placeholder="Confirm your password" value="${passwordConfirm}"></form:input>
								</spring:bind></td>
						</tr>
						<tr>
							<th>Mobile Number</th>
							<td><spring:bind path="mobileNumber">
									<form:input type="text" path="mobileNumber"
										class="form-control" placeholder="Enter Mobile Number" value="${mobileNumber}"></form:input>
								</spring:bind></td>
							<th><form:label for="emailId" path='emailId'>Email*</form:label></th>
							<td><spring:bind path="emailId">
									<form:input type="text" path="emailId" class="form-control"
										placeholder="Enter Email" value="${emailId}"></form:input>
								</spring:bind></td>
						</tr>
						<c:if test="${accountNumber == null}">
							<tr>
								<th>Account No:</th>
								<td>${accountNumber}</td>
							</tr>
						</c:if>

					</table>

					<div class='sectionSeparator'>AddressInformation</div>
					<table>
						<tr>
							<th id='addr1'>AddressLine1</th>
							<td id='addr1'><spring:bind path="address[0].addr1">
									<form:input type="text" path="address[0].addr1"
										class="form-control" placeholder="" value="${address[0].addr1}"></form:input>
								</spring:bind></td>
							<th id='addr2'>AddressLine2</th>
							<td id='addr2'><spring:bind path="address[0].addr2">
									<form:input type="text" path="address[0].addr2"
										class="form-control" placeholder="" value="${address[0].addr2}"></form:input>
								</spring:bind></td>
						</tr>
						<tr>
							<th id='city'>City</th>
							<td id='city'><spring:bind path="roles[0].name">
									<form:input type="text" path="roles[0].name"
										class="form-control" placeholder="" value="${role[0].name}"></form:input>
								</spring:bind></td>
							<th id='state'>State</th>
							<td id='state'><spring:bind path="address[0].state">
									<form:input type="text" path="address[0].state"
										class="form-control" placeholder="" value="${address[0].state}"></form:input>
								</spring:bind></td>

						</tr>
						<tr>
							<th id='district'>District</th>
							<td id='district'><spring:bind path="address[0].district">
									<form:input type="text" path="address[0].district"
										class="form-control" placeholder="" value="${address[0].district}"></form:input>
								</spring:bind></td>
							<th id='postalcode'>ZipCode</th>
							<td id='postalcode'><spring:bind path="address[0].postalcode">
									<form:input type="text" path="address[0].postalcode"
										class="form-control" placeholder="" value="${address[0].postalcode}"></form:input>
								</spring:bind></td>
							<td></td>
						</tr>
						<tr>
							<th></th>
							<td><button class="btn btn-lg btn-primary btn-block"
									type="submit">Submit</button></td>
							<th></th>
						</tr>
					</table>
				</div>
			</div>
		</form:form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- <script type="text/javascript">
		$(document).ready(function(){
			$("#").change(function(){
				var vari="";
				var js={
						vari:"";
				}
				
				$ajax(function(js){
					type:"post";
					content-type:""
					url:""
					data:JSON.stringify(js)
					html.
				});
			});
		});
		</script> -->
</body>
</html>
