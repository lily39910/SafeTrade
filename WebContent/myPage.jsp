<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>안심거래:마이페이지</title>
<!-- <style type="text/css">


.text-arrangement {
	margin-bottom: 40px;
	text-align: center;
}
</style> -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic_table_mold.css" />
</head>
<body>
	<header>
		<jsp:include page="common/header.jsp"></jsp:include>
	</header>
	
	<article>
		<div class="container text-arrangement">
			<h4 class="">MyPage</h4>
			<div id="mypage_record_div">
				<p>총 구매 횟수</p>
				<p>총 지출 금액</p>
				<p>총 판매 횟수</p>
				<p>총 수입 금액</p>
			</div>
			<div>
				<button class="btn btn-info btn-md">회원 정보 수정</button> &nbsp;&nbsp;
				<!-- myTrade.jsp -->
				<button class="btn btn-info btn-md" onclick="mypage('trade')">주문 내역 확인</button> &nbsp;&nbsp;
				<button class="btn btn-info btn-md" onclick="mypage('products')">내 판매글 관리</button> &nbsp;&nbsp;
				<button class="btn btn-info btn-md" onclick="mypage('qa')">My Q&A</button>
			</div>
		</div>
	</article>
	
	<footer>
		<jsp:include page="common/footer.jsp"></jsp:include>
	</footer>

	<script src="${pageContext.request.contextPath}/js/mypage.js"></script>
</body>
</html>