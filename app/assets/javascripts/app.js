$(document).ready(function() {
	$('select').chosen();
	$('#language').on('change', function(event) {
		event.preventDefault();
		var input = $(".first").val();
		if (isNaN(input)) {
			$('.result').html("<h4 id='faderesult' style='display:none;'>Hey! That was not a number!</h4>");
			setTimeout(function() { $('#faderesult').fadeIn("slow"); }, 100);
		}else{
			console.log('entreaca');
			$.post('/firstmethod', { number:input,language:$('#language').val()}, function(data, textStatus, xhr) {
				console.log(data);
				$('.result').html("<h4 id='faderesult' style='display:none;'>"+data+"</h4>");
				setTimeout(function() { $('#faderesult').fadeIn("slow"); }, 100);
			});
		}
	});
	$('.first').on('input',function  () {
		var input = $(this).val();
		if (isNaN(input)) {
			$('.result').html("<h4 id='faderesult' style='display:none;'>Hey! That was not a number!</h4>");
			setTimeout(function() { $('#faderesult').fadeIn("slow"); }, 100);
		}else{
			console.log('entreaca');
			$.post('/firstmethod', { number:input,language:$('#language').val()}, function(data, textStatus, xhr) {
				$('.result').html("<h4 id='faderesult' style='display:none;'>"+data+"</h4>");
				setTimeout(function() { $('#faderesult').fadeIn("slow"); }, 100);
			});
		}
	});

	$('.second').on('input', function(event) {
		event.preventDefault();
		inputnumber = $(this).val();
		if (isNaN(inputnumber)) {
			$('.result').html("<h4 id='faderesult' style='display:none;'>Hey! That was not a number!</h4>");
			setTimeout(function() { $('#faderesult').fadeIn("slow"); }, 100);
		}else{
			$.post('/secondmethod',{number:inputnumber}, function(data, textStatus, xhr) {
				$('.result').html("<h4 id='faderesult' style='display:none;'>"+data+"</h4>");
				setTimeout(function() { $('#faderesult').fadeIn("slow"); }, 100);
			});
		}
	});
});