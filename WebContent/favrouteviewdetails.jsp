<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Route Details</title>
<style type="text/css">
th, td {
	text-align: center;
}
</style>
<link href="${contextPath}/resources/css/viewdetails.css"
	rel="stylesheet">
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
<script type="text/javascript">
	/* function alertfavourite(){
	 var status=document.getElementById("status").value
	 if(status){
	 alert("It is already yours favourite")
	 }
	 } */
	$(document).ready(function() {
		var status = $("#status").val()
		if (status) {
			alert("It is already yours favourite")
		}
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
	<input type="hidden" id="status" value="${status}">
	<br>
	<div id="body">
		<div id="divleft">
			<img alt="" src="${contextPath}/images/${route.path}" id="image">
		</div>
		<div id="divright">
			<div id="right">
				<h3>Route:</h3>
				<Label><b>Name:</b></Label>&nbsp;${route.routename}<br> <Label><b>Category
						:&nbsp;</b></Label>${route.category}<br> <label><i
					class="fa fa-map-pin" style="color: blue;"></i>&nbsp;${route.fromaddress}</label>&nbsp;
				to &nbsp;<label><i class="fa fa-map-pin" style="color: red;"></i>&nbsp;${route.toaddress}</label><br>
				<Label><b>Description:</b>&nbsp;</Label>${route.rdescription}<br>
				<Label><b>Created By:</b>&nbsp;</Label>${route.user}<br> <br>
				<h3>Interesting Place:</h3>
				<Label><b>Name:&nbsp;</b></Label>${route.iname}<br> <label>
					<i class='fa fa-map-marker' style="color: lime;"></i>&nbsp;${route.ilocation}
				</label><br> <Label><b>Description:&nbsp;</b></Label>${route.idescription}<br>
				<br>
			</div>
		</div>
	</div>
</body>
</html>