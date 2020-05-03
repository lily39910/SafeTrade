<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<!-- Bootstrap core JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>

	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<!-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>  -->
	
 	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
	
<!------------------------------------------------------------------------------------------------------------------------>	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	

<!--------------------------------------------------------------------------------------------------------------------------->
	<script type="text/javascript">
		$(document).ready(function(){
			//http://www.alessioatzeni.com/blog/login-box-modal-dialog-window-with-css-and-jquery/
		});
	</script>













<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/modern-business.css"
	rel="stylesheet">

<!-- Bootstrap core JavaScript //이거 있으면 메뉴 작동 x
<script	src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
 -->
</head>
<body>
	<div class="bs-example" id="top-menu"> 
	    <div class="alert alert-info" style="margin-bottom: 0px;">
	        <a href="#" class="close" data-dismiss="alert">&times;</a>
	        <strong>Note!</strong> Open the output in a new blank tab if hover feature is not working due to small viewport size. Otherwise you can remove the CSS media query to enable it on all devices.
	    </div>
	    
	    <div id="login_state_bar">
	    <c:choose>
			<c:when test="${! login_chk}">				
				<div class="main-nav">
	    			<h5 class="state">
			    		<!-- <a href="join" class="menu_state" id="login">로그인</a>  -->    	
			    		<!-- <a href="join" target="_blank" class="menu_state">회원가입</a> -->
		    			<a class="cd-signin">로그인</a>
		    			<a class="cd-signup">회원가입</a>
		    			<a class="cd-signin" onclick="javascript:alert('로그인을 먼저하세요');">마이페이지</a>
	    			</h5>					
	    		</div>
	    		
	    		<jsp:include page="login_n_join.jsp"></jsp:include>
	    		
			</c:when>
			<c:otherwise>
				<div class="main-nav">
					<form id="signin_form">
		    			<h5 class="state">
				    		<a id="logout">로그아웃</a>
				    		<a href="sell_product?state=write">물건 판매</a>
			    			<a href="mypage">마이페이지</a>
		    			</h5>
	    			</form>
	    		</div>
			</c:otherwise>
		</c:choose>
	    </div> 
	     
	     
	     
	    
	     
		<div id="title_div">
			<h1><a href="main" id="title">안심거래</a></h1>
		</div>
	     <!--Navbar with dropdown menu-->
	    <nav id="myNavbar" class="navbar navbar-default" role="navigation" style="margin-bottom: 30px;">
	        <!-- Brand and toggle get grouped for better mobile display -->
	        <div class="container">
	            <div class="navbar-header">
	                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                    <span class="sr-only">Toggle navigation</span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                </button>
	                <!-- <a class="navbar-brand" href="#">안심거래</a>  -->
	            </div>
	
	
	            <!-- Collect the nav links, forms, and other content for toggling -->
	            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                <ul class="nav navbar-nav" id="big_list">
	                    <li><a href="main?list=masterpiece">수입명품</a></li>
	                    <li><a href="main?list=fashion">패션</a></li>
	                    <li class="dropdown">
	                        <a href="main?list=cosmetic_beauty" id="cosmetic_beauty" data-toggle="dropdown" class="dropdown-toggle">화장품/미용 <b class="caret"></b></a>
	                        <ul class="dropdown-menu">
	                            <li><a href="main?list=cosmetic_beauty&category=cosmetic">화장품</a></li>
	                            <li><a href="main?list=cosmetic_beauty&category=beauty">미용</a></li>
	                        </ul>
	                    </li>
	                    <li class="dropdown">
	                        <a href="main?list=electronic" data-toggle="dropdown" class="dropdown-toggle">전자기기 <b class="caret"></b></a>
	                        <ul class="dropdown-menu">
	                            <li><a href="main?list=electronic&category=mobile">모바일</a></li>
	                            <li><a href="main?list=electronic&category=computer_laptop">컴퓨터/노트북</a></li>
	                            <li><a href="main?list=electronic&category=camera_camcoder">카메라/캠코더</a></li>
	                            <li><a href="main?list=electronic&category=tv_pictureMachine">TV/영상기기</a></li>
	                            <li class="divider"></li>
	                            <li><a href="main?list=electronic&category=etcMachine">기타 기기</a></li>
	                        </ul>
	                    </li>
	                    
	                    <li><a href="main?list=education">교육</a></li>
	                    <li><a href="q_a">Q&A</a></li>
	                </ul>
	            </div>
	        </div>
	    </nav>
	    <!-- <hr> -->
	</div>
	
	
	
	
	
</body>
</html>