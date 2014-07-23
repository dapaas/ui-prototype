var drawLineChart = this || {};

drawLineChart = (function() {
	"use strict";
	function createChart(data) {
		// copy data into new array for sorting data
		var newData = common.sortByAlbumName(data),
		// sorted by new time key
		sortByTime = common.createNewArray(newData).sort(function(a, b) {
			return b.Time - a.Time;
		}).slice(0, 19);

		sortByTime.forEach(function(d) {
			d.Time = +d.Time;
		});

		// creating line chart svg
		var lineChartSvg = common.createSVG(config.dimensions,
				config.CSS.IDs.lineChart);

		var xLine = d3.scale.ordinal().rangePoints([ 0, config.dimensions.width ]),
			yLine = d3.scale.linear().range([ config.dimensions.height, 0 ]), 
			xLineAxis = d3.svg.axis().scale(xLine).orient(config.axis.bottom).tickSize(-config.dimensions.height, 0, 0), 
			yLineAxis = d3.svg.axis().scale(yLine).orient(config.axis.left).tickSize(-config.dimensions.width, 0, 0).tickFormat(d3.format(',.2s'));

		xLine.domain(sortByTime.map(function(d) {
			return d.Song;
		}));
		yLine.domain(d3.extent(sortByTime, function(d) {
			return d.Time;
		}));

		var line = d3.svg.line().x(function(d) {
			return xLine(d.Song);
		}).y(function(d) {
			return yLine(d.Time);
		});
		
		var enter_duration = 300;

		lineChartSvg.append(config.CSS.el.g).attr(config.attr.classAtr,
				config.CSS.classes.xLaxis).attr(
				config.attr.transform,
				config.attr.translate + config.dimensions.height
						+ config.attr.close).call(xLineAxis);
		
		lineChartSvg.selectAll(".tick text").attr("x", "-30").style(
				config.attr.textAnchor, config.attr.start);

		lineChartSvg.append(config.CSS.el.g).attr(config.attr.classAtr,
				config.CSS.classes.yLaxis).call(yLineAxis).append(
				config.CSS.el.text).attr(config.attr.transform,
				config.attr.rotate90).attr(config.axis.yL, 6).attr(
				config.axis.dyL, config.values.dyLval).style(
				config.attr.textAnchor, config.attr.end).text(
				config.values.yLtext);

		var path = lineChartSvg.append(config.CSS.el.path).datum(sortByTime).attr(
				config.attr.classAtr, config.CSS.classes.line).attr(config.attr.d, line).attr("fill", "none");
					
		var totalLength = path.node().getTotalLength();

		path.attr("stroke-dasharray", totalLength + " " + totalLength)
				  .attr("stroke-dashoffset", totalLength)
				  .transition()
				    .duration(5000)
				    .ease("linear")
				    .attr("stroke-dashoffset", 0);

		lineChartSvg.selectAll(config.CSS.el.circle).data(sortByTime)
				.enter().append(config.CSS.el.circle).attr(
						config.attr.classAtr, config.CSS.el.circle);

		d3.selectAll(".circle").attr(config.axis.cy,
				function(d) {
					return yLine(d.Time);
				}).attr(config.axis.cx, function(d) {
			return xLine(d.Song);
		});
		
		lineChartSvg.selectAll(config.CSS.el.circle).transition().delay(function(d, i) {
			return i * enter_duration;
		}).attr(config.attr.r, 5);

		// appending tooltip to bar chart
		common.chartMouseEvent(lineChartSvg, config.CSS.el.circle);

		// add click listener to linechart
		common.chartClick(lineChartSvg, config.CSS.el.circle);
	}
	return {
		init : createChart
	};
}());