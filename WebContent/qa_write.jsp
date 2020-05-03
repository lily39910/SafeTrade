<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<form id="write_qa" name="write_qa">
					<table class="table table-bordered">
						<thead>
						</thead>
						<tbody>
							<tr>
								<th>글 분류</th>
								<td>
									<select class="full-width" name="qa_group">
										<option>선택</option>
										<option value="1">입금 문의</option>
										<option value="2">취소/환불 문의</option>
										<option value="3">기타 문의</option>
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
									<textarea class="full-width" name="qa_content"></textarea>
								</td>
							</tr>
							<tr>
								<th>글 비밀번호</th>
								<td>
									<input type="password" name="qa_pwd">
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2"  class="btn_align">
									<button class="btn btn-info" onclick="qa('write')">질문 등록</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-default">취소</button>
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