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
					<div class="article">
						<h3>비교과 과목 게시물</h3>
						<div class="articleHead"></div>
						<div class="bbsArticle">
							<table>
								<thead>
									<tr>
										<th>주최자</th>
										<th>내용</th>
										<th>날짜         </th>
										<th>강의 시간          </th>
									</tr>
								</thead>
								<tbody>
									<%
										Connection conn = null;
										PreparedStatement pstmt = null;
										ResultSet rs = null;
										String ahr = null;
										try {
											String url = "jdbc:mysql://localhost:3306/extra";
											String id = "root";
											String pw = "zx636954";

											Class.forName("com.mysql.jdbc.Driver");
											conn = DriverManager.getConnection(url, id, pw);
											String column = request.getParameter("code");
											ahr = column;
											String sql = "select * from ext_curricular where code = ?";

											pstmt = conn.prepareStatement(sql);
											pstmt.setString(1, column);
											rs = pstmt.executeQuery();

											while (rs.next()) {
												String code = rs.getString("code");
												String title = rs.getString("title");
												String discription = rs.getString("discription");
												String target = rs.getString("target");
												String host = rs.getString("host");
												String sdate = rs.getString("sdate");
												String edate = rs.getString("edate");
												String stime = rs.getString("stime");
												String etime = rs.getString("etime");
												String max_numofpeople = rs.getString("max_numofpeople");
												String cur_numofpeople = rs.getString("cur_numofpeople");
												String college = rs.getString("college");
												String postdate = rs.getString("postdate");
												String posttime = rs.getString("posttime");
									%>
									<tr>
										<td width="100"><%=host%></td>
										<td width="150"><%=discription%></td>
										<td width="200"><%=sdate%>~<%=edate%></td>
										<td width="100"><%=stime%>~<%=etime%></td>

									</tr>
									<%
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

<script>
	  	function Del()
		{
			if(confirm("정말 삭제하시겠습니까?")){
				
							<%		/*  			  	
	   	  String col =null;
		 	  col = request.getParameter("code");
		  try{
			  String url = "jdbc:mysql://localhost:3306/extra";
			  String id = "root";
			 String pw = "zx636954";
													         
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,id,pw);
													         
			 String sql = "DELETE FROM ext_curricular WHERE code = ?";
			pstmt = conn.prepareStatement(sql);
		 pstmt.setString(1, col);
													         
	    pstmt.executeUpdate();
													      
		 }catch(Exception e){
		  e.printStackTrace();
		  out.println(e);
		 }finally{
			if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		      if(conn != null)try{conn.close();}catch(SQLException sqle){
		    	  }
		      }
							*/			     
					   %>
				
				window.open("Delete.jsp?code="+<%=ahr%>,"a","width=400,height=200,left=100,top=20");
				location.href="manager.jsp";
			}else
				alert("삭제가 취소 되었습니다.")
				return ;
			}
	  	function adjust(){
	  		location.href="adjust.jsp?code="+<%=ahr%>;
	  	}
	  	
	  	
 </script>


									<tr>
										<td><input type="button" value="수정" onclick ="adjust();"></td>
										<td><input type="button" value="삭제" onclick="Del();"></td>
										 <form method ="post" action ="evaluation.jsp">
 											<input type="hidden" name = "code" value="<%=ahr %>">
 												<td><input type="submit" value="평가하기" ></td>
 											</form>
										
					
									</tr>
								</tbody>
							</table>
							</div>
						</div>
					 <div class="comment">comment</div>
			</div>
			<div id="footer"></div>
		</div>
</body>
</html>