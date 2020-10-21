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

		.intro{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1500px;}
		.intro h3{position: relative; left: 40px; font-size: 30px; margin-top:100px;  margin-bottom: 50px;}
		.intro table{
			position: relative; left: 60px; 
			font-size: 20px; width:900px; 
			border-collapse:collapse; 
			border: 1px solid black;}
		.intro th{font-size: 20px; background-color: #333; color: white; font-weight: normal; height: 40px;}
		.intro td{border: 1px solid black; text-align: center;}
		
		#list{width: 25%; height: 1400px; position: relative; left:10px;}
		#list > h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 50px;}
		#list li{font-size: 30px; font-weight: bold; margin: 80px 0px 80px 10px;}
		#list1 {list-style-type: none; height:1350px; border-right: 1px dashed black;}


		#list a{text-decoration:none;}
		#list a:link {color: black;}
		#list a:visited {color: black;}
		#list a:hover {color: black; text-decoration: underline;}

	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		function write_go(f) {
			location.href="fwrite.do";
		}
		
	</script>
	
	
</head>
<body>
	<jsp:include page="../view_user/0.header.jsp"/>
	<div class="all-browsers">
		<h2> MyPage </h2>
			
		<div id="list">	
			<ul id="list1">					
				<li><a href="mypage.do?page=faq"> FAQ </a></li>
				<c:if test="${vo1.m_id ne 'admin'}"><li><a href="mypage.do?page=revise"> 개인정보 수정 </a></li></c:if>
				<c:if test="${vo1.m_id eq 'admin'}"><li><a href="admin_main.do"> 관리자 페이지</a></li></c:if>
				<c:if test="${vo1.m_id ne 'admin'}"><li><a href="mypage.do?page=revise2"> 비밀번호 수정 </a> </li></c:if>
				<c:if test="${vo1.m_id ne 'admin'}"><li><a href="mypage.do?page=drop"> 회원탈퇴 </a> </li></c:if>
			
			</ul>
		
		</div>
		
	
		<c:if test="${page eq 'faq'}">
			<c:if test="${finish eq 'ok'}"><jsp:include page="../view_admin/alarm.jsp"/></c:if>
			<div class="intro" >
				<h3> FAQ</h3>
				<br>
				<table>
					<thead>
						<tr style=" ">
							<th style="width:10%">번호</th>
							<th style="width:45%">제목</th>
							<th style="width:15%">글쓴이</th>
							<th style="width:10%">공개여부</th>
							<th style="width:20%">날짜</th>
						</tr>			
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="5" style="text-align: center; height: 100px;">
										<span style="font-weight: bold; font-size: 30px;">자료가 존재하지 않습니다.</span>
									</td>						
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="k" items="${list}" varStatus="vs">
									<tr>
										<td>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerpage + vs.index)}</td>
										<td><a href="fonelist.do?b_idx=${k.b_idx}&cPage=${paging.nowPage}">${k.subject}</a></td>
										<td>${k.writer}</td>
										<td>
											<c:choose>
												<c:when test="${k.open_close eq 'close'}">
													비공개
												</c:when>
												<c:otherwise>
													공개
												</c:otherwise>											
											</c:choose>
										</td>
										<td>${k.writedate.substring(0,10)}</td>
									</tr>					
								</c:forEach>
							
							</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center; height: 40px;">
								<!-- 이전 -->
								<c:choose>
									<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
										<span style="color:lightgray;">이전으로&nbsp;&nbsp;</span>						
									</c:when>
									<c:otherwise>
										<a href="mypage.do?page=faq&cPage=${paging.beginBlock-paging.pagePerBlock}"><span style="color:black;">이전으로&nbsp;&nbsp;</span></a>
									</c:otherwise>
								</c:choose>		
								
								<!-- 페이지 번호 -->
								<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
									<!-- 현재페이지이냐, 아니냐 구분 -->
									<c:choose>
										<c:when test="${k == paging.nowPage }">
											<font style="font-weight: bold;">${k}</font>
										</c:when>
										<c:otherwise>
											<a href="mypage.do?page=faq&cPage=${k}"><font style="font-weight: bold; color: tomato">${k}</font></a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<!-- 이후-->
								<c:choose>
									<c:when test="${paging.endBlock >= paging.totalBlock}">
										<span style="color:lightgray;">&nbsp;&nbsp;다음으로</span>						
									</c:when>
									<c:otherwise>
										<a href="mypage.do?page=faq&cPage=${paging.beginBlock+paging.pagePerBlock}"><span style="color:black;">&nbsp;&nbsp;다음으로</span></a>
									</c:otherwise>
								</c:choose>										
							</td>
							<td style="text-align: center; ">
								<button  style="width:80px; font-size: 18px;"  onclick="write_go()">글쓰기</button>
							</td>
						</tr>					
					</tfoot>
				</table>			
			</div>
		</c:if>
		<c:if test="${page eq 'revise'}"><jsp:include page="0.revise.jsp"/></c:if>
		<c:if test="${page eq 'revise2'}"><jsp:include page="0.revise2.jsp"/></c:if>
		<c:if test="${page eq 'drop'}"><jsp:include page="0.drop.jsp"/></c:if>
		<c:if test="${page eq 'fwrite'}"><jsp:include page="0.fwrite.jsp"/></c:if>
		<c:if test="${page eq 'fonelist'}"><jsp:include page="0.fonelist.jsp"/></c:if>
		
	</div>
	
	<br>
		
	<jsp:include page="../view_user/0.footer.jsp"/> 
	

</body>
</html>