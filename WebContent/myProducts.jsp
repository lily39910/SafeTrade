<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic_table_mold.css"/>
</head>
<body>
	<header>
		<jsp:include page="common/header.jsp"></jsp:include>
	</header>
	
	<article>
		<div class="container text-arrangement">
			<div><h3>내 판매글</h3></div>
			<div>
				<table class="table">
					<thead>
						<tr class="title">
							<th>번호</th>
							<th>등록 날짜</th>
							<th>제목</th>
							<th>제품명</th>
							<th>수량</th>
							<th>제품 가격</th>
							<th>제품 품질</th>
							<th>거래 상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty myproducts}">
								<tr class="list">
									<td colspan="9">판매 등록한 제품이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="k" items="${myproducts}" varStatus="vs">
									<tr class="list">
										<td>${vs.count}</td>
										<td>${k.selling_enroll_date.substring(0,10)}</td>
										<td><a href="product?product_num=${k.selling_list_num}">${k.selling_list_title}</a></td>
										<td>${k.selling_product}</td>
										<td>${k.selling_count}</td>
										<td>${k.selling_price}</td>
										<td>${k.selling_product_quality}</td>
										<td>${k.selling_state}</td>
										<td>
											<c:if test="${0 eq k.selling_state || 2 eq k.selling_state}">
												<button class="btn btn-info btn-xs" onclick="myproduct_btn(${k.selling_list_num},'delete')">삭제</button>											
											</c:if>
											<c:if test="${1 eq k.selling_state}">
												<button class="btn btn-info btn-xs" onclick="myproduct_btn(${k.selling_list_num},'')">판매 중지</button>
											</c:if>
											<c:if test="${4 eq k.selling_state}">
												<p>신고된 글</p>
											</c:if>
										</td>										
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot></tfoot>
				</table>
			</div>
		</div>
	</article>
	
	
	<footer>
		<jsp:include page="common/footer.jsp"></jsp:include>
	</footer>
	
	
	
	<script src="${pageContext.request.contextPath}/js/myProducts.js"></script>
</body>
</html>