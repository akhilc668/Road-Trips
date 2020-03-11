<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Search Routes</title>
<style type="text/css">
thead, td {
	text-align: center;
}

img {
	height: 50px;
	width: 50px
}
</style>
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
<link href="${contextPath}/resources/css/slidebar.css" rel="stylesheet">
<script src="${contextPath}/resources/js/slidebar.js"></script>
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
<link href="${contextPath}/resources/css/map.css" rel="stylesheet">
<script src="${contextPath}/resources/js/map.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwMX-37iZeDFy6S8Lk8Y0Nfu5b6fhlFc8&libraries=places"
	type="text/javascript"></script>
<style type="text/css">
#divleft {
	background-color: white;
	float: left;
	width: 45%;
	height: 100%;
	border-radius: 10px;
}

#divright {
	background-color: white;
	float: right;
	width: 50%;
	height: 100%;
	border-radius: 10px;
}
</style>
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
	<br>
	<div align="center">
		<input type="text" name="from" id="from" placeholder="from"
			style="height: 35px; width: 200px; border-radius: 10px;" />&nbsp;&nbsp;
		<input type="text" name="to" id="to" placeholder="to"
			style="height: 35px; width: 200px; border-radius: 10px;" />&nbsp;&nbsp;
		<select name="category" style="height: 35px; width: 150px;" id="type">
			<option value="nul">Select Category</option>
			<option value="All Categories">All Categories</option>
			<option value="By Car">By Car</option>
			<option value="On foot">On foot</option>
			<option value="Public Transport">Public Transport</option>
		</select>&nbsp;&nbsp; <input type="submit" class="btn btn-primary"
			value="Search"
			style="height: 35px; width: 100px; border-radius: 5px;" id="change">
	</div>
	<br>
	<div id="divright">
		<div id="map"></div>
	</div>
	<br>
	<div id="divleft">
		<table class="table table-hover table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>Image</th>
					<th>Route Name</th>
					<th>Details</th>
				</tr>
			</thead>
			<tbody id="tbody">
			
			
			<c:forEach items="${rlist}" var="obj">
				<tr>
					<td><img alt="" src="${contextPath}/images/${obj.path}"
						style="height: 50px; width: 50px"></td>
					<td>${obj.routename}</td>
					<td><a href="${contextPath}/routesById/${obj.id}"
						class="btn btn-primary">View</a></td>
				</tr>
			</c:forEach>
			
			</tbody>

		</table>
	</div>
	<br>
</body>
</html>