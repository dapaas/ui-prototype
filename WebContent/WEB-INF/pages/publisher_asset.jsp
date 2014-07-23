<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="template" tagdir="/WEB-INF/tags"%>

<template:genericpage title="DaPaas Publisher portal">
	<jsp:attribute name="navbar">
		<nav class="publish-navbar">
			<ul>
				<li><a href="publisher_asset.jsp">Manage my assets</a></li>
				<li><a href="add_dataset.jsp">Add new dataset</a></li>
				<li><a href="start_page.jsp">Browse public catalogs</a></li>
			</ul>
		</nav>
	</jsp:attribute>
	<jsp:body>
		<div class="dataset-wrapper">
			<div class="search dataset-search">
			<div class="datepicker"><span class="picker-text">from</span> <input type="text" id="datepicker-from"><span class="picker-image"></span> <span class="picker-text">to</span> <input type="text" id="datepicker-to"><span class="picker-image"></span></div>
			<input type="text" id="search" value="search"
							onfocus="if (this.value == this.defaultValue) this.value = ''"
							onblur="if(this.value=='') this.value = this.defaultValue">
			</div>
			<h2 class="table-label">My dataset catalog</h2>
			<template:dataset_catalog />
		</div>
		<div class="dataset-wrapper">
			<h2 class="table-label">Datasets shared with me</h2>
			<template:dataset_catalog />
		</div>
	</jsp:body>
</template:genericpage>