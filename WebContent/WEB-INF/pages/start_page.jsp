<%@page contentType="text/html" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<template:genericpage title="DaPaas Public Portal">

	<jsp:attribute name="search">
		<input type="text" id="search" value="search"
			onfocus="if (this.value == this.defaultValue) this.value = ''"
			onblur="if(this.value=='') this.value = this.defaultValue">
	</jsp:attribute>
	<jsp:attribute name="navbar">
		<nav>
			<ul>
				<li><a href="register.jsp">Sign up</a></li>
				<li><a href="register.jsp">Login</a></li>
				<li><a href="publisher_asset.jsp">Publisher</a></li>
				<li><a href="contact.jsp">Contact</a></li>
			</ul>
		</nav>
	</jsp:attribute>

	<jsp:body>	
	
		<c:if test="${!empty googlePlusUser}">
			<div class="auth-display-img">
				<img src='${googlePlusUser.profilePicLink}' />
			</div>
			<div class="auth-display-name">${googlePlusUser.fullname}</div>
			<br />
			<br />
			<div class="auth-info">
				<br /><br /> 
				<b>Email: </b>${googlePlusUser.email}
				<br />										
			</div>
			<c:remove var="googlePlusUser" scope="session" />
		</c:if>
		<c:if test="${!empty facebookUser}">
			<div class="auth-display-img">
				<img src='${facebookUser.profilePicLink}' />
			</div>
			<div class="auth-display-name">${facebookUser.firstname} ${facebookUser.lastname}</div>
			<br />
			<br />
			<div class="auth-info">
				<br /><br /> 
				<b>Email: </b>${facebookUser.email}
				<br />										
			</div>
			<c:remove var="facebookUser" scope="session" />
		</c:if>
		
		<div class="tblwrap">
			<h2 class="table-label">Latest datasets</h2>
			<template:table col1="Dataset" col2="User" col3="Published"
					col4="Portal" />
		</div>
		<div class="tblwrap2">
			<h2 class="table-label">Popular datasets</h2>
			<template:table col1="Dataset" col2="User" col3="Published"
					col4="Portal" />
		</div>
		<div class="tblwrap">
			<h2 class="table-label">Query datasets</h2>
			<textarea class="query-text" placeholder="Prefix dapaas: <http:&#92&#92DaPaas.eu&#92resources&#92>"></textarea>
			<input type="button" value="Execute" class="but-wrapper execute">
		</div>
		<div class="tblwrap2">
			<!-- <div class="empty"></div> -->
			<template:usertable />
		</div>
    </jsp:body>
</template:genericpage>