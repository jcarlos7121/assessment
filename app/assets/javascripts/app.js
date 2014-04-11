$(document).ready(function() {
	$('select').chosen();
	$('#language').on('change', function(event) {
		event.preventDefault();
		var input = $(".first").val();
		if (isNaN(input)) {
			$('.result').html("Hey! that was not a number!");
		}else{
			console.log('entreaca');
			$.post('/firstmethod', { number:input,language:$('#language').val()}, function(data, textStatus, xhr) {
				console.log(data);
				$('.result').html(data);
			});
		}
	});
	$('.first').on('input',function  () {
		var input = $(this).val();
		if (isNaN(input)) {
			$('.result').html("Hey! that was not a number!");
		}else{
			console.log('entreaca');
			$.post('/firstmethod', { number:input,language:$('#language').val()}, function(data, textStatus, xhr) {
				console.log(data);
				$('.result').html(data);
			});
		}
	});

	$('.second').on('input', function(event) {
		event.preventDefault();
		inputnumber = $(this).val()
		$.post('/secondmethod',{number:inputnumber}, function(data, textStatus, xhr) {
			$('.result').html(data);
		});
	});
});