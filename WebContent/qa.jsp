<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div><h3>Q&A</h3></div>
			<div>
				<button>입금 문의</button>
				<button>취소/환불문의</button>
				<button>기타 문의</button>
			</div>
			
			<div>
				<div>
					<form>
						<table class="table">
							<thead>
								<tr>
									<td colspan="5"></td>
									<td style="text-align: right"><button type="button" class="btn btn-info btn-sm" onclick="insertQA()">질문등록</button></td>
								</tr>
								<tr class="title">
									<th>번호</th>
									<th>분류</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr class="list">
											<td colspan="6">질문한 내역이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="k" items="${list}" varStatus="vs">
											<tr class="list">
												<td>${vs.count}</td>
												<td>
													<c:if test="${1 eq k.qa_group}">입금 문의</c:if>
													<c:if test="${2 eq k.qa_group}">취소/환불 문의</c:if>
													<c:if test="${3 eq k.qa_group}">기타 문의</c:if>
												</td>
												<td>
													<c:if test="${1 eq k.qa_group}">
														<a href="q_a?board=detail&qa_num=${k.qa_num}">Q. 입금 문의합니다.</a>
													</c:if>
													<c:if test="${2 eq k.qa_group}">
														<a href="q_a?board=detail&qa_num=${k.qa_num}">Q. 취소/환불 문의합니다.</a>
													</c:if>
													<c:if test="${3 eq k.qa_group}">
														<a href="q_a?board=detail&qa_num=${k.qa_num}">Q. 기타 문의합니다.</a>
													</c:if>
												</td>
												
												<td>${k.qa_writer_id}</td>
												<td>${k.qa_date.substring(0,10)}</td>
												<td>${k.qa_state} 상태</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
							<tfoot></tfoot>
						</table>
					</form>
				</div>
			</div>
		</div>
	</article>
	
	<footer>
		<jsp:include page="common/footer.jsp"></jsp:include>
	</footer>
	
	<script src="${pageContext.request.contextPath}/js/qa.js"></script>
</body>
</html>