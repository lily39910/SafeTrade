$(document).ready(function(){
	function getList(){
		$.ajax({
			url: '/SafeTrade/MenuSelectController',
			type: 'get',
			dataType: 'xml',
			success: function(data){
				var menu = '';
				//정보를 지닌 태그
				$(data).find('menu').each(function() {
					menu += '<option value="';
					menu += $(this).find('menu_group_num').text() + '">';
					menu += $(this).find('menu_group_name').text();
					menu += '</option>';
				});
				$('#menu').append(menu);
			},
			error: function(){
				alert('fail!');
			}
		});
	}
	getList();
});