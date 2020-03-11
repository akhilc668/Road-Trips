<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Blog</title>
<%-- <link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet"> --%>
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
</head>
<body>
	<div class="container-fluid" style="height: 75px;">
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			<nav class="navbar navbar-expand-sm bg-secondary"
				style="height: 75px;">
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
		<img alt="" src="${contextPath}/images/charminar.jpg"
			style="width: 1000px; height: 400px"><br> <br>

		<p style="width: 1000px;" align="justify">The Charminar,
			constructed in 1591, is a monument and mosque located in Hyderabad,
			Telangana, India. The landmark has become known globally as a symbol
			of Hyderabad and is listed among the most recognized structures in
			India. The Charminar's long history includes the existence of a
			mosque on its top floor for more than 400 years. While both
			historically and religiously significant, it is also known for its
			popular and busy local markets surrounding the structure, and has
			become one of the most frequented tourist attractions in Hyderabad.
			Charminar is also a site of numerous festival celebrations, such as
			Eid-ul-adha and Eid-ul-fitr.</p>
	</div>
	<br>
	<div align="center">
		<img alt="" src="${contextPath}/images/cubbonpark1.jpg"
			style="width: 1000px; height: 400px"><br> <br>

		<p style="width: 1000px;" align="justify">Cubbon Park, officially
			called Sri Chamarajendra Park is a landmark 'lung' area of Bengaluru
			city, located (12.97°N 77.6°E) within the heart of the city in the
			Central Administrative Area. Originally created in 1870, when Major
			General Richard Sankey was the then British Chief Engineer of Mysore
			state, it covered an area of 100 acres (0.40 km2) and subsequent
			expansion has taken place and the area reported now is about 300
			acres (1.2 km2).It has a rich recorded history of abundant flora and
			fauna plantations coupled with numerous impressive and aesthetically
			located buildings and statues of famous personages, in its precincts.</p>
	</div>
	<br>
	<div align="center">
		<img alt="" src="${contextPath}/images/ArignarZoologicalPark.jpg"
			style="width: 1000px; height: 400px"><br> <br>

		<p style="width: 1000px;" align="justify">Arignar Anna Zoological
			Park (abbreviated AAZP), also known as the Vandalur Zoo, is a
			zoological garden located in Vandalur, is in the southwestern part of
			Chennai, Tamil Nadu, about 31 kilometres (19 mi) from the Chennai
			Central and 15 kilometres (9.3 mi) from Chennai Airport. Established
			in 1855, it is the first public zoo in India. It is affiliated with
			the Central Zoo Authority of India. Spread over an area of 602
			hectares (1,490 acres), including a 92.45-hectare (228.4-acre) rescue
			and rehabilitation centre, the park is the largest zoological park in
			India. The zoo houses 2,553 species of flora and fauna across 1,265
			acres (512 ha). As of 2012 the park houses around 1,500 wild species,
			including 46 endangered species, in its 160 enclosures. As of 2010,
			there were about 47 species of mammals, 63 species of birds, 31
			species of reptiles, 5 species of amphibians, 28 species of fishes,
			and 10 species of insects in the park. The park, with an objective to
			be a repository of the state's fauna, is credited with being the
			second wildlife sanctuary in Tamil Nadu after Mudumalai National
			Park.</p>
	</div>
</body>
</html>
