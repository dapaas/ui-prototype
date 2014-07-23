<%@page contentType="text/html" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@taglib prefix="template" tagdir="/WEB-INF/tags"%>

<template:genericpage title="Data Driven portal">

	<jsp:attribute name="search">
		<div class="feedback">
			<label for="feedback">Please rate us</label>
			<input name="star1" type="radio" class="hover-star" value="1"
				title="Very Poor" /> 
			<input name="star1" type="radio" class="hover-star" value="2"
				title="Poor" />
			<input name="star1" type="radio" class="hover-star" value="3"
				title="Ok" /> 
			<input name="star1" type="radio" class="hover-star" value="4"
				title="Good" /> 
			<input name="star1" type="radio" class="hover-star" value="5"
				title="Very Good" />
			<span id="feedback-rate"></span>
		</div>
	</jsp:attribute>

	<jsp:attribute name="navbar">
		<nav class="dp-nav">
			<ul>
				<li><a href="">Clone to my assets</a></li>
				<li><a href="">Subscribe to notifications</a></li>
				<li><a id="opp">Query</a></li>
				<li><a href="">Export</a></li>
			</ul>
			<div id="dialog-form" class="dialog">
			  <form>
			    <textarea name="name" id="name" class="query"></textarea>
			    <input type="button" value="Execute query"
						class="execute dialog-but">
			  </form>
			</div>
		</nav>
	</jsp:attribute>

	<jsp:body>	
		<h2>Releases</h2>
		<div id="container"></div>
		<h2>Bar chart</h2>
		<div id="chart"></div>
		<h2>Line chart</h2>
		<div id="line"></div>
		<h2>Map</h2>
		<div id="map"></div>
		<h2>Google map</h2>
		<div id='map_canvas'></div>
		<h2>Timeline</h2>
		<div id="timeline"></div>
		<script type="text/javascript"
				src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
		<script type="text/javascript" src="scripts/LAB.min.js"></script>
		<script>
			$LAB.script("http://d3js.org/topojson.v1.min.js").wait().script(
					"http://d3js.org/d3.v3.min.js").wait().script(
					"scripts/common.js").wait().script("scripts/properties.js")
					.wait().script("scripts/drawTable.js").wait().script(
							"scripts/drawLineChart.js").wait().script(
							"scripts/drawBarChart.js").wait().script(
							"scripts/drawMaps.js").wait().script(
							"scripts/drawTimeLine.js").wait().script(
							"scripts/main.js").wait(function() {
						console.log("Everything is loaded!");
					});
		</script>
	<!-- .script(
				"https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.js")
				.wait() -->
	</jsp:body>
</template:genericpage>