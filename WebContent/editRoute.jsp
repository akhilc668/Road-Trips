<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html lang="en">
<head>
<%@ page isELIgnored="false"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Route</title>
<link href="${contextPath}/resources/css/slidebar.css" rel="stylesheet">
<script src="${contextPath}/resources/js/slidebar.js"></script>
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	$(document).ready(
			function() {
				$(".custom-file-input").on(
						"change",
						function() {
							var fileName = $(this).val().split("\\").pop();
							$(this).siblings(".custom-file-label").addClass(
									"selected").html(fileName);
						});
			});
</script>
</head>
<body>
	<div class="container-fluid" style="height: 75px;">
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			<nav class="navbar navbar-expand-sm bg-secondary"
				style="height: 75px">
				<div id="mySidebar" class="sidebar">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<h3>Routes</h3>
					<a
						href="${contextPath}/routesByUser/${pageContext.request.userPrincipal.name}"><i
						class="fa fa-road"></i>My routes </a> <a
						href="${contextPath}/favourite/${pageContext.request.userPrincipal.name}"><i
						class="fa fa-heart-o"></i>My Favourite <i class="fa fa-road"></i></a>
					<a
						href="${contextPath}/new-Route/${pageContext.request.userPrincipal.name}"><i
						class="fa fa-plus"></i> Add Route </a>
					<h3>User</h3>
					<a
						href="${contextPath}/userByName/${pageContext.request.userPrincipal.name}"><i
						class="fa fa-vcard-o"></i>My Profile</a>
				</div>

				<div id="main">
					<button class="openbtn" onclick="openNav()">&#9776;</button>
				</div>
				<ul class="navbar-nav">
					<a href="${contextPath}/welcome"><img
						src="${contextPath}/images/logo.png" alt=""
						style="height: 65px; width: 80px;" /></a>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="${contextPath}/blog.jsp"
						style="color: #ef7207"><i class="fa fa-file-text"></i> Blog</a></li>&nbsp;&nbsp;&nbsp;
					<li class="nav-item"><a href="${contextPath}/feedback.jsp"
						style="color: #ef7207"><i class="fa fa-comment"></i> Feedback</a></li>&nbsp;&nbsp;&nbsp;
					<li class="nav-item"><a href="${contextPath}/search"
						style="color: #ef7207"><i class="fa fa-map"></i> Search On Map</a></li>&nbsp;&nbsp;&nbsp;
					<li class="nav-item active"><a href="${contextPath}/welcome"
						style="color: #ef7207"><i class="fa fa-home"></i> Home</a></li>&nbsp;&nbsp;&nbsp;
					<li class="nav-item"><a
						href="${contextPath}/new-Route/${pageContext.request.userPrincipal.name}"
						style="color: #ef7207"><i class="fa fa-plus"></i> Add Route </a></li>&nbsp;&nbsp;&nbsp;
					<li class="nav-item" style="color: #ef7207"><i
						class="fa fa-user"></i> ${pageContext.request.userPrincipal.name}</li>&nbsp;&nbsp;&nbsp;
					<li class="nav-item" style="color: #ef7207"><a
						onclick="document.forms['logoutForm'].submit()"><i
							class="fa fa-sign-out"></i> Logout</a></li>&nbsp;
				</ul>
			</nav>
		</c:if>
	</div>
	<div>
		<h2 align="center">Update Route</h2>
		<div>
			<div>
				<form
					action="${contextPath}/updateRoute/${route.id}?${_csrf.parameterName}=${_csrf.token}"
					method="post" enctype="multipart/form-data">
					<div align="center">
						<div class="form-group">
							<label>Route Name:</label> <input type="text" name="routename"
								class="form-control" value="${route.routename}"
								required="required" style="width: 50%;" readonly="readonly" />
						</div>
						<div class="form-group">
							<label>Category:</label> <select name="category"
								class="form-control" required="required" style="width: 50%;">
								<option value="All Categories">All Categories</option>
								<option value="By Car">By Car</option>
								<option value="On Foot">On Foot</option>
								<option value="Public Transport">Public Transport</option>
							</select>
						</div>
						<div class="form-group">
							<label>Keywords:</label> <input type="text" name="keyword"
								value="${route.keyword}" class="form-control"
								required="required" style="width: 50%;" />
						</div>
						<div class="form-group">
							<label>Description:</label>
							<textarea id="rdescription" name="rdescription"
								class="form-control" required="required" style="width: 50%;">${route.rdescription}</textarea>
						</div>
						<div class="form-group">
							<label>From :</label> <input type="text" name="fromaddress"
								value="${route.fromaddress}" class="form-control"
								required="required" style="width: 50%;" />
						</div>
						<div class="form-group">
							<label>To :</label> <input type="text" name="toaddress"
								value="${route.toaddress}" class="form-control"
								required="required" style="width: 50%;" />
						</div>
						<div>
							<h3>Interesting place</h3>
						</div>
						<div class="form-group">
							<label>Location:</label> <input type="text" name="ilocation"
								value="${route.ilocation}" class="form-control"
								required="required" style="width: 50%;" />
						</div>
						<div class="form-group">
							<label>Name:</label> <input type="text" name="iname"
								value="${route.iname}" class="form-control" required="required"
								style="width: 50%;" />
						</div>
						<div class="form-group">
							<label>Description:</label>
							<textarea name="idescription" class="form-control"
								required="required" style="width: 50%;">${route.idescription}</textarea>
						</div>

						<label>Image:</label>
						<div class="custom-file" style="margin-left: 350px;">
							<img src="${contextPath}/images/${route.path}" alt=""
								class="rounded-circle" style="height: 80px; width: 80px;" /> <input
								type="file" required="required" name="file">
						</div>

						<div>
							<input type="hidden" value="${route.user}" name="user" />
						</div>
					</div>
					<br>
					<div align="center">
						<div>
							<input type="submit" value="Update Route" class="btn btn-primary">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>