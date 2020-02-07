<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>home test</title>
<link href="homeSet.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- header -->
	<div id="header">
		<div class="head_mid">
			<h1 class="logo">
				<a href="home.html"> <img src="h_logo.png" alt="국립목포대학교">
				</a>
			</h1>
		</div>
		<div class="Button">
			<button>로그인</button>
			<button>회원가입</button>
		</div>
		<nav>
			<ul>
				<li><a href="enroll.jsp">비교과 등록</a></li>
			</ul>
			<ul>
				<li><a href="manager.jsp">비교과 관리</a></li>
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
						<h3>로그인<h3>
						<div>
							<form method='post' action='logConn.jsp'>
								<table>
									<tr>
										<th>아이디 :</th>
										<td><input type="text" name='id'>
									</tr>
									<tr>
										<th>비밀번호 :</th>
										<td><input type="password" name = "passwd" minlegnth = "8" > 
									</tr>
									<tr>

										<td><input type="submit" value="로그인 "></td>
									</tr>
								</table>
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