$(document).ready(function() {
	$("#datepicker-from").datepicker({
		numberOfMonths : 1,
		onSelect : function(selected) {
			$("#datepicker-to").datepicker("option", "minDate", selected);
		}
	});
	$("#datepicker-to").datepicker({
		numberOfMonths : 1,
		onSelect : function(selected) {
			$("#datepicker-from").datepicker("option", "maxDate", selected);
		}
	});

	$("#opp").click(function() {
		$("#dialog-form").toggleClass("dialog");
	});
	
	$('.hover-star').rating({ 
		focus: function(value, link){ 
			var tip = $('#feedback-rate'); 
			tip[0].data = tip[0].data || tip.html(); 
			tip.html(link.title || 'value: '+value); 
		}, 
		blur: function(value, link){ 
			var tip = $('#feedback-rate');
			$('#feedback-rate').html(tip[0].data || ''); 
		}
	});
});