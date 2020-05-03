<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>안심거래</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product_list.css"/>
</head>
<body>
	<header>
		<jsp:include page="common/header.jsp"></jsp:include>
	</header>


	<article>
		<!-- Page Content -->
		<div class="container" style="text-align: center;">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Home</a></li>
				<li class="breadcrumb-item active">최근 등록 글</li>
			</ol>
			
			<c:choose>
				<c:when test="${empty products}">
					<div class="list">
						빈 테이블
					</div>		
				</c:when>
				
				<c:otherwise>
					<div class="list">
						<c:forEach var="k" items="${products}" varStatus="vs">
							<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					        	<div class="card h-100">
					            	<a href="product?product_num=${k.selling_list_num}"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a><!-- products/${k.selling_item_image} -->
					            	<div class="card-body">
					              		<h4 class="card-title">
					                		<a href="product?product_num=${k.selling_list_num}">${k.selling_product}</a>
					              		</h4>
					              		<!-- <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p> -->
					            		<p class="card-text">${k.selling_price}원</p>
					            	</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>


			<%-- <c:choose>
				<c:when test="${pvo.beginPage < pvo.pagePerBlock}">
					비활성화
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>	
			 --%>	
			<!-- Pagination -->
			<ul class="pagination justify-content-center">		
				<li class="page-item">
					<a class="page-link" href="#">◀</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">1</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">2</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">3</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">▶</a>
				</li>
			</ul>
		</div>
	</article>
	
	
	
	<%-- <section>
		
			<c:choose>
				<!-- 비활성화 -->
				<c:when>
					<li></li>
				</c:when>
										
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="#">◀</a>
					</li>					
					<li>						
						<a href="MyController?cmd=1&cPage=${pvo.beginPage-pvo.pagePerBlock}">이전으로</a>
					</li>
				</c:otherwise>
			</c:choose>
									
			<c:forEach var="k" begin="${pvo.beginPage}" end="${pvo.endPage}" step="1">
				<c:choose>
					<c:when test="${k==pvo.nowPage}">
						<li>
							<a class="page-link now" href="#">${k}</a>
						</li>
					</c:when>
											
					<c:otherwise>
						<li>
							<a class="page-link now" href="MyController?cmd=1&cPage=${k}">${k}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
									
			<c:choose>
				<c:when test="${pvo.endPage >= pvo.totalPage}">
					<!-- 비활성화 -->
					<li></li>
				</c:when>
				<c:otherwise>
					<li>
						<a class="page-link" href="MyController?cmd=1&cPage=${pvo.beginPage+pvo.pagePerBlock}">▶</a>
					</li>
				</c:otherwise>
			</c:choose>
	</section>
 --%>


	<footer>
		<jsp:include page="common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>