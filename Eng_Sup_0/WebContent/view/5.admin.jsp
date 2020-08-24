<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Engineering Support_Admin </title>
	<style type="text/css">
		/*헤더*/
		#main_header>div {
			margin: 0 auto;
			width: 1500px;
		}
		
		#main_header button {
			width: 100px;
			font-size: 20px;
		}
		
		#main_header>div>h1 {
			font-size: 50px
		}
		
		/*메인화면: 회원관리*/
		.member {
			height: 30px;
		}
		
		#login {
			position: relative;
			left: 1400px;
			bottom: 5px;
		}
		
		#logout {
			position: relative;
			left: 1280px;
			bottom: 5px;
		}
		
		#mypage {
			position: relative;
			left: 1400px;
			bottom: 34.5px;
		}
		
		/*메인화면: 메뉴판*/
		
		#main_body>ul {
			overflow: hidden;
			list-style-type: none;
			background-color: #333;
			text-align: center;
			font-size: 25px;
			width: 1500px;
			color: white;
			margin: 15px auto;
			padding-inline-start: 0px;
		}
		
		#main_body>ul>li {
			float: left;
			width: 25%;
		}
		
		#main_body>ul>li a {
			display: block;
			padding: 14px 0px;
		}
		
		#main_body>ul>li a:hover {
			background-color: #111111;
		}

	</style>
	<script type="text/javascript">
		function log_in() {
			location="/Controller?cmd=login0";
			
			document.getElementById("login").style.display= "none";
			document.getElementById("logout").style.display= "block";
			document.getElementById("mypage").style.display= "block";
		}
		
		function log_out() {
			document.getElementById("login").style.display= "block";
			document.getElementById("logout").style.display= "none";
			document.getElementById("mypage").style.display= "none";
		}
		
		function member_go() {
			location.href="/Controller?cmd=member";
		}
		
		function petro_go() {
			location.href="/Controller?cmd=petro_list"	
		} 
		
		

	</script>
</head>
<body>
<header>
<div id="main_header" >
		<div>
			<h1> Administrator </h1>
		</div>
		<div class="member">
			<c:choose>
				<c:when test="${login=='ok'}">
					<p> ${mvo.m_name}님 환영합니다.</p>
					<button id ="logout" onclick="log_out()" style="display: none;">Logout </button> 			
				</c:when>
				<c:otherwise>
					<button id ="login" onclick="log_in()">Login </button> 	
				</c:otherwise>
			</c:choose>	
			
		</div>
		
	</div>
</header>
<div id="main_body">
	<ul>
		<li><a onclick="member_go()">회원관리</a></li>
		<li><a onclick="petro_go()">Petroleum 정보</a></li>
		<li><a onclick="#">기타</a></li>
		<li><a>Calculation</a></li>
	</ul>
</div>
</body>

</html>