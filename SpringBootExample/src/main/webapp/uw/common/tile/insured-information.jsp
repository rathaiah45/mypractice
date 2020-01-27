<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="${contextPath}/common/header.jsp" />
<meta charset="utf-8">
<title>Welcome ${pageContext.request.userPrincipal.name}</title>
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
				<div class="panel-heading">Insured Information</div>
				<div class="panel-body">
					<div class="form-group ${error != null ? 'has-error' : ''}">
						<table>
							<tr>
								<th>Entity Type</th>
								<td><spring:bind path="entitytype">
										<form:select path='entitytype' class='form-control'>
											<form:option value="">Select...</form:option>
											<form:option value="Individual">Individual</form:option>
											<form:option value="Business">Business</form:option>
										</form:select>
									</spring:bind></td>
							</tr>
							<tr id='non-business'>

								<th>FirstName</th>
								<td><spring:bind path="firstname">
										<form:input type="text" path="firstname"
											placeholder='Enter First Name' class='form-control' />
									</spring:bind></td>
								<th>MiddleName</th>
								<td><spring:bind path="middlename">
										<form:input type="text" path="middlename"
											placeholder='Enter Middle Name' class='form-control' />
									</spring:bind></td>
								<th>LastName</th>
								<td><spring:bind path="lastname">
										<form:input type="text" path="lastname"
											placeholder='Enter Last Name' class='form-control' />
									</spring:bind></td>
							</tr>
							<tr id='dob'>
								<th>DOB</th>
								<td><spring:bind path="dob">
										<form:input type="date" path="dob" />
									</spring:bind></td>
							</tr>
							<tr id='business'>
								<th>Name</th>
								<td><spring:bind path="businessname">
										<form:input type="text" path="businessname"
											class='form-control' />
									</spring:bind></td>
							</tr>
							<tr>
								<th>IndexName</th>
								<td><spring:bind path="indexName">
										<form:input type="text" path="indexName" class='form-control'
											readonly="true" />
									</spring:bind></td>
								<td><button id='editbutton'
										class="btn btn-lg btn-primary btn-block" type="button">Edit</button></td>
							</tr>
							<tr>
								<th>DBAName</th>
								<td><spring:bind path="dbaName">
										<form:input type="text" path="dbaName" class='form-control'
											readonly="true" />
									</spring:bind></td>
							</tr>
						</table>
						<hr />
						<h5>Mailing Address</h5>
						<table>
							<c:forEach items="${insuredInformation.getMailingAddress()}"
								var="mailingAddress">
								<spring:bind path="mailingAddress[0].addr1">
									<tr>
										<th>AddressLine1</th>
										<td><form:input type="text"
												path="mailingAddress[0].addr1" class='form-control' /></td>
									</tr>
								</spring:bind>
								<spring:bind path="mailingAddress[0].addr2">
									<tr>
										<th>AddressLine2</th>
										<td><form:input type="text"
												path="mailingAddress[0].addr2" class='form-control' /></td>
									</tr>
								</spring:bind>

								<tr>
									<th>City</th>
									<spring:bind path="mailingAddress[0].city">
										<td><form:input type="text" path="mailingAddress[0].city"
												class='form-control' /></td>
									</spring:bind>
									<th>State</th>
									<spring:bind path="mailingAddress[0].state">
										<td><form:select path='mailingAddress[0].state'
												class='form-control'>
												<form:option value="AndhraPradesh">AndhraPradesh</form:option>
												<form:option value="Karnataka">Karnataka</form:option>
												<form:option value="TamilNadu">TamilNadu</form:option>
											</form:select></td>
									</spring:bind>
									<th>District</th>
									<spring:bind path="mailingAddress[0].district">
										<td><form:input type="text"
												path="mailingAddress[0].district" class='form-control' /></td>
									</spring:bind>
								</tr>
								<tr>
									<th>Postal Code</th>
									<td><form:input type="text"
											path="mailingAddress[0].postalcode" class='form-control' /></td>
								</tr>
								<tr>

								</tr>
								<tr>
									<th></th>
									<td><button class="btn btn-lg btn-primary btn-block"
											type="submit">Submit</button></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</form:form>
	</div>
	<script type="text/javascript">
		$("#firstname").change(function() {
			setIndexName();
		});
		$("#middlename").change(function() {
			setIndexName();
		});
		$("#lastname").change(function() {
			setIndexName();
		});
		$("#entitytype").change(function() {
			entityType();
		});
		$('#businessname').change(function() {
			setIndexName();
		});
		$('#indexName').change(function() {
			$("#indexName").prop('disabled', true);
			setIndexName();
		});
		function entityType() {
			var type = $('#entitytype').val();
			if (type == 'Individual') {
				$('#non-business').show();
				$('#dob').show();
				$('#business').hide();
			} else if (type == 'Business') {
				$('#business').show();
				$('#dob').hide();
				$('#non-business').hide();
			} else {
				$('#business').hide();
				$('#dob').hide();
				$('#non-business').hide();
			}
		}
		function setIndexName() {
			var firstName = $('#firstname').val();
			var middleName = $('#middlename').val();
			var lastName = $('#lastname').val();
			var businessName = $('#businessname').val();
			var type = $('#entitytype').val();
			var indexName = $('#indexName').val();
			if (indexName == "") {
				if (type == 'Individual') {
					if (firstName != '' && middleName != '' && lastName != '')
						indexName = firstName + ',' + middleName + ','
								+ lastName;
					else if (firstName != '' && lastName != '')
						indexName = firstName + ',' + lastName;
				} else if (type == 'Business') {
					indexName = businessName;
				}
			}

			$('#indexName').val(indexName);
		}
		$("#editbutton")
				.click(
						function() {
							var indexName = $('#indexName').val();
							$("#indexName")
									.replaceWith(
											"<input type='text' class='form-control' id='indexName'></input>");
							$("#indexName").val(indexName);
						});
		$(document).ready(function() {
			setIndexName();
			entityType();
		});
	</script>
</body>
</html>
