<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>안심거래: 로그인</title>
<!-- <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login_n_join.css" />

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login_font.css"/> --%>
<!-- font -->

<script src="${pageContext.request.contextPath}/js/login_n_join.js"></script>
<!-- Gem jQuery -->
<script src="${pageContext.request.contextPath}/js/modernizr.js"></script>
<!-- Modernizr -->
</head>
<body>
	<!-- this is the entire modal form, including the background -->
	<div class="cd-user-modal" id="not_login_div">
		<!-- this is the container wrapper -->
		<div class="cd-user-modal-container">
			<ul class="cd-switcher">
				<li><a id="login-tab">로그인</a></li>
				<li><a id="join-tab">회원가입</a></li>
			</ul>

			<!-- 로그인(sign_in) -->
			<div id="cd-login">
				<form class="cd-form" id="login_form">
					<p class="fieldset">
						<!-- label 이미지  -->
						<label class="image-replace cd-userid" for="signin-userid">Userid</label>
						<input class="full-width has-padding has-border"
							name="id" id="id" type="text" placeholder="아이디"> 
							<span class="cd-error-message">아이디를 입력하세요.</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">Password</label>
						<input class="full-width has-padding has-border"
							name="pwd" id="pwd" type="password" placeholder="비밀번호">
						<a href="#" class="hide-password">Show</a>
						<span class="cd-error-message">비밀번호를 입력하세요</span>
					</p>

					<!-- 
					<p class="fieldset">
						<input type="checkbox" id="remember-me" checked>
						<label for="remember-me">Remember me</label>
					</p>
					-->

					<p class="fieldset">
						<!-- <input class="full-width" type="submit" value="Login" id="login"> -->
						<button class="btn btn-info btn-lg btn-block" id="login_btn">Login</button>
					</p>
				</form>

				<p class="cd-form-bottom-message">
					<a href="">Forgot your password?</a>
				</p>
				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div>
			<!-- cd-login -->

			<!-- 회원가입(sign_up)-->
			<div id="cd-signup">
				<form class="cd-form" id="join_form" autocomplete="off">
					<p class="fieldset">
						<input class="full-width has-padding has-border"
							name="id" id="signup-userid" type="text" placeholder="아이디"> 
							<a href="#" class="overlap-id-chk">중복체크</a> <span
							class="cd-error-message" id="write_id_chk">아이디를 입력해주세요.</span>
							<span class="cd-error-message" id="id_chk">이미 사용 중인 아이디입니다.</span>
						<input type="hidden" name="id_result" id="id_result" value="">
					</p>
					
					<p class="fieldset">
						<input class="full-width has-padding has-border"
							name="pwd" id="signup-password" type="password" placeholder="비밀번호">
						<a href="#" class="hide-password">Show</a> <span
							class="cd-error-message">비밀번호를 입력해주세요</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding has-border"
							name="pwd_chk" id="signup-password_chk" type="password" placeholder="비밀번호 확인">
						<a href="#" class="hide-password">Show</a> <span
							class="cd-error-message">비밀번호 확인을 입력해주세요</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding has-border" id="signup-name" name="name" type="text" placeholder="이름">
						<span class="cd-error-message">이름을 입력해주세요</span>
					</p>

					<p class="fieldset" id="gender_p">
						<input id="signup-gender_M" type="radio" value="M" name="gender">남자
						<input id="signup-gender_F" type="radio" value="F" name="gender">여자
						<span class="cd-error-message">성별을 선택해주세요</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding has-border" id="signup-tel"
							name="phone" type="text" placeholder="전화번호">
							<span class="cd-error-message">전화번호를 입력해주세요</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding has-border"
							name="address" id="signup-address" type="text" placeholder="주소"> <span
							class="cd-error-message">주소를 입력해주세요</span>
					</p>
					<!--  
					<p class="fieldset">
						<input type="checkbox" id="accept-terms">
						<label for="accept-terms">I agree to the <a href="#0">Terms</a></label>
					</p>
					-->

					<p class="fieldset">
						<button class="btn btn-info btn-lg btn-block" id="join_btn">Join</button>
					</p>
				</form>
				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div>
			<!-- cd-signup -->

			<div id="cd-reset-password">
				<!-- reset password form -->
				<p class="cd-form-message">Lost your password? Please enter your
					email address. You will receive a link to create a new password.</p>

				<form class="cd-form">
					<p class="fieldset">
						<input class="full-width has-padding has-border" id="reset_name" type="text" placeholder="이름"> 
						<span class="cd-error-message">Error message here!</span>
					</p>
				
					<p class="fieldset">
						<input class="full-width has-padding has-border" id="reset_id" type="text" placeholder="아이디"> 
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding has-border" id="reset_phone" type="text" placeholder="전화번호"> 
						<span class="cd-error-message">Error message here!</span>
					</p>
					
					<p class="fieldset">
						<input class="full-width has-padding" type="submit"
							value="Reset password">
					</p>
				</form>

				<p class="cd-form-bottom-message">
					<a href="">Back to login</a>
				</p>
			</div>
			<!-- cd-reset-password -->
			<a class="cd-close-form">Close</a>
		</div>
		<!-- cd-user-modal-container -->
	</div>
	<!-- cd-user-modal -->
</body>
</html>