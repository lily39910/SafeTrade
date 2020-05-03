<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<form>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>번호</td>
							<td>분류</td>
							<td><a href="#">제목</a></td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</tbody>
					<tfoot></tfoot>
				</table>
			</form>
		</div>
	</article>
	
	<footer>
		<jsp:include page="common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>