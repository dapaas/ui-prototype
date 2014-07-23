$(function() {
	d3.csv("data/export.csv", draw);

	/*
	 * * Draw table, pagination and filter data, call topographic and google map
	 * draw functions
	 */

	function draw(data) {
		drawTable.init(data);
		drawBarChart.init(data);
		drawLineChart.init(data);
		drawMaps.topograph();
		drawMaps.google();
		timeLine.init(data);
	}
});