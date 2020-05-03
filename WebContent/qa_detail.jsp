<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic_table_mold.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/qa.css"/>
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
				<form id="modify_qa" name="modify_qa">
					<table class="table table-bordered">
						<thead>
						</thead>
						<tbody>
							<tr>
								<th>글 분류</th>
								<td>
									<c:if test="${1 eq qa_vo.qa_group}">입금 문의</c:if>
									<c:if test="${2 eq qa_vo.qa_group}">취소/환불 문의</c:if>
									<c:if test="${3 eq qa_vo.qa_group}">기타 문의</c:if>
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td>
									<c:if test="${1 eq qa_vo.qa_group}">입금 문의합니다.</c:if>
									<c:if test="${2 eq qa_vo.qa_group}">취소/환불 문의합니다.</c:if>
									<c:if test="${3 eq qa_vo.qa_group}">기타 문의합니다.</c:if>
							
								</td>
							</tr>
							<tr>
								<th>질문 내용</th>
								<td>
									<pre class="default">
										${qa_vo.qa_content}
									</pre>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2"  class="btn_align">
									<input type="hidden" id="qa_pwd" name="qa_pwd" value="${qa_vo.qa_pwd}">
									<button type="button" class="btn btn-info" onclick="qaDetail('${qa_vo.qa_num}')">질문 수정</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<%-- <button type="button" class="btn btn-info" onclick="qaDelete('${qa_vo.qa_num}')">삭제</button> --%>
									<button type="button" class="btn btn-info" onclick="qaDelete()" id="qa_del">삭제</button>
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
	
	


	<div class="container text-arrangement">
		<div id="myModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
		    	<div class="modal-header">
		      		<span class="close" onclick="close_pwdchk()">&times;</span>
		      		<h4>비밀번호를 입력하세요</h4>
		    	</div>
			    <div class="modal-body">
					<p>비밀번호&nbsp;&nbsp;&nbsp;<input type="password" id="pwd_chk"></p>
					<p>
						<button onclick="pwdchk_ok('${qa_vo.qa_num}')">확인</button>
						&nbsp;&nbsp;
						<button onclick="pwdchk_cancel()">취소</button>
					</p>
			    </div>
			</div>
		</div>
	</div>
	



	<script src="${pageContext.request.contextPath}/js/qa.js"></script>
</body>
</html>