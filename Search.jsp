<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	 request.setCharacterEncoding("utf-8");
   	String sid = null; 
	sid = (String)session.getAttribute("uid");
	ArrayList<String> sTitle = new ArrayList<String>();
	ArrayList<String> sHost = new ArrayList<String>();
	ArrayList<String> sCode = new ArrayList<String>();
	
	if(sid == null)
		response.sendRedirect("home.html");
      Connection conn = null;
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
   	  String redirectURL;
      try{
         String url = "jdbc:mysql://localhost:3306/extra";
         String id = "root";
         String pw = "zx636954";
         
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(url,id,pw);
         
         String searchType = request.getParameter("searchType");
       
         String keyword = request.getParameter("search");
         
         if (searchType.equals("code")){
        	 searchType = searchType + "=";
         }else {
        	 searchType = searchType + " LIKE";
            keyword = "%"+keyword+"%";
         }

         String sql = "select code, title, host from ext_curricular where "+searchType+" ?";
       //  out.println(sql);
      //   out.println(keyword);
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, keyword);
         
         rs = pstmt.executeQuery();
    
         while(rs.next()){
            String uCode = rs.getString("code");
            String title = rs.getString("title");
            String host = rs.getString("host");
			
            sCode.add(uCode) ;
            sTitle.add(title);
            sHost.add(host);
            session.setAttribute("sCode",sCode);
            session.setAttribute("sTitle",	sTitle);
            session.setAttribute("sHost", sHost);
            
         }
         

        
      	 redirectURL = "SearchCompPage.jsp?id="+sid+sCode.size();
  
         response.sendRedirect(redirectURL);
      }catch(Exception e){
         e.printStackTrace();
         out.println(e);
      }finally{
         if(rs != null)try{rs.close();}catch(SQLException sqle){}
         if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
         if(conn != null)try{conn.close();}catch(SQLException sqle){}
      }
   %>
</body>
</html>