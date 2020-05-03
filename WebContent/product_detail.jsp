<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product_detail.css" />

</head>
<body>
	<header>
		<jsp:include page="common/header.jsp"></jsp:include>
	</header>
	
	<article>	
		<div class="container">
		<form id="startTrade" name="startTrade">
	     	<div>
	            <h5 id="product_detail_title">${product.selling_list_title }</h5>
   		        <hr class="content_top_hr">
   		        
				<div class="row">
					<div class="content_controll_div">
					
						<c:choose>
							<c:when test="${empty user}">
								<p class="visitor_btn">
									<a class="content_controll">로그인 안함</a>
								</p>
								<script type="text/javascript">
									/*
									alert('own');
									$('.visitor_btn').css("display","none");
									$('.owner_btn').css("display","");
									*/
								</script>
								
							</c:when>
							<c:otherwise>
								<c:if test="${user.id eq product.seller_id}">
									<p class="owner_btn">
										<a class="content_controll" href="sell_product?state=modify&product=${product.selling_list_num}">수정</a>
											&nbsp;&nbsp;<font class="divide_font">|</font>&nbsp;&nbsp;
										<a class="content_controll"  onclick="productDelete(${product.selling_list_num})">삭제</a>
									</p>
								</c:if>
								<c:if test="${user.id ne product.seller_id}">
									<p class="visitor_btn">
										<a class="content_controll" onclick="productTrouble(${product.selling_list_num})">신고</a>
									</p>
								</c:if>	
							</c:otherwise>
						</c:choose>
					
						
						
						
					</div>
					
                	<div class="col-md-7">
                        <img class="card-img-top" src="http://placehold.it/700x400" alt="">
                	</div>
                	
	                <div class="col-md-5">
	                    <h3>${product.selling_product}</h3>
	                    <div class="detail_info">          
		                    <p>가격 :&nbsp;&nbsp;${product.selling_price}&nbsp;(개당)<p>
		                    <p>제품 품질 :&nbsp;&nbsp;${product.selling_product_quality}<p>
		                    <p>남은 수량 :&nbsp;&nbsp;${product.selling_count - product.selled_count}<p>
		        			<c:if test="${user.id ne product.seller_id}">
			        			<p>구매할 수량&nbsp;&nbsp;<input type="number" name="purchase_count" value="1"></p>
			        		</c:if>
		        			<p>택배비 :&nbsp;&nbsp;${product.delivery_price}원</p>
		        			<p>연락처 :&nbsp;&nbsp;${product.trade_phone_num}</p>
		        			<input type="hidden" name="seller_id" id="seller_id" value="${product.seller_id}">
		        			<input type="hidden" name="trade_price" value="${product.selling_price}">
		        			<input type="hidden" name="selling_list_num" value="${product.selling_list_num }">
		        			<input type="hidden" name="delivery_price" value="${product.delivery_price}">
		        		</div>
		        		
		        		<c:if test="${user.id ne product.seller_id}">
		                    <button class="btn btn-info btn-lg btn-block" onclick="tradeStartbtn()">구매</button>		        		
		        		</c:if>			        			
	                </div>
            	</div>
	            <hr>
			</div>

			<div class="detail_card detail_my-4">
            	<h5 class="detail_card-header detail_h5">상세 정보</h5>
            	<div class="detail_card-body">
            		<pre>
            			${product.selling_list_content}
            		</pre>
            	</div>
            </div>

			
			<div class="detail_card">
                <div class="detail_card-header" role="tab" id="headingOne">
                    <h5 class="comment_accordion_act detail_h5">
                        <a id="show_comment_btn" class="comment_accordion" data-toggle="collapse" data-target="#totalComment">댓글</a>
                    </h5>
                </div>
                
	            <div id="totalComment" class="collapse show in">
	                <div class="detail_card-body" id="product_detail_cmt_div">
	                    <!-- Single Comment -->
	                    <c:choose>
	                    	<c:when test="${empty comment}">
	                    		<p>등록된 댓글이 없습니다.</p>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<c:forEach var="k" items="${comment}" varStatus="vs">
	                    			<div class="detail_media detail_mb-4">
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
	                    		</c:forEach>
	                    	</c:otherwise>
	                    </c:choose>
                        

                        <!-- //Comment with nested comments
                        <div class="detail_media detail_mb-4">
                            <img class="detail_d-flex detail_mr-3 user_rounded-circle userimg" src="http://placehold.it/50x50" alt="">
                            <div class="detail_media-body">
                                <h5 class="detail_mt-0 detail_h5">Commenter Name</h5>
                                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

                                <div class="detail_media detail_mt-4">
                                    <img class="detail_d-flex detail_mr-3 user_rounded-circle userimg" src="http://placehold.it/50x50" alt="">
                                    <div class="detail_media-body">
                                    	<h5 class="detail_mt-0 detail_h5">Commenter Name</h5>
                                    	Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                	</div>
                                </div>

                                <div class="detail_media detail_mt-4">
                                    <img class="detail_d-flex detail_mr-3 user_rounded-circle userimg" src="http://placehold.it/50x50" alt="">
                                    <div class="detail_media-body">
                                    	<h5 class="detail_mt-0 detail_h5">Commenter Name</h5>
                                    	Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                	</div>
            					</div>
            				</div>
            			</div> -->
	            	</div>
	            </div>
            </div>
             
            <!-- Comments Form -->
            <div class="detail_card detail_my-4">
            	<h5 class="detail_card-header detail_h5">댓글 쓰기</h5>
            	<div class="detail_card-body">
            		<form>
            			<div class="detail_product_comment_div">
                        	<textarea class="product_comment" rows="3" id="comment"></textarea>
	                	</div>
	                	
		                <div class="detail_product_comment_btn_div">
		                    <button class="btn btn-info">등록</button>
		                </div>
            		</form>
            	</div>
            </div>
            
            <div align="center">
        		<button type="button" class="btn btn-info">목록으로</button>
        	</div>
        </div>
        </form>
	</article>
	
	<footer>
		<jsp:include page="common/footer.jsp"></jsp:include>
	</footer>

	<script src="${pageContext.request.contextPath}/js/product_detail.js"></script>
</body>
</html>