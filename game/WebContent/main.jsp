<%@page import="model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="css/main.css" />
		<noscript><link rel="stylesheet" href="css/noscript.css" /></noscript>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
		<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
		<style>
		 #start{
		 font-size : 25px;
		 color : mintcream;
		 }
	
		</style>
</head>
<body  class="is-preload">

		<%
			// 현재 로그인 상태 판별 (vo == null => 비로그인상태)
			MemberVO vo = (MemberVO)session.getAttribute("user");
		%>

<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="logo">
							<a href=#><p id="start">GAME START</p></a>
						</div>
						<div class="content">
							<div id="triangle"></div>
							
							
						</div>
						<nav>
							<%if(vo == null){%>
							<ul>
								<li><a href="#work"><br>login</a></li>
								<li><a href="#Join"><br>Join</a></li>
							</ul>
							<%}else{ %>
							<p>WELCOME!<br> Your number is <%=vo.getUser_no() %></p>
							<ul>
								<li><a href="#">개인정보수정</a></li>
								<li><a href="Logout">로그아웃</a></li>
								<%if(vo.getUser_no().equals("21")) {%>
								<li><a href="#">유저 관리</a></li>
								<%} %>
							</ul>
							<%} %>
														
						</nav>
	
						
					</header>

				<!-- Main -->
					<div id="main">
					

					

						<!-- Work -->
							<article id="work">
								<nav id="menu">	
									<ul class="links">
										<li><h5>로그인</h5></li>
											<form action="Login" method="post">
												<li><input name="id" type="text" placeholder="ID을 입력하세요"></li>
												<li><input name="pw" type="password" placeholder="PW를 입력하세요"></li>
												<li><input type="submit" value="Login" class="primary"/></li>
												<span id = "sp_result"></span>
											</form>
									</ul>
								</nav>			
							</article>

						<!-- join -->
							<article id="Join">
								<h2 class="major">Join</h2>
								<form method="post" action="Join">
									<div class="fields">
										<div class="field half">
											<label for="name">ID</label>
											<input type="text" name="id" id="name"><br>
											<input type="button" value="ID중복체크" onclick="idCheck()">
											<span id = "sp_result"></span>
										</div>
										<div class="field half">
											<label for="email">Password</label>
											<input type="password" name="pw" id="email" />
										</div>
									
									</div>
									<ul class="actions">
										<li><input type="submit" value="Joins" class="primary"/></li>
										<li><input type="reset" value="Reset" /></li>
									</ul>
								</form>
								
							</article>					

					</div>

				<!-- Footer -->
					<footer id="footer">
						
					</footer>

			</div>
	
		<!-- BG -->
			<div id="bg"></div>

		<!-- Scripts -->
			<script src="js/jquery.min.js"></script>
			<script src="js/browser.min.js"></script>
			<script src="js/breakpoints.min.js"></script>
			<script src="js/util.js"></script>
			<script src="js/main.js"></script>

			<audio autoplay controls>
				<source src="../img/squidgame.mp3" type="audio/mp3">      
			</audio>
			<script>
			 function idCheck(){
				 
				var input = document.getElementById("name");
				
				  $.ajax({
					  type : "post", //데이터 전송(요청) 방식
					  data : {"id" : input.value}, //전송하는 데이터
					  url : "idcheck", //데이터를 전송하는(요청하는) 서버 페이지 url
					  dataType : "text", //응답데이터의 형식
					  success : function(data){ //통신 성공
						  var sp_result = document.getElementById("sp_result"); 
						  
						  if(data=="true"){
							  sp_result.innerText = "사용 불가능한 아이디";
							  input.value="";
						  }else{
							  $("#sp_result").text("사용 가능한 아이디");
							  alert($("#sp_result").text());
						  }
					  },
					  error : function(){ //통신 실패
						  alert("통신 실패!!")
					  }
						
				  })
			 }
			
			</script>
			

</body>
</html>