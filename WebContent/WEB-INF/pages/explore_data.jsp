<%@page contentType="text/html" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@taglib prefix="template" tagdir="/WEB-INF/tags"%>

<template:genericpage title="DaPaas Publisher portal">

	<jsp:body>
		<div class="tblwrap explore-query">
			<textarea class="query-text" placeholder="Prefix dapaas: <http:&#92&#92DaPaas.eu&#92resources&#92>"></textarea>
			<input type="button" value="Execute" class="butWrapper execute">
		</div>
		<div id="clear"></div>
		<div class="tblwrap2 explore">
			<h2 class="table-label">Step 3: Explore data</h2>
			<div class="search interlink-search">
				<input type="text" id="search" value="search"
					onfocus="if (this.value == this.defaultValue) this.value = ''"
					onblur="if(this.value=='') this.value = this.defaultValue">
			</div>
		</div>
		<template:datatable/>
		
		<input type="button" value="Next >>" class="next-btn" onclick="location.href='interlink.jsp'">
	</jsp:body>
</template:genericpage>