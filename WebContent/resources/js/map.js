	$(document).ready(function() {
		
		var map = new google.maps.Map(document.getElementById('map'), {

			center : {
				lat : 17.3850,
				lng : 78.4867
			},
			zoom : 12
		});
		var marker = new google.maps.Marker({
			position : {
				lat : 17.3850,
				lng : 78.4867
			},
			map : map,
			draggable : true
		});
		$('#change').click(function() {
			var area;
			var to=$('#to').val().toLowerCase();
			var type=$('#type').val();
			var input = $('#from').val().toLowerCase();
			switch (input||to) {
			case "India":
				area = {
					lat : 20.5937,
					lng : 78.9629
				};
				break;
			case "bengaluru":
				area = {
					lat : 12.9716,
					lng : 77.5946
				};
				break;
			case "chennai":
				area = {
					lat : 13.0827,
					lng : 80.2707
				};
				break;
			case "hyderabad":
				area = {
					lat : 17.3850,
					lng : 78.4867
				}
				break;
			case "goa":
				area = {
					lat : 15.2993,
					lng : 74.1240
				}
				break;
			}
			var map = new google.maps.Map(document.getElementById('map'), {
				center : area,
				zoom : 10
			});
			var marker = new google.maps.Marker({
				position : area,
				map : map,
				draggable : true
			});
			var html="";
			$.ajax({
				type: 'GET',
				url: "/StarterKit/searchinmap",
				data:{from:input,to:to,type:type},
				success: function(data){
					$.each(data,function(index,value){
						html+="<tr><td><img src='/StarterKit/images/"+value.path+"'></td><td>"+value.routename+"</td><td><a href='/StarterKit/routesById/"+value.id+"' class='btn btn-primary'>View</a></tr>"
					});
					$("#tbody").html(html);
				}
				
			});

		});
	});
