<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<%
	String sid = null;
	sid = (String) session.getAttribute("uid");
	if (sid == null)
		response.sendRedirect("home.html");
%>
<html>
<head>

<script>
	function logout() {
		location.href = "home.html";
	}
	function join() {
		location.href = "memberjoin.jsp";
	}
	function login() {
		location.href = "loginPage.jsp";
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
				if (sid != null) {
			%>
			<h3><%=sid%>님 반갑습니다.
			</h3>
			<input type="button" name="join" value="로그아웃" onclick="logout();">
			<%
				} else {
			%>
			<input type="button" name="login" value="로그인" onclick="login();">
			<input type="button" name="join" value="회원가입" onclick="join();">
			<%
				}
			%>
		</div>
		<nav>
			<ul>
				<li><a href="enroll.jsp?id=<%= sid %>">비교과 등록</a></li>
			</ul>
			<ul>
				<li><a href="manager.jsp?id=<%=sid%>">비교과 관리</a></li>
			</ul>
			<ul>
				<li><a href="#">비교과 검색</a></li>
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
						<h1>비교과 과목 강의 만족도 조사</h1>
						<form method='post' action='enter_evaluation.jsp'>
							<input type="hidden" name="code"
								value=<%=request.getParameter("code")%>>
							<li><input type="radio" name="radioTxt" value="4" checked>매우
								만족</li>
							<li><input type="radio" name="radioTxt" value="3">만족
							</li>
							<li><input type="radio" name="radioTxt" value="2">보통
							</li>
							<li><input type="radio" name="radioTxt" value="1">불만
							</li>
							<li><input type="radio" name="radioTxt" value="0">매우
								불만</li> <input type="submit" value="등록">
						</form>
					</div>
					<div class="comment">comment</div>
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</div>
</body>
</html>