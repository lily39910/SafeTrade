$(document).ready(function() {	
	$(".dropdown, .btn-group").hover(function() {
		var dropdownMenu = $(this).children(".dropdown-menu");
		if (dropdownMenu.is(":visible")) {
			dropdownMenu.parent().toggleClass("open");
			// toggle은 해당 요소가 설정된 클래스를 지니고 있으면 없애고, 없으면 생성해주는 역할을 함...
		}
	});
	
	$('.dropdown').on('click', function() {
		var locate = $(this).children('a').attr('href');
		window.location.href=locate;
	});
	
	$('#logout').click(function(){
		$('#signin_form').attr('action', 'signout').submit();
	});
	
	var w = $(window).width();
	//if(w < 768){
	if(w <= 753){
		$('.dropdown').off('click');
	}
	
	
	$(window).resize(function(){
//		alert($('#top-menu').width());
		var w = $(window).width();
		if(w <= 753){ //li dropdown click 비활성화..
			$('.dropdown').off('click');
		}
		else {
			$('.dropdown').on('click', function() {
				var locate = $(this).find('.dropdown-toggle').attr('href');
				window.location.href=locate;
			});
		}
	});
});

