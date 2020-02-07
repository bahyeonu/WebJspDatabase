<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<%
	String sid = null; 
	sid = (String)session.getAttribute("uid");
	if(sid == null)
		response.sendRedirect("home.html");
%>
<html>
<head>
<script>
    	function logout(){
    		location.href= "home.html";
    	}
    	function join(){
    		location.href="memberjoin.jsp";
    	}
    	function login(){
    		location.href= "loginPage.jsp";
    	}
    </script>
<title>home test</title>
<link href="homeSet.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- header -->
	<div id="header">
		<div class="head_mid">
			<h1 class="logo">
				<a href="welcome.jsp?id=<%=sid%>"> <img src="h_logo.png" alt="국립목포대학교">
				</a>
			</h1>
		</div>
		<div class="Button">
			<%
		
			if(sid != null){
				%>
			<h3><%=sid%>님 반갑습니다.
			</h3>
			<input type="button" name="join" value="로그아웃" onclick="logout();">
			<% 
			}
			else{
				%>
			<input type="button" name="login" value="로그인" onclick="login();">
			<input type="button" name="join" value="회원가입" onclick="join();">
			<% 
			}
		%>

		</div>
		<nav>
			<nav>
			<ul>
				<li><a href="enroll.jsp?id=<%= sid %>">비교과 등록</a></li>
			</ul>
			<ul>
				<li><a href="manager.jsp?id=<%=sid%>">비교과 관리</a></li>
			</ul>
			<ul>
				<li><a href="SearchPage.jsp?id<%=sid%>">비교과 검색</a></li>
			</ul>
			<ul>
				<li><a href="#">비교과 현황</a></li>
			</ul>
		</nav>


	</div>
	<!-- body  -->
	<div id="body">
		<div id="container">
			<div class="main">
				<div class="left-menu">left menu</div>
				<div class="content">
					<div class="article">
						<h3>비교과 과목 검색</h3>
						<form method = "post" action="Search.jsp">
						 <h4>	
						 <select name="searchType">
						 		<option value = "code">번호</option>
						 		<option value = "host">주최자</option>
						 		<option value ="title">제목</option>
						 	</select>
							<input type="search" name ="search">
							 <input type="submit" value = "검색"> 
							 </h4>
						</form>
						</div>
					</div>
					<div class="comment">comment</div>
				</div>
			</div>
		</div>

		<div id="footer"></div>
	</div>
</body>

</html>