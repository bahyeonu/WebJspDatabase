<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <%
   
      Connection conn = null; //연결할 때 필요
      PreparedStatement pstmt = null; //쿼리 실행할 때 필요
     
   		int n=0;
      try{
         String url = "jdbc:mysql://localhost:3306/extra"; //jdbc:mysql://(ip):(포트)/(데이터베이스 이름)
         String id = "root"; //DB USER ID
         String pw = "zx636954"; //DB USER PASSWORD
         String mid = request.getParameter("id");
         String mpw = request.getParameter("passwd");
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(url,id,pw); //DB이름, ID, PASSWORD

         String sql = "INSERT INTO member values(?,?)"; //SQL 구문
         pstmt = conn.prepareStatement(sql); //SQL 구문 실행
         pstmt.setString(1, mid);
         pstmt.setString(2, mpw); //title varchar
         
         n=pstmt.executeUpdate();   //SQL 실행후 갱신      */
      
      }catch(Exception e){ //DB 연결 실패시
         e.printStackTrace();
         out.println(e);
      }finally{
         if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){} //SQL 실행 실패시
         if(conn != null)try{conn.close();}catch(SQLException sqle){} //연결 실패시
      }
   %>
         <script type = "text/javascript">
   	if(<%=n%> > 0){
   		alert("회원가입 완료!");
   		location.href="home.html";
   	}
   	else {
   		alert("가입 오류!");
   		location.href="memberjoin.jsp";
   	}
   </script>
</body>
</html>