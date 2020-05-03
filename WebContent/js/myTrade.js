/*
$(document).ready(function(){
	$('td div button').click(function(){
		var process = $(this).attr('name');
		var trade_num = $(this).children().val();
	});
});
*/



function purchaser_btn(trade_num, process){
//	document.getElementById('myTrade').method='post';
//	document.myTrade.action= path;
//	document.myTrade.submit();
	var path = 'trade?trade=progress&trade_num=' + trade_num + '&process=' + process;
	location.href = path;
	//alert(path);
}