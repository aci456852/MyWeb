<%@ page language="java" import="java.util.*,Bean.*,Dao.*,Utils.*,java.sql.ResultSet,java.sql.Statement,
java.sql.Connection,java.sql.PreparedStatement" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>用户管理</title>
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Room Design Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style2.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/flexslider.css" rel="stylesheet" type="text/css" media="screen" property="" />

<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- font-awesome-icons -->
<link href="css/font-awesome1.css" rel="stylesheet"> 
<!-- //font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Shadows+Into+Light+Two&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Cinzel" rel="stylesheet">              
</head>
	
<body>
<!-- banner -->

<div class="banner" style="position: fixed;width: 2000px;">
		<div class="container">	
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					
					<h1><a class="navbar-brand" href="adminQuestion.jsp">The<span>Wise </span></a></h1>
				</div>
				
				<div class="collapse navbar-collapse navbar-right " id="bs-example-navbar-collapse-1">
					<nav>
							<ul class="nav navbar-nav link-effect-14" id="link-effect-14">
								<li><a href="list.doAdminUsers"><span style="font-size: 25px;">用户管理</span></a></li>
								<li><a href="listforAdmin.doQuestion"><span style="font-size: 25px;">提问管理</span></a></li>
								<li><a href="listforAdmin.doResponse"><span style="font-size: 25px;">回答管理</span></a></li>
								<li><a href="listforAdmin.doMessages"><span style="font-size: 25px;">留言管理</span></a></li>
								<li><a href="login.jsp"><span style="font-size: 25px;">注销</span></a></li>
					        </ul>						
					</nav>	
				</div>				
			</nav>			
		</div>
	</div>
<div style="margin-top:100px;float: left; background-color: #2E6DA4;width: 350px;text-align: center; position: fixed;">
		<nav>
			<ul style="list-style: none;"  class="nav" >
				<img src="images/tx.png" />
				<div style="margin-top: 10px;margin-bottom: 20px;"><font style="color:#C9E2B3;">admin</font></div>
				<div style="margin-top: 10px;margin-bottom: 20px;"><font style="color:#C9E2B3;">管理员</font></div>
				<br /><li><a href="list.doAdminUsers"><span><font color="orange" size="6" >用户管理</font></span></a></li>
				<br /><li><a href="listforAdmin.doQuestion"><span><font color="honeydew" size="6" >提问管理</font></span></a></li>
				<br /><li><a href="listforAdmin.doResponse"><span><font color="honeydew" size="6" >回答管理</font></span></a></li>
				<br /><li><a href="listforAdmin.doMessages"><span><font color="honeydew" size="6" >留言管理</font></span></a></li>
                <br /><li><a href="login.jsp"><span><font color="honeydew" size="6" >注销</font></span></a></li>						
			</ul>							
