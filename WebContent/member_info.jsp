<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>안심거래: 회원정보 수정</title>

</head>
<body>
	<article>
		<div>
			<h4>개인정보 수정</h4>
			<form>
				<div>
					<div>
						<div>
							<div>
								<label>아이디</label>
							</div>
							<div class="div_cell div_value">
								<input type="text">&nbsp;&nbsp;&nbsp;
								<button class="btn btn-default btn-sm">중복확인</button>
							</div>
						</div>
						
						<div class="div_table_row">
							<div class="div_cell div_name">
								<label>비밀번호</label>
							</div>
							<div class="div_cell div_value">
								<input type="password">
							</div>
						</div>
						
						<div class="div_table_row">
							<div class="div_cell div_name">
								<label>비밀번호 확인</label>
							</div>
							<div class="div_cell div_value">
								<input type="password">
							</div>
						</div>
						
						<div class="div_table_row">
							<div class="div_cell div_name">
								<label>이름</label>
							</div>
							<div class="div_cell div_value">
								<input type="text">
							</div>
						</div>
						
						<div class="div_table_row">
							<div class="div_cell div_name">
								<label>성별</label>
							</div>
							<div class="div_cell div_value">
								<input type="text">
							</div>
						</div>
						
						<div class="div_table_row">
							<div class="div_cell div_name">
								<label>전화번호</label>
							</div>
							<div class="div_cell div_value">
								<input type="text">
							</div>
						</div>
						
						<div class="div_table_row">
							<div class="div_cell div_name">
								<label>주소</label>
							</div>
							<div class="div_cell div_value">
								<input type="text">
							</div>
						</div>
					</div>
					<div>
						<button id="join" class="btn btn-info btn-md">개인정보 수정</button>&nbsp;&nbsp;&nbsp;
						<button id="cancel" class="btn btn-default btn-md">취소</button>
					</div>
				</div>
			</form>
		</div>
	</article>
	
	<footer>
		<div id="member_footer">
			<p class="footer_p">Copyright© &nbsp;&nbsp;안심거래. All rights reserved</p>
		</div>
	</footer>
</body>
</html>