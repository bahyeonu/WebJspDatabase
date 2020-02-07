<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
        <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript">
	function delNow(){
			<%	   	
		      Connection conn = null;
		      PreparedStatement pstmt = null;
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
		         if(conn != null)try{conn.close();}catch(SQLException sqle){}
		      }
		   %>
		}
	function cancle(){
		location.href="posting.jsp"
	}
	</script> 
<title>Insert title here</title>
</head>
<body>
<h2>삭제 하시겠습니까?</h2>
	<input type="button" value ="예" onclick="delNow();">
	<input type="button" value ="아니오" onclick="cancle();">
	
</body>
</html>