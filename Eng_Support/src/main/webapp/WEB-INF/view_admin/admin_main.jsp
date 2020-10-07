<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Engineering Support_Admin </title>
	<style type="text/css">
		/*헤더*/
		#main_header>div {margin: 0 auto; width: 1500px;}
		#main_header button {width: 100px;font-size: 20px;}
		#main_header>div>h1 {font-size: 50px}
		#main_header p{text-align:center; font-size: 28px; }
		
		/*메인화면: 회원관리*/
		.member {height: 50px;}
				
		#logout {position: relative; left: 1350px; bottom: 40px;}
			
		/*메인화면: 메뉴판*/
		
		#main_body{margin-top: 100px;}
		
		#main_body>ul {
			overflow: hidden;
			list-style-type: none;
			background-color: #333;
			text-align: center;
			font-size: 35px;
			width: 550px;
			color: white;
			margin: 25px auto;
			padding-inline-start: 0px;
		}
		
		#main_body>ul>li {height: 25%;}
		#main_body>ul>li a {display: block;  padding: 24px 0px;}
		#main_body>ul>li a:hover {background-color: #111111;}
		
	</style>
	<script type="text/javascript">
		function log_out() {
			location.href="logout_admin.do";
		}
		
		function member_go() {
			location.href="mlist_go.do";
		}
		
		function petro_go() {
			location.href="plist_go.do";	
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
			<p> 관리자님 환영합니다.</p>
			<button id ="logout" onclick="log_out()">Logout </button> 			

		</div>
		
	</div>
</header>
<div id="main_body">
	<ul>
		<li><a onclick="member_go()">회원관리</a></li>
		<li><a onclick="petro_go()">Petroleum 정보</a></li>
		<li><a onclick="#">관리자 개인정보</a></li>
		<li><a>공란</a></li>
	</ul>
</div>
</body>

</html>