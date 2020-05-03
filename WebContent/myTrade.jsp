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
			<!-- <form id="myTrade" name="myTrade"> -->
				<table class="table" id="mytradeList">
					<thead>
						<tr class="title">
							<th>주문 날짜</th>
							<th>제목</th>
							<th>제품명</th>
							<th>수량</th>
							<th>제품 가격</th>
							<th>배송비</th>
							<th>거래 상태</th>
							<th></th>
						</tr>
					</thead>
					
					<tbody id="tradelist">
						<c:choose>
							<c:when test="${empty mytrade}">
								<tr class="list">
									<td colspan="8">구매한 제품이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="k" items="${mytrade}">
									<tr class="list">
										<td>${k.purchase_date.substring(0,10)}</td>
										<td><a href="product?product_num=${k.selling_list_num}">${k.selling_list_title}</a></td>
										<td>${k.selling_product}</td>
										<td>${k.purchase_count}</td>
										<td>${k.trade_price}</td>
										<td>${k.delivery_price}</td>
										<td>${k.trade_state}</td>
										<td>
											<div>
												<c:if test="${1 eq k.trade_state}">
													<!-- 입금 전이면 바로 취소 -->
													<button class="btn btn-info btn-xs" onclick="purchaser_btn(${k.trade_num},'2')">입금</button>
													<button class="btn btn-info btn-xs" onclick="purchaser_btn(${k.trade_num},'0')">구매 취소</button>
												</c:if>
												<c:if test="${2 eq k.trade_state || 3 eq k.trade_state}">	
													<!-- 판매자의 취소 승락 승인 대기 -->					
													<button class="btn btn-info btn-xs" onclick="purchaser_btn(${k.trade_num},'15')">취소 신청</button>	
												</c:if>
												<c:if test="${4 eq k.trade_state}">	
													<!-- 택배 정보 조회 -->
													<button class="btn btn-info btn-xs" onclick="purchaser_btn(${k.trade_num},'5')">배송 조회</button>	
												</c:if>
												<c:if test="${5 eq k.trade_state}">
													<!-- 구매 확정 및 반품 신청 -->
													<button class="btn btn-info btn-xs" onclick="purchaser_btn(${k.trade_num},'6')">구매 확정</button>&nbsp;&nbsp;							
													<button class="btn btn-info btn-xs" onclick="purchaser_btn(${k.trade_num},'7')">반품 신청</button>
												</c:if>
												<c:if test="${7 eq k.trade_state}">
													<button class="btn btn-info btn-xs" onclick="purchaser_btn(${k.trade_num},'9')">반품 택배 송장</button>&nbsp;&nbsp;							
													<button class="btn btn-info btn-xs" onclick="purchaser_btn(${k.trade_num},'6')">반품 취소 / 구매 확정</button>
												</c:if>
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot></tfoot>
				</table>
			<!-- </form> -->
		</div>
	</article>
	<script src="${pageContext.request.contextPath}/js/myTrade.js"></script>
</body>
</html>