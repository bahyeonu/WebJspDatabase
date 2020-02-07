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
<%
	request.setCharacterEncoding("utf-8");

      Connection conn = null;
      PreparedStatement pstmt = null;
      String column = null;
      int n =0;
      
      java.text.SimpleDateFormat nowDate = new java.text.SimpleDateFormat("yyyyMMdd");
      java.text.SimpleDateFormat nowTime = new java.text.SimpleDateFormat("HHmmss");
      String postdate = nowDate.format(new java.util.Date());
      String posttime = nowTime.format(new java.util.Date());
      String code = null;
   
      try{
    	
         String url = "jdbc:mysql://localhost:3306/extra";
         String id = "root";
         String pw = "zx636954";
          code = request.getParameter("code");
         String title = request.getParameter("title");
         String disc = request.getParameter("discription");
       	 String[] target = request.getParameterValues("target");
         String host = request.getParameter("host");
         String sdate = request.getParameter("sdate");
         String edate = request.getParameter("edate");
         String stime = request.getParameter("stime");
         String etime = request.getParameter("etime");
         String max_numOfPeople = request.getParameter("max_numofpeople");
         String min_numOfPeople = request.getParameter("cur_numofpeople");
         String[] collages = request.getParameterValues("collage");
         
         String temp;
         String colltemp;
         int target1 = 0; 
         int coll =0;  
         
       	 for(int i =0;i<target.length;i++){
        		if(target[i] != null){
        			target1 = target1 |Integer.parseInt(target[i])  ;
        		}
        	
        	}
       	for(int j =0;j<collages.length;j++){
      		 if(collages[j] != null)
      		 {
      			 coll = coll | Integer.parseInt(collages[j]);
      		 }
      	 }
        temp = Integer.toString(target1);
        colltemp = Integer.toString(coll);
         column = code;
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(url,id,pw);
         
         String sql = "UPDATE ext_curricular SET title=?, discription=?, target=?, host=?, sdate=?, edate=?, stime=?, etime=?, max_numofpeople=?, cur_numofpeople=?, college=?, postdate=?, posttime=? WHERE code=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, title); //title varchar
         pstmt.setString(2, disc); //discription varchar
         pstmt.setString(3, temp); //target int
         pstmt.setString(4, host); //host varchar
         pstmt.setString(5, sdate); //sdate date
         pstmt.setString(6, edate); //edate date
         pstmt.setString(7, stime); //stime time
         pstmt.setString(8, etime); //etime time
         pstmt.setString(9, max_numOfPeople); //max_numofpeople int
         pstmt.setString(10, min_numOfPeople); //cur_numofpeople int
         pstmt.setString(11, colltemp); //college int
         pstmt.setString(12, postdate); //postdate date
         pstmt.setString(13, posttime); //posttime time
         pstmt.setString(14, column); //(A, "B") A가 물음표 번호라고 보면됨 이거 Code에 "1"넣는다는 의미임 int
         
         n=pstmt.executeUpdate();
      
      }catch(Exception e){
         e.printStackTrace();
         out.println(e);
      }finally{
         if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
         if(conn != null)try{conn.close();}catch(SQLException sqle){}
      }
   %>
    <script type = "text/javascript">
   	if(<%=n%> > 0){
   		alert("수정 완료!");
   		location.href="adjust.jsp?code="+<%=code%>;
   	}
   	else {
   		alert("수정 오류!");
   		location.href="adjust.jsp";
   	}
   </script>
</body>
</html>

⑴homeSet.css
@charset "EUC-KR";

#header{
    width : 100%;
    height : 180px;
    margin : 0 auto;
 //   background-color : #3dd330;
    z-index: 100;
}

#body{
    width : 100%;
    height : 700px;
    margin : auto; 
 //   background-color:   #6f81d1;
}

#container{
    width : 100%;
    height : 600px;
    margin : auto;
//    background-color : #bd7246;
}

#footer{
    width:100%;
    height : 100px;
    margin : auto;
  //  background-color : #d8cb51;
}

.logo{
    position : absolute;
    top : 20px;
    left : 20px;
}

.Button{
    text-align: right;
    padding-left : 30px;
    padding-right : 30px; 
    position : relative;
}

nav{
    margin : 0 auto;
    padding : 60px;
    width : 100%;
    height : 100px;
}
nav ul{
    margin : 0 auto;
    padding : 0;
    width : 730px;
}

nav ul li{
    list-style:  none;
    float : left;

}

li a{
    padding: 30px;
    margin: 0 auto;
    text-decoration:  none;
}


.menu{
    width: 300px;
    height: 40apx;
/*    border: 2px solid #09c;*/
//    background-color: #d7f5ff;
}
.main{
    float:left;
    position : relative;
    width : 100%;
    height : 600px;
    padding : 0;
    margin :  auto;
}
.main .left-menu{
    float: left;
    width: 50px;
    height: 600px;
  /*  border: 2px solid red;
   // background-color: #ffe7d5;*/
}
.main .content{
    float: left;
    width : 750px;
    height: 600px;
}
.main .content .article{
    height: 500px;
  /*  border: 2px solid blue;*/
  //  background-color: #e2e9ff;
}
.main .content .comment{
    height: 50px;
   /* border: 2px solid purple;*/
  //  background-color: #ffddff;
}
table.bbs{
	    width: 100%;
  /* border-collapse: collapse;*/
    position: relative;
    zoom: 1;
    overflow-x: hidden;
}

.articleHead{
	padding: 13px 0;
    padding-right: 10px;
    height: 34px;
    border-bottom: 1px solid #e3e3e3;
    position: relative;
}
.bbsArticle{
	    min-height: 40px;
    _height: 40px;
    padding: 11px 0;
    word-wrap: break-word;
  //  background-color: #fff;
}

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons that are used to open the tab content */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}

.tabcontent active{
}