</nav>	
</div>
<div class="welcome">
	<div class="container">
		<div class="ab-w3l-spa"   style="margin-top: 200px;">
                <label class="wel" style="margin-left:480px;"></label>
				<h2 class="w3ls_head">用户管理</h2>					
				<hr />
			<div class="bs-docs-example">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>序号</th>
							<th>用户名</th>
							<th>用户密码</th>
							<th>用户昵称</th>
							<th>年龄</th>
							<th>性别</th>
							<th>删除</th>
						</tr>
					</thead>
					<tbody>
					<%
						int pages=0;            //待显示页面
					    int count=0;            //总条数
					    int totalpages=0;        //总页数
					    int limit=5;            //每页显示记录条数    
					    //计算记录总数的第二种办法：使用mysql的聚集函数count(*)
					    Connection conn=DBUtils.getConnection();
					    PreparedStatement statement=conn.prepareStatement("select count(*) from User;");
						ResultSet sqlRst=statement.executeQuery();
					    //ResultSet sqlRst = sqlStmt.executeQuery("select count(*) from User;");
					    if(sqlRst.next()){
					        count = sqlRst.getInt(1);//结果为count(*)表，只有一列。这里通过列的下标索引（1）来获取值
					    }    
					    //由记录总数除以每页记录数得出总页数
					    totalpages = (int)Math.ceil(count/(limit*1.0));
					    //获取跳页时传进来的当前页面参数
					    String strPage = request.getParameter("pages");
					    //判断当前页面参数的合法性并处理非法页号（为空则显示第一页，小于0则显示第一页，大于总页数则显示最后一页）
					    if (strPage == null) { 
					        pages = 1;
					    } else {
					        try{
					            pages = java.lang.Integer.parseInt(strPage);
					        }catch(Exception e){
					            pages = 1;
					        }
					        
					        if (pages < 1){
					            pages = 1;
					        }
					        
					        if (pages > totalpages){
					            pages = totalpages;
					        }                            
					    }
					    //由(pages-1)*limit算出当前页面第一条记录，由limit查询limit条记录。则得出当前页面的记录
					    //sqlRst = sqlStmt.executeQuery("select * from User order by user_id limit " + (pages - 1) * limit + "," + limit);
					    PreparedStatement statement2=conn.prepareStatement("select * from User order by uid limit " + (pages - 1) * limit + "," + limit);
						ResultSet rs=statement2.executeQuery();
					    String  Username, Password, Secondname,Sex,Email,Tximg,Motto,Hobby;
					    int Uid,Age;
					    while (rs.next()){
	                    	Uid = rs.getInt("uid");
	                    	Username = rs.getString("username");
	                    	Password = rs.getString("password");
	                    	Secondname = rs.getString("secondname");
	                    	Age = rs.getInt("age");
	        				Sex = rs.getString("sex");
						%>
						<tr>
							<td><%=Uid %></td>
							<td><%=Username %></td>
							<td><%=Password %></td>
							<td><%=Secondname %></td>	
							<td><%=Age %></td>
							<td><%=Sex %></td>
							<td><a href="delete.doAdminUsers?uid=<%=Uid %>" style="color: #D58512;">删除</a></td>	
						</tr>
						<%
	                    	}
            			%>
					</tbody>
				</table>
				<!-- 分页 -->
				<div >
				  <div style="text-align:center">
				    <ul class="pagination">
				      	<li> <a href="adminUsers.jsp?pages=1">首页</a></li> 
				      	<% if(pages>=3){ %>
				      	<li> <a href="adminUsers.jsp?pages=<%=(pages<1)?pages:(pages-2) %>"> <%= pages-2 %></a></li>
				      	<%}
				      	if(pages>=2){%>
				     	<li> <a href="adminUsers.jsp?pages=<%=(pages<1)?pages:(pages-1) %>"> <%= pages-1 %></a> </li>
				     	<%}%>
				      	<li class="active"> <a href="adminUsers.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages)%>"><%= pages %></a> </li>
				      	<%if(pages<=totalpages-1){%>
				      	<li> <a href="adminUsers.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages+1)%>"><%= pages+1 %></a> </li>
				      	<%}
				      	if(pages<=totalpages-2){%>
				      	<li> <a href="adminUsers.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages+2)%>"><%= pages+2 %></a> </li>
				       	<%} %>
				       	<li> <a href="adminUsers.jsp?pages=<%=totalpages%>">尾页</a> </li>
				       	<li> <a href="">共<%=totalpages%>页</a> </li>
				    </ul>
				  </div>
			</div>
			<!-- 
				<form name="f1" method="POST" action="adminUsers.jsp" onSubmit="return checknum()">
		            <table border="0" align="center" >
		                <tr>
		                    <td>第<%=pages%>页   共<%=totalpages%>页 <a href="adminUsers.jsp?pages=1">首页</a></td>
		                    <td><a href="adminUsers.jsp?pages=<%=(pages<1)?pages:(pages-1) %>"> 上一页</a></td>
		                    <td><a href="adminUsers.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages+1)%>"> 下一页</a></td>
		                    <td><a href="adminUsers.jsp?pages=<%=totalpages%>">最后一页</a></td>
		                    <td>转到第:<input type="text" name="page" size="8">页
		                    <input type="submit" value="GO" name="cndok"></td>
		                </tr>
		            </table> 
				 </form>
			-->
			</div>
		</div>
	</div>
</div>
   
	<script defer src="js/jquery.flexslider.js"></script>
	<script type="text/javascript">
		$(window).load(function(){
		  $('.flexslider').flexslider({
			animation: "slide",
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
		});
  </script>
<!-- //flexSlider -->
<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
</body>
</html>