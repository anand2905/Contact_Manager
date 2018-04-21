$(function(){
	$("#add-new-group").hide();
	$('#add-group-btn').click(function(){
		$("#add-new-group").slideToggle(function(){
			$('#new_group').focus();
		});
		return false;
		});

	$('#save-group-btn').click(function(){
		event.preventDefault();

		$.ajax({
				url: "/groups",
				method: "post",
				beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
				data: {
					 group: { name: $('#new_group').val() }
				},
				success: function(responce){
					console.log(responce);
				},
				error: function (xhr) {
					console.log(xhr);
				}
		});
	});
});