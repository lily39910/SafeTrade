$(document).ready(function() {
	
	$('#show_comment_btn').click(function() {
		if ($("#totalComment").hasClass("in") === true) { // 댓글닫기
			$('#totalComment').children('div').fadeOut();
			/* $('#totalComment').children('div').css('visibility','hidden'); */
		} else { // 댓글열기
			$('#totalComment').children('div').fadeIn();
			/* $('#totalComment').children('div').css('visibility','visible'); */
		}
	});
	
	function owner(){
		$('.visitor_btn').css("display","none");
		$('.owner_btn').css("display","");
	}
	
	function visitor(){
		$('.visitor_btn').css("display","");
		$('.owner_btn').css("display","none");
	}
	
	function getComment(){
		$.ajax({
			url: '/SafeTrade/ProductCommentCommand',
			type: 'get',
			dataType: 'xml',
			success: function(data){
				var comment = '';
				$(data).find('comment').each(function(){
					
			                            <img class="detail_d-flex detail_mr-3 user_rounded-circle userimg" src="http://placehold.it/50x50" alt="">
			                            <div class="detail_media-body">
			                                <h5 class="detail_mt-0 detail_h5">Commenter Name</h5>
			                                <p class="comment_content">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.	</p>
			                        		<p class="comment_time_n_controll">2018-01-03&nbsp;&nbsp;|&nbsp;&nbsp;
			                        			<a class="comment_controll">수정</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				                            	<a class="comment_controll">삭제</a>
				                            	&nbsp;&nbsp;|&nbsp;&nbsp;
				                            	<a class="comment_controll">신고</a>
			                        		</p>
			                        		<!-- <div><button class="btn btn-default btn-xs">답글</button></div> -->
			                        	</div>
			                        </div>
					
					
					
					
					comment += '<div class="detail_media detail_mb-4">';
					comment += '<img class="detail_d-flex detail_mr-3 user_rounded-circle userimg" src="http://placehold.it/50x50" alt="">';
					comment += '<div class="detail_media-body">';

					
				});
				$('#product_detail_cmt_div').append(comment);
			},
			error: function(){
				alert('fail');
			}
		});
	}
	getComment();
});

function productDelete(productNum){
	 msg = '정말 삭제하시겠습니까?';
  if (confirm(msg)!=0) {
  	var path = 'sell_product?state=delete_ok&product='+productNum;
  	location = path;
  } else {
 	 //cancel
  }
}

function productTrouble(productNum){
	 msg = '정말 신고하시겠습니까?';
    if (confirm(msg)!=0) {
    	var path = 'sell_product?state=trouble&product='+productNum;
    	location = path;
    } else {
   	 //cancel
    }
}

function tradeStartbtn(){
 	alert('구매');
	document.getElementById('startTrade').method='post';
	document.startTrade.action='trade?trade=new';
	document.startTrade.submit();
}
