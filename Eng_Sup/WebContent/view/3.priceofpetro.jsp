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
		  	height: 1550px;
			margin: 20px auto; 
			clear: none;
			
		}
		 h2 {position: relative; left: 20px; font-size: 40px;}
		.browser{position: relative; left: 60px; }
		
		 .intro{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1430px;}
		 .intro > h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 50px;}
		
		 #price{width: 25%; height: 1400px; position: relative; left:10px;}
		 #price > h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 50px;}
		 #price ul{list-style-type: none; height:1350px; border-right: 1px dashed black;}
		 #price li{font-size: 20px; font-weight: bold; margin: 30px 0px 30px 30px;}
		
	</style>
	<script type="text/javascript">
		function find_go(f) {
			alert(f.unit.value);
		}
		
	</script>
	
	
</head>
<body>
	<jsp:include page="0.header.jsp"/>
	<div class="all-browsers">
		<h2> Petroleum </h2>
			
		<div id="price">
			<h3>Price of Products</h3>		
			<ul>			
				<c:forEach var="k" items="${plist}">
					<form method="post">
						<li>
							<a href="#">${k.unit} </a>
							<input type="hidden" name="unit"  value="${k.unit}">
						</li>
					</form>
				</c:forEach>
			</ul>
		
		</div>
	
	<c:choose>
	<c:when test="${unit eq 'Intro'}">
		<div class="intro" >
			<h3>Introduce of Products</h3>
			<article class="browser">
				<h3>Crude Oil</h3>
				<p>
					Unit(단위)은 물리량을 표시하는 문자 및 기호다. 각 국가 마다 달랐지만 글로벌 <br>
					화 가 되면서 많은 국가들이 국제표준(SI)에 따른다. 하지만, 영연방 국가, 미국 <br>
					등 영국에 영향을 받은 국가들은 British 단위를 지금도 쓰고 있기 때문에 설계를 <br>
					할 때 트러블이 생기지 않도록 단위환산을 해줘야한다. 
				</p>
			
			</article>
			<article class="browser">
				<h3>Heating Oil</h3>
				<p>
					Unit(단위)은 물리량을 표시하는 문자 및 기호다. 각 국가 마다 달랐지만 글로벌화가 되면서 많은 국가들이 국제표준(SI)에 따른다. <br>
					하지만, 영연방 국가, 미국 등 영국에 영향을 받은 국가들은 British 단위를 지금도 쓰고 있기 때문에 설계를 할 때 트러블이 생기지 <br>
					않도록 단위환산을 해줘야한다. 
				</p>
			
			</article>
			<article class="browser">
				<h3>Natural Gas</h3>
				<p>
					Unit(단위)은 물리량을 표시하는 문자 및 기호다. 각 국가 마다 달랐지만 글로벌화가 되면서 많은 국가들이 국제표준(SI)에 따른다. <br>
					하지만, 영연방 국가, 미국 등 영국에 영향을 받은 국가들은 British 단위를 지금도 쓰고 있기 때문에 설계를 할 때 트러블이 생기지 <br>
					않도록 단위환산을 해줘야한다. 
				</p>
			
			</article>
			<article class="browser">
				<h3> Naphtha</h3>
				<p>
					Unit(단위)은 물리량을 표시하는 문자 및 기호다. 각 국가 마다 달랐지만 글로벌화가 되면서 많은 국가들이 국제표준(SI)에 따른다. <br>
					하지만, 영연방 국가, 미국 등 영국에 영향을 받은 국가들은 British 단위를 지금도 쓰고 있기 때문에 설계를 할 때 트러블이 생기지 <br>
					않도록 단위환산을 해줘야한다. 
				</p>
			
			</article>
			<article class="browser">
				<h3>Ethylene</h3>
				<p>
					Unit(단위)은 물리량을 표시하는 문자 및 기호다. 각 국가 마다 달랐지만 글로벌화가 되면서 많은 국가들이 국제표준(SI)에 따른다. <br>
					하지만, 영연방 국가, 미국 등 영국에 영향을 받은 국가들은 British 단위를 지금도 쓰고 있기 때문에 설계를 할 때 트러블이 생기지 <br>
					않도록 단위환산을 해줘야한다. 
				</p>
			
			</article>
			<article class="browser">
				<h3>Propylene</h3>
				<p>
					Unit(단위)은 물리량을 표시하는 문자 및 기호다. 각 국가 마다 달랐지만 글로벌화가 되면서 많은 국가들이 국제표준(SI)에 따른다. <br>
					하지만, 영연방 국가, 미국 등 영국에 영향을 받은 국가들은 British 단위를 지금도 쓰고 있기 때문에 설계를 할 때 트러블이 생기지 <br>
					않도록 단위환산을 해줘야한다. 
				</p>
			
			</article>
			<article class="browser">
				<h3>HDPE</h3>
				<p>
					Unit(단위)은 물리량을 표시하는 문자 및 기호다. 각 국가 마다 달랐지만 글로벌화가 되면서 많은 국가들이 국제표준(SI)에 따른다. <br>
					하지만, 영연방 국가, 미국 등 영국에 영향을 받은 국가들은 British 단위를 지금도 쓰고 있기 때문에 설계를 할 때 트러블이 생기지 <br>
					않도록 단위환산을 해줘야한다. 
				</p>
			
			</article>
			<article class="browser">
				<h3>PP</h3>
				<p>
					Unit(단위)은 물리량을 표시하는 문자 및 기호다. 각 국가 마다 달랐지만 글로벌화가 되면서 많은 국가들이 국제표준(SI)에 따른다. <br>
					하지만, 영연방 국가, 미국 등 영국에 영향을 받은 국가들은 British 단위를 지금도 쓰고 있기 때문에 설계를 할 때 트러블이 생기지 <br>
					않도록 단위환산을 해줘야한다. 
				</p>
			
			</article>
			<article class="browser">
				<h3>참고문헌</h3>
				<p>
					Unit(단위)은 물리량을 표시하는 문자 및 기호다. 각 국가 마다 달랐지만 글로벌화가 되면서 많은 국가들이 국제표준(SI)에 따른다. <br>
					하지만, 영연방 국가, 미국 등 영국에 영향을 받은 국가들은 British 단위를 지금도 쓰고 있기 때문에 설계를 할 때 트러블이 생기지 <br>
					않도록 단위환산을 해줘야한다. 
				</p>
			
			</article>
		</div>
	</c:when>
	<c:otherwise>
		<div class="intro" >
			
		</div>
	</c:otherwise>
		
	</c:choose>

	
</div>


<jsp:include page="0.footer.jsp"/> 


</body>
</html>