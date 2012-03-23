function test_color()
{

	red = $("#user_red_color").val();
	green = $("#user_green_color").val();
	blue = $("#user_blue_color").val();
	$("#sample_color").css("background","rgba("+red+","+green+","+blue+",0.8)");
}

$(function() {
		$( ".story" ).draggable({ revert: "invalid" });
		$( ".available_stories, .completed_stories, .current_stories" ).droppable({
			drop: function( event, ui ) {
				$(ui.draggable).remove();
				$("<div class='"+ui.draggable.attr("class")+"' id='"+ui.draggable.attr("id")+"'></div> ").html(ui.draggable.html()).appendTo(this).draggable({ revert: "invalid" });
				$(this).append(" ");
				//Ajax request to update
				new_state = $(this).attr("id");
				
				id_story = ui.draggable.attr("id").split("_")[1];
				
				$.ajax({
					url: '/admin/stories/'+id_story+'.json',
					type: 'PUT',
					dataType: 'json',
					data: {story: { status: new_state }}
				}).fail(function(jqXHR, textStatus) {
  alert( "Request failed: " + textStatus );
});
				
			
			}
		});
		
		$(".story, .new_story").live("dblclick",function(){
			
			//Get details info of current story (unless new)
			if($(this).attr("id") == "new_story")
			{
				$("#action").val("POST");
				$("#edit_story").show();
				$("#id_story").val("");
				$("#description").val("");
				$("#category").val("");
				$("#priority").val("");
				$("#effort").val("");
				$("#user_id").val("");
			}
			else
			{
				id_story = $(this).attr("id").split("_")[1];
				$("#action").val("PUT");
				$.get("/admin/stories/"+id_story+".json",function(data){
				$("#edit_story").attr("class","user_"+data.user_id);
				$("#id_story").val(id_story);
				$("#description").val(data.description);
				$("#category").val(data.category);
				$("#priority").val(data.priority);
				$("#effort").val(data.effort);
				$("#user_id").val(data.user_id);
				$("#edit_story").show();
				});
			}
			
			
			
			//
			 
		
			
			
		});
		$("#edit_story input[value='Annuler']").click(function(){
			$("#edit_story").hide();
		});
		$("#edit_story input[value='Supprimer']").click(function(){
		 if(confirm("Êtes vous sûr de vouloir supprimer cet élément?"))
		 {
		 	//Delete
		 	$.ajax({
					url: '/admin/stories/'+id_story+'.json',
					type: 'DELETE',
					dataType: 'json'
				}).done(function(){
					$("#story_"+$("#id_story").val()).remove();
				}).fail(function(jqXHR, textStatus) {
  		alert( "Request failed: " + textStatus );
		});
		 	$("#edit_story").hide();
		 }
		});
		$("#edit_story input[value='Confirmer']").click(function(){
		 	
		 	if($("#action").val() == "PUT")
		 	{
		 	url_up = '/admin/stories/'+$("#id_story").val()+'.json'
		 	data = {
		 			id:$("#id_story").val(),
		 			story:{
		 				description:$("#description").val(),
		 				category: $("#category").val(),
		 				priority: $("#priority").val(),
		 				effort: $("#effort").val(),
		 				user_id: $("#user_id").val()
		 			}
		 		};	
		 	}
		 	else
		 	{
		 	url_up = '/admin/stories.json'
		 		data = {
		 			story:{
		 				description:$("#description").val(),
		 				category: $("#category").val(),
		 				priority: $("#priority").val(),
		 				effort: $("#effort").val(),
		 				user_id: $("#user_id").val()
		 			}
		 		};	
		 	}
		 	
		 		$.ajax({
					url: url_up,
					type: $("#action").val(),
					dataType: 'json',
					data: data
				}).done(function(resp){
				
					if($("#action").val() == "POST") 
					{

					$("<div id='story_"+resp.id+"'></div>").appendTo($("#waiting"));
					$("#story_"+resp.id).attr("class","story user_"+resp.user_id).html("#"+resp.id+" - "+$("#category option:selected").text()+"<br/>"+resp.description);
					}
					else
					{
						$("#story_"+$("#id_story").val()).attr("class","story user_"+data.story.user_id).html("#"+data.id+" - "+$("#category option:selected").text()+"<br/>"+data.story.description);
					}
					
				
				}).fail(function(jqXHR, textStatus) {
  		alert( "Request failed: " + textStatus );
		});

		 	$("#edit_story").hide();

		});
		
		
	});
