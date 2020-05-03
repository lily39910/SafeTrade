
function sell(mode){
 	if(mode == 'write'){
 		alert('추가');
		document.getElementById('sell_product').method='post';
		document.sell_product.action='sell_product?state=write_ok';
		document.sell_product.submit();
	}
	else if(mode == 'modify'){
		alert('수정');
		document.getElementById('sell_product_modify').method='post';
		document.sell_product_modify.action='sell_product?state=modify_ok';
		document.sell_product_modify.submit();
	}
	else {
		alert('ERROR');
	}
}