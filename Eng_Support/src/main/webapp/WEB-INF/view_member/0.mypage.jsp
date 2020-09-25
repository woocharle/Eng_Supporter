<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Engineering Support </title>
	<style type="text/css">
		.all-browsers {
		  	padding: 5px;
		  	width:1500px;
		  	height: 1500px;
			margin: 20px auto; 
			clear: none;
			
		}
		 h2 {position: relative; left: 20px; font-size: 40px;}

		.intro{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1430px;}
		.intro h3{position: relative; left: 40px; font-size: 30px; margin-bottom: 50px;}
		.intro table{position: relative; left: 60px; font-size: 20px; margin-bottom: 50px; width:1050px;}
		
		#list{width: 25%; height: 1400px; position: relative; left:10px;}
		#list > h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 50px;}
		#list li{font-size: 30px; font-weight: bold; margin: 80px 0px 80px 10px;}
		#list1 {list-style-type: none; height:1350px; border-right: 1px dashed black; padding-top: 10px;}


		#list a{text-decoration:none;}
		#list a:link {color: black;}
		#list a:visited {color: black;}
		#list a:hover {color: black; text-decoration: underline;}

		/* paging */
		table tfoot ol.paging {
			list-style: none;
		}
		
		table tfoot ol.paging li {
			float: left;
			margin-right: 8px;
		}
		
		table tfoot ol.paging li a {
			display: block;
			padding: 3px 7px;
			border: 1px solid #00B3DC;
			color: #2f313e;
			font-weight: bold;
		}
		
		table tfoot ol.paging li a:hover {
			background: #00B3DC;
			color: white;
			font-weight: bold;
		}
		
		.disable {
			padding: 3px 7px;
			border: 1px solid silver;
			color: silver;
		}
		
		.now {
			padding: 3px 7px;
			border: 1px solid #ff4aa5;
			background: #ff4aa5;
			color: white;
			font-weight: bold;
		}	


	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		
		
	</script>
	
	
</head>
<body>
<jsp:include page="../view_user/0.header.jsp"/>
<div class="all-browsers">
	<h2> MyPage </h2>
		
	<div id="list">	
		<ul id="list1">					
			<li><a href="mypage.do?page=faq"> FAQ </a></li>
			<c:if test="${mvo.m_id ne 'admin'}"><li><a href="mypage.do?page=revise"> 개인정보 수정 </a></li></c:if>
			<c:if test="${mvo.m_id eq 'admin'}"><li><a href="admin_main.do"> 관리자 페이지</a></li></c:if>
			<c:if test="${mvo.m_id ne 'admin'}"><li><a href="mypage.do?page=revise2"> 비밀번호 수정 </a> </li></c:if>
			<c:if test="${mvo.m_id ne 'admin'}"><li><a href="mypage.do?page=drop"> 회원탈퇴 </a> </li></c:if>
		
		</ul>
	
	</div>
	

	<c:if test="${page eq 'faq'}">
		<div class="intro" >
			<table summary="게시판 목록">
				<caption>게시판 목록</caption>
				<thead>
					<tr class="title" style="background-color: #333; color: white;">
						<th style="width:15%">번호</th>
						<th style="width:25%">제목</th>
						<th style="width:30%">글쓴이</th>
						<th style="width:30%">날짜</th>
					</tr>			
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="4"><h2> 자료가 존재하지 않습니다.</h2></td>						
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${list}" varStatus="vs">
								<tr>
									<td>${((paging.nowPage-1))*paging.numPerpage + vs.index + 1}</td>
									<td><a href="onelist.do?b_idx=${k.b_idx}&cPage=${paging.nowPage}">${k.subject}</a></td>
									<td>${k.writer}</td>
									<td>${k.writedate.substring(0,10)}</td>
								</tr>					
							</c:forEach>
						
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3">
							<ol class="paging">
							<!-- 이전 -->
							<c:choose>
								<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
									<li class="disable">이전으로</li>
								</c:when>
								<c:otherwise>
									<li><a href="mypage.do?page=faq&cPage=${paging.beginBlock-paging.pagePerBlock }">이전으로</a></li>
								</c:otherwise>						
							</c:choose>
							
							<!-- 블록안에 들어간 페이지번호들 -->
							<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
								<!-- 현재 페이지이냐 아니야 구분 -->
								<c:choose>
									<c:when test="${k==paging.nowPage}">
									    <li class="now">${k}</li>	
									</c:when>
									<c:otherwise>
										<li><a href="mypage.do?page=faq&cPage=${k}">${k}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 다음 -->
							<c:choose>
								<c:when test="${paging.endBlock >= paging.totalPage }">
									<li class="disable">다음으로</li>
								</c:when>
								<c:otherwise>
									<li><a href="mypage.do?page=faq&cPage=${paging.beginBlock+paging.pagePerBlock }">다음으로</a></li>
								</c:otherwise>
							</c:choose>												
							
							</ol>
						</td>
						<td>
							<button onclick="write_go()">글쓰기</button>
						</td>
					</tr>					
			
				</tfoot>
		</table>			
		</div>
	</c:if>
	<c:if test="${page eq 'revise'}"><jsp:include page="0.faq.jsp"/></c:if>
	<c:if test="${page eq 'drop'}"><jsp:include page="0.revise.jsp"/></c:if>
	
</div>

<br>
	
<jsp:include page="../view_user/0.footer.jsp"/> 


</body>
</html>