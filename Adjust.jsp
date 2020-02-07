<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
					<div class="aritcle">
						<h3>비교과 과목 관리(수정)</h3>
						<%
							request.setCharacterEncoding("utf-8");
					      
							Connection conn = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							String column = null;
							String code = null;
							String title = null;
							String discription = null;
							String target = null;
							String host = null;
							String sdate = null;
							String edate = null;
							String stime = null;
							String etime = null;
							String posttime = null;
							String max_numofpeople = null;
							String postdate = null;
							String cur_numofpeople = null;
							String college = null;
							try {
								String url = "jdbc:mysql://localhost:3306/extra";
								String id = "root";
								String pw = "zx636954";

								Class.forName("com.mysql.jdbc.Driver");
								conn = DriverManager.getConnection(url, id, pw);

								column = request.getParameter("code");
								
								String sql = "select * from ext_curricular where code = ?";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, column);

								rs = pstmt.executeQuery();

								while (rs.next()) {
									code = rs.getString("code");
									title = rs.getString("title");
									discription = rs.getString("discription");
									target = rs.getString("target");
									host = rs.getString("host");
									sdate = rs.getString("sdate");
									edate = rs.getString("edate");
									stime = rs.getString("stime");
									etime = rs.getString("etime");
									max_numofpeople = rs.getString("max_numofpeople");
									cur_numofpeople = rs.getString("cur_numofpeople");
									college = rs.getString("college");
									postdate = rs.getString("postdate");
									posttime = rs.getString("posttime");

								}

							} catch (Exception e) {
								e.printStackTrace();
								out.println(e);
							} finally {
								if (rs != null)
									try {
										rs.close();
									} catch (SQLException sqle) {
									}
								if (pstmt != null)
									try {
										pstmt.close();
									} catch (SQLException sqle) {
									}
								if (conn != null)
									try {
										conn.close();
									} catch (SQLException sqle) {
									}
							}
						%>
						<form method="submit" action="update.jsp">

							<div>
								<table>
									<input type = "hidden" name = "code" value = <%=code%>>
									<tr>
										<th>제목 :</th>
										<td><input type="text" name="title" value=<%=title%>></td>
									</tr>
									<tr>
										<th>설명 :</th>
										<td><textarea name="discription" cols=50 rows=5><%=discription%></textarea>
										</td>
							 </tr>
							<tr>
							<th>대상</th>
							<td>
							<input type="checkbox" name="target" value="1">초등학생 
                            <input type="checkbox" name="target"
											value="2">중학생  
                             <input type="checkbox" name="target"
											value="3">고등학생
                            <input type="checkbox" name="target"
											value="4">대학생  
                             <input type="checkbox" name="target"
											value="0">기타
							</td>
							</tr>
							<tr>
								<th>
									주최자 : 
								</th>
								<td><input type="text" name="host" value=<%=host%>></td>
							</tr>
							<tr>
								<th>일정 : </th>
								<td>
								<input type="date" name="sdate" value=<%=sdate%>>~
								<input type="date" name="edate" value=<%=edate%>>
								</td>
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
								<th>시간 : </th>
								<td>
								<input type="time" name="stime" value=<%=stime%> min="00:00"
											max="24:00">~
								<input type="time" name="etime" value=<%=etime%> min="00:00"
											max="24:00"> 
								</td>
							</tr>
							<tr>
								<th>인원 : </th>
								<td>
								<p>최소: </p> 
								<input type="text" name="cur_numofpeople"
											value=<%=cur_numofpeople%>>
								<p>최대 : </p>
								<input type="text" name="max_numofpeople"
											value=<%=max_numofpeople%>>
								</td>
								
							</tr>
							
									<tr>
										
										<td><input type="submit" value="등록"></td>
										<td><input type="reset" value ="취소"></td>
									</tr>
							
						</table>
						</div>
						</form>
	
					</div>
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</div>
</body>
</html>
