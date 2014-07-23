<%@page contentType="text/html" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@taglib prefix="template" tagdir="/WEB-INF/tags"%>

<template:genericpage title="DaPaas Publisher portal">
	<jsp:body>
		<h2 class="section-label">Step 4: Interlinking</h2>
		<div class="interlink-data-table">
			<h2 class="table-label">Available datasets</h2>
			<div class="search interlink-search">
				<input type="text" id="search" value="search"
					onfocus="if (this.value == this.defaultValue) this.value = ''"
					onblur="if(this.value=='') this.value = this.defaultValue">
			</div>
			<template:dataset_catalog />
		</div>
		
		<div>
			<h2 class="inter-data-label">My data</h2>
			<template:datatable />
			<input type="button" value="Next >>" class="next-btn" onclick="location.href='permissions.jsp'">
		</div>
	</jsp:body>
</template:genericpage>