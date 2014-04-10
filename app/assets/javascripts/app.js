$(document).ready(function() {
	$('select').chosen();
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
	})
});