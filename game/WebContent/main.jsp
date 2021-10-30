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
		<style>
		 #start{
		 font-size : 25px;
		 color : mintcream;
		 }
	
		</style>
</head>
<body  class="is-preload">
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
							<ul>
								
								<li><a href="#work"><br>login</a></li>
								<li><a href="#Join"><br>Join</a></li>
								
								<!--<li><a href="#elements">Elements</a></li>-->
							</ul>
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
											<input type="text" name="id" id="name" />
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

</body>
</html>