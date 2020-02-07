<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
    <script>
    	function join(){
    		location.href="memberjoin.jsp";
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
                   <input type= "button" name = "login" value ="로그인" >
                   <input type= "button" name = "join" value ="회원가입" onclick ="join();" >
                </div>
                <nav>
                    <ul>
                         <li>
                             <a href ="enroll.jsp">비교과 등록</a> 
                        </li>  
                    </ul>
                    <ul>
                         <li> 
                             <a href = "manager.jsp">비교과 관리</a>
                             </li> 
                    </ul>
                    <ul>
                        <li> 
                            <a href = "#">비교과 검색</a>
                         </li>
                    </ul>
                    <ul>
                        <li> 
                            <a href = "#">비교과 현황</a>
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
                             	<h3>회원가입</h3>
							<div>
							<form method='post' action='joinComp.jsp'>
								<table>
									<tr>
										<th>ID :</th>
										<td><input type="text" name='id'>
									</tr>
									<tr>
										<th>password :</th>
										<td><input type="password" name="passwd" minlength="8" placeholder =" 8자리 이상">
									</tr>
									<tr>

										<td><input type="submit" value="등록"></td>
									</tr>
								</table>
							</form>
                               </div>
                               <div class = "comment">comment</div>
                        </div>
                </div>
            </div>
            <div id = "footer"></div>
            </div> 
    </body>
</html>