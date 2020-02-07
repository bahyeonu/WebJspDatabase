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
				<a href="home.html"> <img src="h_logo.png" alt="국립목포대학교">
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
				<li><a href="SearchPage.jsp?id<%=sid%>">비교과 검색</a></li>
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
						<h3>비교과 과목 관리</h3>
						<div>
							<table class="bbs">
								<thead>
									<tr>
										<th><div>번호</div></th>
										<th><div>제목</div></th>
										<th><div>주최자</div></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<%
											Connection conn = null;
											PreparedStatement pstmt = null;
											ResultSet rs = null;

											try {
												String url = "jdbc:mysql://localhost:3306/extra";
												String id = "root";
												String pw = "zx636954";

												Class.forName("com.mysql.jdbc.Driver");
												conn = DriverManager.getConnection(url, id, pw);

												String sql = "select * from ext_curricular";
												pstmt = conn.prepareStatement(sql);

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
										<td><%=code%></td>
										<td>
											<div>

												<a href="posting.jsp?code=<%=code%>"><%=title%></a>
											</div>
										</td>
										<td><%=host%></td>
									<tr>
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
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="comment">comment</div>
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</div>
</body>
</html>


⑨disti.jsp
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.text.*" %>

<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	//int code = request.getParameter("code");

	class ext_curricular
	{
		public int code;
		public String title;
		public int numofpeople;
		
		public ext_curricular()
		{
			this.code = 0;
			this.title = "";
			this.numofpeople = 0;
		}
		
		public ext_curricular(int code)
		{
			this.code = code;
			this.title = "";
			this.numofpeople = 0;
		}
	}
	
	//ext_curricular myec = new ext_curricular(code);
	ext_curricular myec = new ext_curricular(3);
	ext_curricular[] ec = new ext_curricular[4];
	
	for(int i=0; i<4; i++)
		ec[i] = new ext_curricular();
	
	//í˜„ìž¬ ë¹„êµê³¼ ë§Œì¡±ë„
	int vs, ss, nt, sd, vd;
	vs = ss = nt = sd = vd = 0;
	
	//ì›”ë³„ í™œì„± ë¹„êµê³¼ ê°œìˆ˜
	String[] month = new String[12];
	int[] active_ec = new int[12];
%>


<%
	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/extra?serverTimezone=UTC";
	String db_id  = "root";
	String db_pw  = "zx636954";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, db_id, db_pw);
	}catch(Exception e)
	{
		out.println(e);
		return;
	}
	
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String sql;
%>	

<!--------------------------------ë§Œì¡±ë„ ì¡°ì‚¬---------------------------------------->
<!-- ë¹„êµê³¼ í…Œì´ë¸”ì—ì„œ ë¹„êµê³¼ ì œëª© ê°€ì ¸ì˜´ -->
<%
	sql = "select title from ext_curricular where code=?";
	try{
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, myec.code);
		rs = stmt.executeQuery();	
		
		while(rs.next())
		{
			myec.title = rs.getString("title");
		}
	}
	catch(Exception e){
		out.println(e);
	}
%>

<!-- ë§Œì¡±ë„ í…Œì´ë¸”ì—ì„œ ë§Œì¡±ë„ ê°€ì ¸ì˜´ -->
<%
	sql = "select satisfaction from satisfaction where code=?";
	try{
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, myec.code);
		rs = stmt.executeQuery();	
		
		while(rs.next())
		{
			int satisfaction = rs.getInt("satisfaction");
			switch(satisfaction)
			{
			case 0:
				vs++;
				break;
			case 1:
				ss++;
				break;
			case 2:
				nt++;
				break;
			case 3:
				sd++;
				break;
			case 4:
				vd++;
				break;
			default:
				break;
			}
		}
	}
	catch(Exception e){
		out.println(e);
	}
%>

<!--------------------------------ì¸ì› ë¹„êµ---------------------------------------->
<!-- ìƒìœ„ 4ê°œ ë¹„êµê³¼ì˜ ì •ë³´ë¥¼ ë¶ˆëŸ¬ì˜´ -->
<%
	sql = "select code, title, cur_numofpeople from ext_curricular order by cur_numofpeople desc";
	try{
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();	
		int i = 0;
		
		while(rs.next())
		{
			int temp_code = rs.getInt("code");
			String temp_title = rs.getString("title");
			int temp_numofpeople = rs.getInt("cur_numofpeople");
			
			if(i<4)
			{
				ec[i].code = temp_code;
				ec[i].title = temp_title;
				ec[i].numofpeople = temp_numofpeople;
				i++;
			}
			
			if(myec.code == temp_code)
			{
				myec.code = temp_code;
				myec.title = temp_title;
				myec.numofpeople = temp_numofpeople;
			}
		}
	}
	catch(Exception e){
		out.println(e);
	}
