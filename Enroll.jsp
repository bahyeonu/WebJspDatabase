<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<%
	String id = null; 
	id = (String)session.getAttribute("uid");
	if(id == null)
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
				<a href="welcome.jsp?id=<%=id%>"> <img src="h_logo.png" alt="국립목포대학교">
				</a>
			</h1>
		</div>
		<div class="Button">
			<%
		
			if(id != null){
				%>
			<h3><%=id%>님 반갑습니다.
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
			<ul>
				<li><a href="enroll.jsp?id<%=id%>">비교과 등록</a></li>
			</ul>
			<ul>
				<li><a href="manager.jsp?id<%=id%>">비교과 관리</a></li>
			</ul>
				<ul>
				<li><a href="SearchPage.jsp?id<%=id%>">비교과 검색</a></li>
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
						<h3>비교과 과목 등록</h3>
						<div>
							<form method='post' action='send.jsp'>
								<table>
									<tr>
										<th>이름 :</th>
										<td><input type="text" name='title'>
									</tr>
									<tr>
										<th>설명 :</th>
										<td><input type="text" name="discription" maxlength="30">
									</tr>
									<tr>
										<th>대상 :</th>
										<td><input type="checkbox" name="target" value="1">초등학생
											<input type="checkbox" name="target" value="2">중학생 <input
											type="checkbox" name="target" value="3">고등학생 <input
											type="checkbox" name="target" value="4">대학생 <input
											type="checkbox" name="target" value="0">기타</td>
									</tr>
									<tr>
										<th>주최자 :</th>
										<td><input type="text" name="host"></td>
									</tr>
									<tr>
										<th>시작 일정 :</th>
										<td><input type="date" name="sdate"></td>
									</tr>
									<tr>
										<th>종료 일정 :</th>
										<td><input type="date" name="edate"></td>
									</tr>
									<tr>
										<th>강의 시간 :</th>
										<td><p>시작 시간: <input type="time" name="stime"></p></td>
										<td><p>종료 시간: <input type="time" name="etime"></p></td>
									</tr>
									<tr>
										<th>연관 계열 :</th>
										<td><input type="checkbox" name="collage" value="0">없음
											<input type="checkbox" name="collage" value="1">인문 <input
											type="checkbox" name="collage" value="2">사회과학 <input
											type="checkbox" name="collage" value="4">자연과학 <input
											type="checkbox" name="collage" value="8">공과 <br><input
											type="checkbox" name="collage" value="16">경영 <input
											type="checkbox" name="collage" value="32">생활과학에술체육 <input
											type="checkbox" name="collage" value="64">사범 <input
											type="checkbox" name="collage" value="128">약학</td>
									</tr>
									<tr>
										<th>인원 :</th>
										<td>
											<p>최소: <input type="text" name="cur_numofpeople"></p></td>
											<td><p>최대 : <input type="text" name="max_numofpeople"></p>
										</td>

									</tr>

									<tr>

										<td><input type="submit" value="등록"></td>
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