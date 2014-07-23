var drawMaps = this || {};

drawMaps = (function() {
	"use strict";

	function topograph() {
		var projection = d3.geo.mercator().center([ 0, 40 ]).scale(900).rotate(
				[ 0, 0 ]), svg = common.createSVG(config.dimensions,
				config.CSS.IDs.map), path = d3.geo.path()
				.projection(projection), g = svg.append(config.CSS.el.g);

		d3.json(config.path.topoJSON, function(error, topology) {
			g.selectAll(config.CSS.el.path)
					.data(topojson.feature(topology,
									topology.objects.countries).features)
					.enter().append(config.CSS.el.path).attr(config.attr.d,
							path);

			g.append(config.CSS.el.pattern).attr(config.attr.id,
					config.CSS.IDs.marker).attr(config.attr.patternUnits,
					config.CSS.classes.objBound).attr(config.attr.width, '30')
					.attr(config.attr.height, '30').append(config.CSS.el.image)
					.attr(config.attr.xlink, config.path.img).attr(
							config.attr.width, '30').attr(config.attr.height,
							'30');

			g.selectAll(config.CSS.el.circle).data(config.locations).enter()
					.append(config.CSS.el.circle).attr(config.axis.cx,
							function(d) {
								return projection([ d[2], d[1] ])[0];
							}).attr(config.axis.cy, function(d) {
						return projection([ d[2], d[1] ])[1];
					}).attr(config.attr.r, 12).attr(config.attr.fill,
							"url(#marker)").attr(config.attr.classAtr,
							config.CSS.IDs.marker).on(config.action.click,
							function(d) {
								alert(d[0]);
							});

			g.selectAll(config.CSS.classes.place).data(config.locations)
					.enter().append(config.CSS.el.text).attr(
							config.attr.classAtr, config.CSS.classes.place)
					.attr(config.attr.transform,
							function(d) {
								return "translate("
										+ projection([ d[2], d[1] ])
										+ config.attr.close;
							}).attr(config.axis.dy, ".35em").text(function(d) {
						return d[0];
					});
		});

		// zoom and pan
		var zoom = d3.behavior.zoom().on(
				config.action.zoom,
				function() {
					g.attr(config.attr.transform, "translate("
							+ d3.event.translate.join(",") + ")scale("
							+ d3.event.scale + ")");
					g.selectAll(config.CSS.el.path).attr(config.attr.d,
							path.projection(projection));
				});
		svg.call(zoom);
	}

	return {
		topograph : topograph,
		google : function() {
			var markers = {
				pins : [],
				balloons : [],
				handlers : [],
				path : null,
			}, mapOptions = {
				zoom : 8,
				center : new google.maps.LatLng(43.837499, 25.966846)
			}, map = new google.maps.Map(document
					.getElementById(config.CSS.IDs.mapCanvas), mapOptions), 
				latLngList = [],
				bounds = new google.maps.LatLngBounds();

			for ( var i = 0, j = config.locations.length; i < j; i++) {
				latLngList.push(new google.maps.LatLng(config.locations[i][1],
						config.locations[i][2]));

				bounds.extend(latLngList[i]);

				markers.pins.push(new google.maps.Marker({
					position : latLngList[i],
					map : map,
				}));

				markers.balloons.push(new google.maps.InfoWindow({
					content : '<a href="http://www.google.com/maps?daddr='
							+ config.locations[i][0] + '" target="_blank">'
							+ config.locations[i][0] + '</a>'
				}));

				markers.handlers.push(google.maps.event.addListener(
						markers.pins[i], config.action.click, (function(i) {
							return function() {
								markers.balloons[i].open(map, markers.pins[i]);
							};
						})(i)));
			}
			map.fitBounds(bounds);
		}
	};
}());