%>
<!--------------------------------ì›”ë³„ í™œì„±í™” ë¹„êµê³¼ ì°¾ê¸°---------------------------------------->
<%
	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
	
	//ì›”ë‹¬ì¼ ì´ˆ yy-dd-01
	Calendar scalendar = Calendar.getInstance();
	scalendar.add(Calendar.YEAR, -1);
	scalendar.add(Calendar.DATE, -scalendar.get(Calendar.DATE)+1);
	String scheck = dateformat.format(scalendar.getTime());
	
	//ì›”ë‹¬ì¼ ë§ yy-dd-29ì´ìƒ
	Calendar ecalendar = Calendar.getInstance();
	ecalendar.add(Calendar.YEAR, -1);
	ecalendar.add(Calendar.DATE, -ecalendar.get(Calendar.DATE)+1);
	ecalendar.add(Calendar.MONTH, 1);
	ecalendar.add(Calendar.DATE, -1);
	String echeck = dateformat.format(ecalendar.getTime());

	int i=0;
	int count=0;
	while(i<12)
	{
		sql = "select sdate, edate from ext_curricular where ";
		String sql2 = "(sdate <= \'" + scheck + "nd edate >= \'" + echeck + " + " or ";
		String sql3 = "(sdate between \'" + scheck + "nd \'" + echeck + "r edate between " + "\'" + scheck + "nd \'" + echeck + ";
		sql = sql + sql2 + sql3;
		count = 0;
		
		try{
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();	
			
			while(rs.next())
			{
				count++;
			}
		}
		catch(Exception e){
			out.println(e);
		}
		
		//out.print(sql + "/" + count + "/"+ i + "<br>");
		
		month[i] = Integer.toString(scalendar.get(Calendar.MONTH)+1) + "ì›”";
		active_ec[i] = count;	
		
		scalendar.add(Calendar.MONTH, 1);
		ecalendar.add(Calendar.DATE, -ecalendar.get(Calendar.DATE)+1);
		ecalendar.add(Calendar.MONTH, 2);
		ecalendar.add(Calendar.DATE, -1);
		
		scheck = dateformat.format(scalendar.getTime());
		echeck = dateformat.format(ecalendar.getTime());
		
		i++;
	}

