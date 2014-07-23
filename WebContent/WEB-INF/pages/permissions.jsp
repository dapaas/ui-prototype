<%@page contentType="text/html" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@taglib prefix="template" tagdir="/WEB-INF/tags"%>

<template:genericpage title="DaPaas Public portal">
	<jsp:body>
		<h2>Step 5: Permissions</h2>
		<div class="permissions-container">
			<h3>Dataset type</h3>
			<input type="radio" name="type" value="open data" class="role-radio"
					id="op">
	    	<label for="op" class="radio-group-label">Open data - everyone can read, changes are moderated</label>
	    		
	    	<input type="radio" name="type" value="private data"
					class="role-radio" id="pd">
	    	<label for="pd" class="radio-group-label">Private data, only these users can read and modify data (modify is not moderated)</label>
	    	<textarea rows="4" cols="25" style="resize: none">user1@dapaas.eu user2@dapaas.eu user3@dapaas.eu</textarea>
		</div>
		<h2>Step 6: Portal</h2>
		<div class="portal-settings">
			<div class="portal-row">
				<label>URL</label>
				<span>Http://</span><input type="text"><span>.DaPaaS.eu</span>
			</div>
			<div class="portal-row">
				<label>Content</label>
				<div class="select-group">
					<div class="select-option">
						<select >
							<option selected="selected">tabular view</option>
							<option>pie chart</option>
							<option>line chart</option>
						</select>
						<input type="button" value="Configure" class="conf">
					</div>
					<div class="select-option">
						<select>
							<option>tabular view</option>
							<option selected="selected">pie chart</option>
							<option>line chart</option>
						</select>
						<input type="button" value="Configure" class="conf">
					</div>
					<div class="select-option">
						<select>
							<option>tabular view</option>
							<option>pie chart</option>
							<option selected="selected">line chart</option>
						</select>
						<input type="button" value="Configure" class="conf">
					</div>
					<div class="select-option">
						<a href="">add new content element</a>
					</div>
				</div>
			</div>
		</div>
		
		<input type="button" value="Publish" class="publish-btn" onclick="location.href='publisher_asset.jsp'">
	</jsp:body>
</template:genericpage>