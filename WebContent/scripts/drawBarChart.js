var drawBarChart = this || {};

/* */
drawBarChart = (function() {
	"use strict";
	function createChart(data) {

		// sort data by album name
		var newData = common.sortByAlbumName(data),
		// sort by new count key and slice the first 15
		sortByCount = common.createNewArray(newData).sort(function(a, b) {
			return d3.descending(a.Count, b.Count);
		}).slice(0, 14);

		var x = d3.scale.ordinal().rangeRoundBands([ 0, config.dimensions.width ], 0.1),
			y = d3.scale.linear().range([ config.dimensions.height, 0 ]),
			xAxis = d3.svg.axis().scale(x).orient(config.axis.bottom),
			yAxis = d3.svg.axis().scale(y).orient(config.axis.left),
			colorScale = d3.scale.linear().domain(sortByCount.map(function(d) {
				return d.Song;
			})).range(['yellow', 'green']);

		x.domain(sortByCount.map(function(d) {
			return d.Song;
		}));
		y.domain([ 1, d3.max(sortByCount, function(d) {
			return d.Count;
		}) ]);

		var svg = common.createSVG(config.dimensions, config.CSS.IDs.barChart);
		var enter_duration = 2000;

		// appending x and y axis
		svg.append(config.CSS.el.g).attr(config.attr.classAtr,
				config.CSS.classes.xAxis).attr(
				config.attr.transform,
				config.attr.translate + config.dimensions.height
						+ config.attr.close).call(xAxis);
		svg.append(config.CSS.el.g).attr(config.attr.classAtr,
				config.CSS.classes.yAxis).call(yAxis)
				.append(config.CSS.el.text).attr(config.attr.transform,
						config.attr.rotate90).attr(config.axis.y, 6).attr(
						config.axis.dy, config.values.dyVal).style(
						config.attr.textAnchor, config.attr.end).text(
						config.values.yText);

		// appending rect bars to svg
		svg.selectAll(config.CSS.classes.bar).data(sortByCount).enter().append(
				config.CSS.el.rect).attr(config.attr.classAtr,
				config.CSS.classes.bar).attr(config.axis.x, function(d) {
			return x(d.Song);
		}).attr(config.attr.width, x.rangeBand()).attr(config.axis.y,
				config.dimensions.height).transition().duration(6000).delay(
				function(d, i) {
					return (i / sortByCount.length) * enter_duration;
				}).attr(config.attr.height, function(d) {
			return config.dimensions.height - y(d.Count);
		}).attr(config.axis.y, function(d) {
			return y(d.Count);
		}).attr(config.attr.fill, function(d) {
			return config.attr.rgb + d.Count + ", " + (d.Count * 15)
			+ "," + (d.Count * 25) + config.attr.close;
		});

		// appending tooltip to bar chart
		common.chartMouseEvent(svg, config.values.barClass);
		// click handler
		common.chartClick(svg, config.values.barClass);
	}
	return {
		init : createChart
	};
}());