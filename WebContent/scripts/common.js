var common = this || {};

/*
 * Common functions used for counting duplicate albums and creating new dataset
 * with count field, sorting of native data by album name and click function for
 * bar and line charts
 */
common = (function() {
	"use strict";
	// counting songs in data array
	function createArray(dataset) {
		var lastItem = dataset[0].Release,
			count = 0,
			newArray = [],
			dataLength = dataset.length;
		for ( var i = 0; i < dataLength; i++) {
			if (dataset[i].Release != lastItem || i == dataset.length - 1) {
				newArray.push({
					Song : lastItem,
					Count : count,
					Time : dataset[i]["play time in minutes"],
					Date : Math.round(new Date().getFullYear() - (i*0.2)),
					Id: i
				});
				count = 0;
			}
			count++;
			lastItem = dataset[i].Release;
		}
		return newArray;
	}

	function sort(albumData) {
		// copy data into new array for sorting data
		var newData = albumData.slice();
		// sorted by song name
		newData.sort(function(a, b) {
			return d3.descending(a.Release.toLowerCase(), b.Release
					.toLowerCase());
		});
		return newData;
	}
	
	function sortByDate(data) {
		var arr = data.slice();
		arr.sort(function(a, b) {
			return d3.descending(a.Date, b.Date);
		});
		
		return arr;
	}
	// adding event listener click to bar chart
	function clickEvent(svgName, elName) {
		svgName.selectAll(elName)
				.on("click",
						function(d) {
							// var clickedBar = d3.select(this);
							var firstWord = d.Song.split(" ");
							var url = "http://musicbrainz.fluidops.net/resource/?literal=%2522"
									+ firstWord[0]
									+ "%2522%255E%255Ehttp%253A%252F%252Fwww.w3.org%252F2001%252FXMLSchema%2523string";
							window.location.href = url;
						});
	}
	// appending tooltip to bar chart
	function mouseEvent(svgName, elName) {
		var div = d3.select("body").append("div").attr("class", "tooltip")
				.style("opacity", 0);
		svgName.selectAll(elName)
				.on("mouseover",
						function(d) {
							div.transition().duration(200).style("opacity", .9);
							var text = (elName === ".bar") ? d.Song + "<br/>" + " recorded " + d.Count + " times." : (d3.select(this).transition().attr("r", 9), d.Song + "<br/>" + " lasts " + d.Time
									+ " mins."); 
							
							div.html(text).style("left",
									(d3.event.pageX) + "px").style("top",
									(d3.event.pageY - 50) + "px");
						}).on("mouseout", function(d) {
					(elName === "circle") ? d3.select(this).transition().attr("r", 5) : null;
					div.transition().duration(500).style("opacity", 0);
				});
	}
	
	function createSVG(dims, divName) {		
		var svg = d3.select(divName).append("svg").attr("width",
				dims.width + dims.margin.left + dims.margin.right)
				.attr("height", dims.height + dims.margin.top + dims.margin.bottom).append("g").attr(
						"transform", "translate(" + dims.margin.left + "," + dims.margin.top + ")");
		return svg;
	}
	
	function clickTimeLineEvent(svgName, elName) {
		var div = d3.select("body").append("div").attr("class", "timeTooltip"),
			el = null;
		svgName.selectAll(elName)
				.on("click", function(d) {
					var text = "<h4 class='alb'>" + d.Song + "</h4> recorded " + d.Date + " year.";
					div.html(text).style("left",
					(d3.event.pageX - 65) + "px").style("top",
					(d3.event.pageY - 100) + "px").attr("id", d.Id);
					if (el !== this) {
						div.style("visibility", "visible");
						el = this;
					} else {
						div.style("visibility", "hidden");
						el = null;
					}
		});
	}
	
	function wndsize(){
		var w = 0;var h = 0;
		// IE
		if(!window.innerWidth){
		    if(!(document.documentElement.clientWidth == 0)){
		        // strict mode
		        w = document.documentElement.clientWidth;
		        h = document.documentElement.clientHeight;
		    } else{
		        // quirks mode
		        w = document.body.clientWidth;
		        h = document.body.clientHeight;
		    }
		} else {
		    // w3c
		    w = window.innerWidth;
		    h = window.innerHeight;
		}
		return {
			width:w,
			height:h
		};
	}
	
	return {
		createNewArray : createArray,
		sortByAlbumName : sort,
		chartClick : clickEvent,
		chartMouseEvent : mouseEvent,
		createSVG : createSVG,
		clickTimeLine: clickTimeLineEvent,
		windowSize: wndsize
	};
}());