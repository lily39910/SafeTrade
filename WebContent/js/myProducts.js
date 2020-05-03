function myproduct_btn(num, mode){
	var path='';
	if(mode == 'delete'){
		path = 'sell_product?state=delete_ok&product=' + num;
	}
	else if(mode == 'stop'){
		path = 'sell_product?state=stop_sell&product=' + num;
	}
	
	location.href = path;
}