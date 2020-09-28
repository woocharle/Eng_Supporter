<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Engineering Support</title>
	<style type="text/css">
		.fonelist{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1500px; text-align: center; overflow: auto;}
		.fonelist p {font-size: 20px;}
		.fonelist h3{position: relative; left: 40px; font-size: 30px; margin-bottom: 50px;}
		#update{font-size: 22px; margin-bottom: 50px; margin: 0 auto;
				width:950px; height: 700px;  border-collapse: collapse;
		}	
		#update input{font-size: 22px; text-align: center;}
		#update textarea{font-size: 18px;}
		#update th, td {border: 1px solid black; }
		
		
		#answer1{margin: 0 auto; font-size: 22px; width:950px; margin-top: 75px; border-collapse: collapse;} 
		#answer1 input{font-size: 22px; text-align: center;}
		
		.answer2{margin: 0 auto; font-size: 22px; width:950px; margin-top: 40px; border-collapse: collapse;} 
		.answer2 input{font-size: 22px; text-align: center;}
		
		.tf{background-color: #333; color: white; height: 45px; width: 20%; }

	
	</style>
	<script type="text/javascript">
		function update_ok(f) {			
			if(f.pwd.value == f.pass.value){
				f.action = "fupdate1.do";
				f.submit();
			}else{
				alert("비밀번호가 틀립니다.\n다시입력해주세요");
				f.pwd.value="";
				f.pwd.focus();
				return;
			}	
		}	
		
		function delete_ok(f) {
			if(f.pwd.value == f.pass.value){
				f.action = "fdelete1.do";
				f.submit();
			}else{
				alert("비밀번호가 틀립니다.\n다시입력해주세요");
				f.pwd.value="";
				f.pwd.focus();
				return;
			}				
		}
		
		function comment_go(f) {
			f.action="finsert2.do"
			f.submit();			
		}
		
		function c_update_ok(f) {			
			var chk = confirm("정말 수정할까요?");
			if(chk){
				f.action="fupdate2.do";
				f.submit();
			} else {
				return;
			}

		}	
		
		function c_delete_ok(f) {
			var chk = confirm("정말 삭제할까요?");
			if(chk){
				f.action="fdelete2.do";
				f.submit();
			} else {
				return;
			}	
		}
	</script>
</head>
<body>
	<div class="fonelist">
		<p>[<a href="mypage.do?page=faq&cPage=${cPage}"> 목록으로 가기 </a>]</p>
		<form method="post">
			<table id="update">
				<caption  style=" font-size:30px; margin-bottom:10px; height: 60px;">게시판 글쓰기</caption>
				<tbody>
					<tr>
						<th class="tf">작성자</th>
						<td align="center"><input type="text" name="writer" value="${vo3.writer}" readonly></td>
					</tr>
					<tr>
						<th class="tf">제목</th>
						<td align="center"> <input type="text" name="subject" value="${vo3.subject}" style="width: 600px; text-align: left;" ></td>
					</tr>
					<tr>
						<th style="background-color: #333; color: white;">내용</th>
						<td align="center">
							 <script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
							 <textarea name="content">${vo3.content}</textarea>
		               		 <script>
		                       	CKEDITOR.replace('content');
		                       	CKEDITOR.config.width = 700;
		                       	CKEDITOR.config.height = 450;
		                    	CKEDITOR.config.fontSize_defaultLabel = '20px';
		               		</script>
						</td>
					</tr>
					<tr>
						<th class="tf">공개 여부</th>
						<td align="center">
							<input type="radio" name="open_close" value="open" <c:if test="${vo3.open_close eq 'open'}">checked </c:if>> 
							<label for="open">공개</label>
							&nbsp;&nbsp;
							<input type="radio" name="open_close" value="close" <c:if test="${vo3.open_close eq 'close'}">checked </c:if>>
							<label for="close">비공개</label>							
						
						</td>
					</tr>
					<tr>
						<th class="tf">비밀번호</th>
						<td align="center">
							<input type="password" name="pwd">
							<input type="hidden" name="pass" value="${vo3.pwd}">
						</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 50px;">
							<input type="button" value="수정" onclick="update_ok(this.form)" /> 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="삭제" onclick="delete_ok(this.form)"/>					
						</td>
					</tr>
		            </tbody>				
				</tbody>
			</table>
 		</form>
 		<form method="post">
			<table id="answer1"> 
				<caption style=" font-size:25px; margin-bottom:10px; height: 60px;"> 답변하기 </caption>
				<tr>
					<td class="tf">이름: </td>
					<td><input type="text" name="writer" size="15" value="${mvo.m_name}" style="border: none;"/></td>
				</tr>
				<tr>
					<td class="tf">내용: </td>
					<td><textarea rows="8" cols="70" name="content" style="font-size: 18px;"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="height: 50px;">
						<input type="button" value="댓글 쓰기"  onclick="comment_go(this.form)"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="취소" />			
						<input type="hidden" name="b_idx" value="${vo3.b_idx}">
						<input type="hidden" name="a_id" value="${mvo.m_id}">
					</td>
				</tr>
			</table>
		 </form>
		<br>
		<hr>
		
		<h3> 댓글 </h3>
		<c:forEach var="k" items="${alist}">
			<form method="post">	
				<table class="answer2">
					<tbody>
						<tr>
							<td class="tf">이름: </td>
							<td> ${k.writer} </td>
						</tr>
						<tr>
							<td class="tf">날짜: </td>
							<td> ${k.writedate.substring(0,10)} </td>
						</tr>
						<tr>
							<td class="tf">내용: </td>
							<td><textarea rows="8" cols="100" name="content">${k.content}</textarea></td>						
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								<c:if test="${mvo.m_id eq 'admin'|| mvo.m_id eq k.a_id}">
									<input type="button" name="c_update_ok" value="댓글수정" onclick="c_update_ok(this.form)"/>
									<input type="button" id="c_delete_go" value="댓글삭제" onclick="c_delete(this.form)"/>
								</c:if>
								<input type="hidden" name="a_idx" value="${k.a_idx}">
								<input type="hidden" name="b_idx" value="${k.b_idx}">					
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		<br><br>	
	
		</c:forEach>		

	</div>

</body>
</html>