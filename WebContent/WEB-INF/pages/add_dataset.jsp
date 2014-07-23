<%@page contentType="text/html" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@taglib prefix="template" tagdir="/WEB-INF/tags"%>

<template:genericpage title="DaPaas Publisher portal">
	<jsp:body>
		<div class="left-container">
			<h2 class="table-label">Step 1: Dataset properties</h2>
			<div class="ds-name-container">
				<div class="ds-input-wrapper">
					<label for="ds-name">Dataset name</label>
					<input type="text" id="ds-name">
				</div>
				<div class="ds-input-wrapper">
					<label for="description">Description</label>
					<input type="text" id="description">
				</div>
				<div class="ds-input-wrapper">
					<label for="source">Source</label>
					<input type="text" id="source">
				</div>
				<div class="ds-input-wrapper">
					<label for="publisher">Publisher</label>
					<input type="text" id="publisher">
				</div>
			</div>
			<!-- <div class="div"></div> -->
			<h2 class="table-label">Step 2a: Upload your data</h2>
			<div class="div"></div>
			
			<p>Publisher can upload various types of data format, 
			<strong>CSV, XLS, XLSX, PDF, RFD,</strong> etc.</p>
			<div class="upload">
				<h4>Upload data</h4>
				<div class="ds-input-wrapper">
					<label for="ds-file">Select file</label>
					<input type="text" id="ds-file">
					<input type="button" value="Browse" class="file-btn">
					<input type="button" value="Upload" class="file-btn">
				</div>
			</div>
			
			<div class="upload">
				<h4>Or select public data to clone into DaPaaS</h4>
				<div class="ds-input-wrapper">
					<label for="ds-file">Enter URI</label>
					<input type="text" id="ds-file">
					<input type="button" value="Clone" id="clone">
				</div>
			</div>
		</div>
		<div class="right-container">
			<div class="div"></div>
			<div class="div"></div>
			<div class="ds-name-container">
				<!-- <div class="div"></div> -->
				<div class="div"></div>
				<div class="ds-input-wrapper">
					<label for="ds-name">Dataset name</label>
					<input type="text" id="ds-name">
				</div>
				<div class="ds-input-wrapper">
					<label for="description">Description</label>
					<input type="text" id="description">
				</div>
				<div class="ds-input-wrapper">
					<label for="source">Source</label>
					<input type="text" id="source">
				</div>
				<div class="ds-input-wrapper">
					<label for="publisher">Publisher</label>
					<input type="text" id="publisher">
				</div>
			</div>
			<!-- <div class="div"></div> -->
			<h2 class="table-label">Step 2b: Data mapping</h2>
			<div class="div"></div>
			<p>If the data requires additional metadata, such as RDF mapping, 
				it should be provided on the second step.
				 The server should determine whether additional metadata is needed 
				 or user can be load directly to the next step.</p>
			 <div class="upload">
				<h4>Upload metadata</h4>
				<div class="ds-input-wrapper">
					<label for="ds-file">Select file</label>
					<input type="text" id="ds-file">
					<input type="button" value="Browse" class="file-btn">
					<input type="button" value="Upload" class="file-btn">
				</div>
			</div>
			<div class="upload">
				<h4>Or select from the web</h4>
				<div class="ds-input-wrapper">
					<label for="ds-file">Enter URI</label>
					<input type="text" id="ds-file">
					<input type="button" value="Clone" id="clone">
				</div>
			</div>
		</div>
		<input type="button" value="Next >>" class="next-btn"
				onclick="location.href='explore_data.jsp'">
	</jsp:body>
</template:genericpage>