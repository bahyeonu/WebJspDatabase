<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
        <%@ page import="java.sql.*" %>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
      <div>
           <%
           String sid=(String)session.getAttribute("uid");
           request.setCharacterEncoding("utf-8");
      
           Connection conn = null; //연결할 때 필요
           PreparedStatement pstmt = null; //쿼리 실행할 때 필요
           ResultSet rs = null;
           int n =0;
              
           try{
              String url = "jdbc:mysql://localhost:3306/extra"; //jdbc:mysql://(ip):(포트)/(데이터베이스 이름)
              String id = "root"; //DB USER ID
              String pw = "zx636954"; //DB USER PASSWORD
              
              String code = request.getParameter("code");
       		  String radioTxt = request.getParameter("radioTxt");
        	  String mid = sid;
         
              Class.forName("com.mysql.jdbc.Driver"); 
              conn = DriverManager.getConnection(url,id,pw); //DB이름, ID, PASSWORD
             String sql = "INSERT INTO satisfaction values(?,?,?)"; //SQL 구문
              pstmt = conn.prepareStatement(sql);   
  
         Class.forName("com.mysql.jdbc.Driver");
      //   conn = DriverManager.getConnection(url,id,pw);
         
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, code); 
         pstmt.setString(2, mid); 
         pstmt.setString(3, radioTxt); 
         
       	n = pstmt.executeUpdate();   //SQL 실행후 갱신      
        if(n>0)
        {
        	%>
        	<script type="text/javascript">
        	alert("전송완료!");
        	</script>	
        	<% 
        	String redirectURL = "posting.jsp?code="+code;
        	 response.sendRedirect(redirectURL);
        }
     
      }catch(Exception e){ //DB 연결 실패시
         e.printStackTrace();
         out.println(e);
      }finally{
         if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){} //SQL 실행 실패시
         if(conn != null)try{conn.close();}catch(SQLException sqle){} //연결 실패시
      }
   %>
   <script type = "text/javascript">
   	if(! <%=n%> >0){
   		alert("전송 오류!");
   		location.go(-1);
   	}
   </script>
            </div>
</body>
</html>