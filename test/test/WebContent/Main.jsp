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
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/script.js" defer></script>
</head>
<body>
	<%
		// 현재 로그인 상태 판별 (vo == null => 비로그인상태)
		MemberVO vo = (MemberVO)session.getAttribute("user");
	%>
	<div class="wrap">
        <div class="circle">
            <a href="#"><span>GAME START</span></a>
        </div>
        
        <div class="tri">
            <img src="img/zz.png" alt="">
        </div>
        <%if(vo == null){%>
        <div class="squ">
            <div>
                <a href="#">LOGIN</a>
            </div>
            <div>
                <a href="#">JOIN</a>
            </div>
        </div>
        <%}else{ %>
        <div class="squ" style="width:400px;'">
            <div style="width:200px">
                <a href="Main.jsp">마이페이지</a>
            </div>
            <div style="width:200px">
                <a href="Logout">로그아웃</a>
            </div>
        </div>
        <span class="wc">WELCOME!<br> Your number is <%=vo.getUser_no() %></span>
        <%if(vo.getUser_id().equals("admin")) {%>
           	<a href="#" class="admin">유저 관리</a>
			<%} %>
        <%} %>
    </div>

    <div class="login">
        <span>로그인</span>
        <form action="Login" method="post">
            <input type="text" placeholder="ID" name="id">
            <input type="password" placeholder="PASSWORD" name="pw">
            <input class="login_btn" type="submit" value="LOGIN">
        </form>
        <div class="login_close"><img src="img/xx.png" alt=""></div>
    </div>

    <div class="join">
        <span>회원가입</span>
        <form action="Join" method="post">
            <div>
                <span>ID</span>
                <span>PASSWORD</span>
            </div>
            <div>
               <input type="text" name="id" id="name">
                <input type="password" name="pw"> 
            </div>
            <div>
                <input type="button" value="ID중복체크" onclick="idCheck()">
                <span id = "sp_result"></span>    
            </div>
            <div>
                <input class="join_btn" type="submit" value="JOINS">
                <input type="reset" value="RESET">    
            </div>
            
        </form>
        <div class="join_close"><img src="img/xx.png" alt=""></div>
    </div>
	    
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
			  }else{
				  $("#sp_result").text("사용 가능한 아이디");
			  }
		  },
		  error : function(){ //통신 실패
			  alert("통신 실패!!");
			}
	  	});
 	}
	</script>
</body>
</html>