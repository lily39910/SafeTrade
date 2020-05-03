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
			
			<div><h3>문의 등록</h3></div>
	
			<div>
				<button>입금 문의</button>
				<button>취소/환불 문의</button>
				<button>기타 문의</button>
			</div>
			
			<div class="table_div">
				<form id="update_qa" name="update_qa">
					<table class="table table-bordered">
						<thead>
						</thead>
						<tbody>
							<tr>
								<input type="hidden" name="qa_num" id ="qa_num" value="${qa.qa_num}">
								<th>글 분류</th>
								<td>
									<select class="full-width" name="qa_group">
										<option value="0">선택</option>
										<c:if test="${1 eq qa.qa_group}">
											<option value="1" selected="selected">입금 문의</option>
											<option value="2">취소/환불 문의</option>
											<option value="3">기타 문의</option>
										</c:if>
										<c:if test="${2 eq qa.qa_group}">
											<option value="1">입금 문의</option>
											<option value="2" selected="selected">취소/환불 문의</option>
											<option value="3">기타 문의</option>
										</c:if>
										<c:if test="${3 eq qa.qa_group}">
											<option value="1">입금 문의</option>
											<option value="2">취소/환불 문의</option>
											<option value="3" selected="selected">기타 문의</option>
										</c:if>
									</select>
								</td>
							</tr>
							<!-- <tr>
								<th>제목</th>
								<td>
									<input type="text">
								</td>
							</tr> -->
							<tr>
								<th>질문 내용</th>
								<td>
									<textarea class="full-width" name="qa_content">${qa.qa_content}</textarea>
								</td>
							</tr>
							<tr>
								<th>글 비밀번호</th>
								<td>
									<input type="hidden" name="origin_pwd" value="${qa.qa_pwd}">
									<input type="password" name="qa_pwd">
								</td>
							</tr>
							
		
						</tbody>
						<tfoot>
							
							<tr>
								<td colspan="2"  class="btn_align">
									<button class="btn btn-info" onclick="qa('modify')">수정</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-default">취소</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
			</div>	
		</div>
	</article>
	
	
	<footer>
		<jsp:include page="common/footer.jsp"></jsp:include>
	</footer>
	
	<script src="${pageContext.request.contextPath}/js/qa.js"></script>
</body>
</html>