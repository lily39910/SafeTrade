function mypage(mode){
	alert(mode);
	var path = '';
	if(mode == 'qa'){	
		path='q_a';
	}
	else if(mode == 'trade'){
		path='trade?trade=list';
	}
	else if(mode == 'products'){
		path='sell_product?state=myproducts';
	}
	else {
		path='';
	}
	location.href = path;
}
