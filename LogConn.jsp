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
      ResultSet rs = null;
      String redirectUrl = null;
      int n=0;
   		String mid=null;
   		String mpw;
   		
      try{
         String url = "jdbc:mysql://localhost:3306/extra"; //jdbc:mysql://(ip):(포트)/(데이터베이스 이름)
         String id = "root"; //DB USER ID
         String pw = "zx636954"; //DB USER PASSWORD
         mid = request.getParameter("id");
         mpw = request.getParameter("passwd");
         
         Class.forName("com.mysql.jdbc.Driver"); //프로젝트 우클릭 -> 속성 -> 자바 빌드 패스 -> 라이브러리 -> 클래스패스에 mysql.jar 추가
         conn = DriverManager.getConnection(url,id,pw); //DB이름, ID, PASSWORD
         
         String user_id = mid;
         String user_passwd = mpw;
         String sql = "SELECT password FROM member WHERE id = \""+user_id+"\"";
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         
         String password = null;
         
         while(rs.next()){
            password = rs.getString("password");
         }
         if(password == null){
            out.println("등록기록 없음");
         }
         else if(password.equals(user_passwd)){
            out.println("로그인됨");
            n= 1;
            session.setAttribute("uid", mid);
            redirectUrl = "welcome.jsp?id="+mid;
            response.sendRedirect(redirectUrl);
          
         }else{
            out.println("로그인 안됨");
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
   	if(<%=n%> > 0){
   		alert("로그인  완료!");
   		location.href = <%=redirectUrl%>;	
   	}	
   	else {
   		alert("로그인 오류!");
   		location.href="loginPage.jsp";
   	}
   </script>
</body>
</html>