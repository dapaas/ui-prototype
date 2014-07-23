var timeLine = this || {};

timeLine = (function() {
	"use strict";
	function createTimeLine(data) {
		// sort data by album name
		var newData = common.sortByAlbumName(data), sortByTime = common
				.createNewArray(newData).sort(function(a, b) {
					return b.Date - a.Date;
				}).slice(0, 19);

		// itemHeight = trackHeight * 0.8;
		var width = config.dimensions.width + 50,
			height = config.dimensions.height + config.dimensions.margin.bottom,
			trackOffset = 3, 
			trackHeight = Math.min((height - trackOffset) / sortByTime.length, 20), 
			itemHeight = 300,
			albumDate = 0,
			count = 0;

		// creating timeline svg
		var timeLineSvg = common.createSVG(config.dimensions,
				config.CSS.IDs.timeline);
		
		d3.selectAll("#timeline > svg > g").attr("transform", "translate(0, 0)");
		
		var yScale = function(album) {
			if (albumDate === album.Date) {
				count++;
				albumDate = album.Date;
				return (trackHeight * trackOffset * count);
			}
			count = 0;
			albumDate = album.Date;
			return trackOffset;

		};

		timeLineSvg.append("clipPath").attr("id", "chart-area").append("rect").attr("width", width).attr("height", height);

		function getDate(d) {
			return d3.time.format("%Y").parse(d.Date.toString());
		}

		var domain = d3.extent(sortByTime, function(d) {
			return getDate(d);
		});		

		var chart = timeLineSvg.append("g").attr("class", "chart").attr("clip-path", "url(#chart-area)");

		var band = chart.append("g").attr("id", "bandId").attr("transform", "translate(0, 0)");
		var xScale = d3.time.scale().domain(domain).range([ 0, width * 2 ]);

		var axis = d3.svg.axis().scale(xScale).orient("bottom").ticks(20).tickSize(-height, 0, 0);

		chart.append("g").attr("class", "axis").attr("transform",
				"translate(0," + config.dimensions.height + ")").call(axis);

		band.append("rect").attr("class", "band").attr("width",
				width + 100).attr("height", height);

		var items = band.selectAll("g").data(sortByTime).enter().append("svg")
				.attr("y", function(d) {
					return yScale(d);
				});

		draw();

		var instants = d3.select("#bandId").selectAll("svg");
		instants.append("circle").attr("cx", itemHeight / 20).attr("cy",
				itemHeight / 20).attr("r", 5).style("fill", "green").attr(
				"class", "clickAlb");
		instants.append("text").attr("class", "instantLabel").attr("x", 25)
				.attr("y", 20).text(function(d) {
					return d.Song;
				});

		band.call(d3.behavior.zoom().x(xScale).scaleExtent([ 1, 0 ]).on("zoom",
				draw));

		function draw() {
			chart.selectAll("g.axis").call(axis);
			items.attr("x", function(d) {
				return xScale(getDate(d));
			});
			d3.selectAll(".timeTooltip").style("visibility", "hidden");
		}
		common.clickTimeLine(timeLineSvg, "circle");
	}

	return {
		init : createTimeLine
	};
}());