%>
<html>
    <head>
    	<meta charset="utf-8">
        <title>chart</title>
        <link href="homeSet.css" rel = "stylesheet" type="text/css">
        
     	<!--Load the AJAX API-->
	    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript">
	      // Load the Visualization API and the corechart package.
	      google.charts.load('current', {'packages':['corechart']});
	    
	      // Set a callback to run when the Google Visualization API is loaded.
	      google.charts.setOnLoadCallback(drawChart);
	      google.charts.setOnLoadCallback(drawChart2);
	      google.charts.setOnLoadCallback(drawChart3);
	      // Callback that creates and populates a data table,
	      // instantiates the pie chart, passes in the data and
	      // draws it.
	      function drawChart() {
	
	        // Create the data table.
	        var data = new google.visualization.DataTable();
	        data.addColumn('string', 'Topping');
	        data.addColumn('number', 'Slices');
	        data.addRows([
	          ['매우 만족', <%=vs%>],
	          ['조금 만족', <%=ss%>],
	          ['보통', <%=nt%>],
	          ['조금 불만족', <%=sd%>],
	          ['매우 불만족', <%=vd%>]
	        ]);
	
	        // Set chart options
	        var title = '<%=myec.title%>'; 
	        var options = {'title': title.concat(' 만족도'),
	                       'width':600,
	                       'height':400};
	        ///////////////////////////////////////////////////////////////////
			var data2 = new google.visualization.DataTable();
			data2.addColumn('string', 'Title');
			data2.addColumn('number', 'Numofpeople');
			data2.addRows([
			  ['<%=ec[0].title%>', <%=ec[0].numofpeople%>],
			  ['<%=ec[1].title%>', <%=ec[1].numofpeople%>],
			  ['<%=ec[2].title%>', <%=ec[2].numofpeople%>],
			  ['<%=ec[3].title%>', <%=ec[3].numofpeople%>],
			  ['<%=myec.title%>', <%=myec.numofpeople%>]
			]);
			
			// Set chart options
			var options2 = {'title': '인원비교',
			               'width':600,
			               'height':400};
			//////////////////////////////////////////////////////////////////
			var data3 = new google.visualization.DataTable();
			data3.addColumn('string', 'Topping');
			data3.addColumn('number', '활성화된 비교과');
			data3.addRows([
			  ['<%=month[0]%>', <%=active_ec[0]%>],
			  ['<%=month[1]%>', <%=active_ec[1]%>],
			  ['<%=month[2]%>', <%=active_ec[2]%>],
			  ['<%=month[3]%>', <%=active_ec[3]%>],
			  ['<%=month[4]%>', <%=active_ec[4]%>],
			  ['<%=month[5]%>', <%=active_ec[5]%>],
			  ['<%=month[6]%>', <%=active_ec[6]%>],
			  ['<%=month[7]%>', <%=active_ec[7]%>],
			  ['<%=month[8]%>', <%=active_ec[8]%>],
			  ['<%=month[9]%>', <%=active_ec[9]%>],
			  ['<%=month[10]%>', <%=active_ec[10]%>],
			  ['<%=month[11]%>', <%=active_ec[11]%>],
			]);
			
			// Set chart options
			var title3 = "<%=myec.title%>"; 
			var options3 = {'title': title.concat(' 만족도'),
			               'width':600,
			               'height':400};	       
		
	        $(".tablinks[title='Toko']").click()
	        $(".tablinks[title='Paris']").click()
	        $(".tablinks[title='London']").click()	
	        
	        // Instantiate and draw our chart, passing in some options.
	        var chart = new google.visualization.PieChart(document.getElementById('chart_satisfy'));
	        chart.draw(data, options);

		    var chart2 = new google.visualization.PieChart(document.getElementById('chart_compare'));
		    chart2.draw(data2, options2);
		   
		    var chart3 = new google.visualization.LineChart(document.getElementById('chart_compare2'));
		    chart3.draw(data3, options3);
	    }
	    </script>
   	    <script type="text/javascript" src="jquery.js"></script>
	    <script type="text/javascript" src="tabjs.js"></script>
    </head>
    
    <body>
        <!-- header -->
        <div id="header">
                <div class = "head_mid">
                    <h1 class = "logo">
                        <a href = "welcome.jsp">
                            <img src = "h_logo.png" alt = "국립목포대학교">
                        </a>
                    </h1>
                </div>
                <div class ="Button">
                   <button>로그인</button>
                   <button>회원가입</button>
                </div>
                <nav>
                    <ul>
                         <li>
                             <a href = "#">비교과 등록</a> 
                        </li>  
                    </ul>
                    <ul>
                         <li> 
                             <a href = "#">비교과 관리</a>
                             </li> 
                    </ul>
                    <ul>
                        <li> 
                            <a href = "#"> 교과 검색</a>
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
                    		<h1>그래프 자료</h1>
							<!-- Tab links -->
							<div class="tab">
							  <button class="tablinks" title="London">연도 현황</button>
							  <button class="tablinks" title="Paris">인원 비교</button>
							  <button class="tablinks" title="Tokyo">만족도</button>
							</div>
							
							<!-- Tab content -->
							<div id="London" class="tabcontent">
							  <h3>만족도</h3>
							  <p>비교과 과정에 참여한 사람들이 평가한 만족도 입니다.</p>
							  <div id="chart_satisfy"></div>
							</div>
							
							<div id="Paris" class="tabcontent">
							  <h3>인원</h3>
							  <p>다른 비교과 과정과 인원 수를 비교합니다.</p>
							  <div id="chart_compare"></div>
							</div>
							
							<div id="Tokyo" class="tabcontent">
							  <h3>연도 현황</h3>
							  <p>올해의 월별로 활성화된 비교과 수를 표시합니다.</p>
							  <div 
id="chart_compare2"></div>
							</div>
                    	</div>
                       	<div class = "comment">comment</div>
                    </div>
            	</div>
            </div>
            <div id = "footer"></div>
    	</div> 
    </body>

</html>