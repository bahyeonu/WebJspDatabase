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
   
      try{
         String url = "jdbc:mysql://localhost:3306/extra"; //jdbc:mysql://(ip):(포트)/(데이터베이스 이름)
         String id = "root"; //DB USER ID
         String pw = "1234"; //DB USER PASSWORD
         
         Class.forName("com.mysql.jdbc.Driver"); 
         conn = DriverManager.getConnection(url,id,pw); //DB이름, ID, PASSWORD
         
         String sql = "INSERT INTO ext_curricular values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; //SQL 구문
         pstmt = conn.prepareStatement(sql); 
         pstmt.setString(1, "1"); //nt
         pstmt.setString(2, "게임특강"); //title varchar
         pstmt.setString(3, "게임 만드는법"); //discription varchar
         pstmt.setString(4, "1"); //target int
         pstmt.setString(5, "최제성"); //host varchar
         pstmt.setString(6, "20181215"); //sdate date
         pstmt.setString(7, "20181216"); //edate date
         pstmt.setString(8, "180000"); //stime time
         pstmt.setString(9, "200000"); //etime time
         pstmt.setString(10,"10"); //max_numofpeople int
         pstmt.setString(11, "1"); //cur_numofpeople int
         pstmt.setString(12, "2"); //college int
         pstmt.setString(13, "20181214"); //postdate date
         pstmt.setString(14, "120000"); //posttime time
         
         pstmt.executeUpdate();   //SQL 실행후 갱신      
         
         out.println("등록성공");
      
      }catch(Exception e){ //DB 연결 실패시
         e.printStackTrace();
         out.println(e);
      }finally{
         if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){} //SQL 실행 실패시
         if(conn != null)try{conn.close();}catch(SQLException sqle){} //연결 실패시
      }
   %>
</body>
</html>