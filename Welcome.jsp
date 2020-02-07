<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@ page import="java.sql.*" %>
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
    </script>
        <title>home test </title>
        <link href="homeSet.css" rel = "stylesheet" type="text/css">
    </head>
    <body>
        <!-- header -->
        <div id="header">
                <div class = "head_mid">
                    <h1 class = "logo">
                        <a href = "#">
                            <img src ="h_logo.png"  alt = "국립목포대학교">
                        </a>
                    </h1>
                </div>
                <div class ="Button">
                  <h3><%= id %>님 반갑습니다.</h3>
                   <input type= "button" name = "join" value ="로그아웃" onclick ="logout();" >
                </div>
                <nav>
                    <ul>
                         <li>
                             <a href ="enroll.jsp?id=<%= id %>">비교과 등록</a> 
                        </li>  
                    </ul>
                    <ul>
                         <li> 
                             <a href = "manager.jsp?id=<%=id %>">비교과 관리</a>
                             </li> 
                    </ul>
                    <ul>
                        <li> 
                            <a href = "SearchPage.jsp?=<%=id%>">비교과 검색</a>
                         </li>
                    </ul>
                    <ul>
                        <li> 
                            <a href = "disti.jsp?=<%=id%>">비교과 현황</a>
                         </li> 
                    </ul>
                </nav>
               
        </div>
        <!-- body  -->
        <div id = "body">
            <div id = "container">
                <div class = "main">
                        <div class = "left-menu"> left menu</div> 
                        <div class = "content">
                               <div class = "article">
                             
                               </div>
                               <div class = "comment">comment</div>
                        </div>
                </div>
            </div>
            <div id = "footer"></div>
            </div> 
    </body>
</html>
