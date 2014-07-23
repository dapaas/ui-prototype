var drawTable = this || {};

drawTable = (function() {
	"use strict";
	function createTable(data) {

		// table properties
		var columns = d3.keys(data[0]);
		var itemNumber = 5;
		var page = 1;
		var table = d3.select("#container").append("table"), thead = table
				.append("thead"), tbody = table.append("tbody"), tfoot = thead
				.append("tr").attr("class", "nav");

		thead.append("tr").selectAll("th").data(columns).enter().append(
				"th").append("div").attr("class", "thead").text(
				function(col) {
					return col;
				});

		//.attr("value", "previous")
		// table pagination buttons
		var buttonWrapper = tfoot.append("div").attr("class", "wrapper");
		var prev = buttonWrapper.append("input").attr("type", "button")
				.attr("id", "previous").attr(
						"disabled", true);
		var pageIndex = buttonWrapper.append("span").attr("class", "index");
		var next = buttonWrapper.append("input").attr("type", "button")
				.attr("id", "next");
		var nextBut = function(shownData) {
			d3.select("#next").on("click", function() {
				page++;
				var max = Math.ceil(shownData.length / itemNumber);
				prev.attr("disabled", null);
				if (page === max) {
					next.attr("disabled", true);
				} else {
					next.attr("disabled", null);
				}
				showPage(shownData);
				drawPage(shownData);
			});
		};

		var prevBut = function(shownData) {
			d3.select("#previous").on("click", function() {
				page--;
				next.attr("disabled", null);
				if (page === 1) {
					prev.attr("disabled", true);
				} else {
					prev.attr("disabled", null);
				}
				showPage(shownData);
				drawPage(shownData);
			});
		};
		
		tfoot.append("div").attr("class", "filterWrapper");
		var filter = tfoot.append("div").attr("class", "filterWrapper");
		filter.append("label").text("Filter").attr("class", "filterLabel");
		filter.append("input").attr("class", "filter");

		// shows page index
		var showPage = function(all) {
			return pageIndex.text( page + " / "
					+ Math.ceil(all.length / itemNumber));
		};

		// initial table draw
		drawPage(data);

		// filtering table data
		d3.select(".filter").on("keyup", function() {
			var typed = this.value;
			page = 1;
			var filtered = data.filter(function(d) {
				if (d.Release.toLowerCase().indexOf(typed) != -1) {
					return d;
				}
			});
			drawPage(filtered);
		});

		// page drawing function
		function drawPage(tabledata) {

			// returns items per page
			var viewdata = function() {
				return tabledata.slice((page - 1) * itemNumber, page
						* itemNumber);
			};

			showPage(tabledata);
			prevBut(tabledata);
			nextBut(tabledata);

			// removing data of the previous page
			tbody.selectAll("tr").data([]).exit().remove();

			var rows = tbody.selectAll("tr").data(viewdata()).enter()
					.append("tr");
			rows.selectAll("td").data(function(d) {
				return d3.values(d);
			}).enter().append("td").text(function(d) {
				return d;
			}).attr("class", "data");
		}
	}
	return {
		init : createTable
	};
}());