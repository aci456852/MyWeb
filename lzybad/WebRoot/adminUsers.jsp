<%@ page language="java" import="java.util.*,Bean.*,Dao.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>用户管理</title>

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
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
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
								<li><a href="adminUsers.jsp"><span style="font-size: 25px;">用户管理</span></a></li>
								<li><a href="adminQuestion.jsp"><span style="font-size: 25px;">提问管理</span></a></li>
								<li><a href="adminResponse.jsp"><span style="font-size: 25px;">回答管理</span></a></li>
								<li><a href="adminResponse.jsp"><span style="font-size: 25px;">留言管理</span></a></li>
								<li><a href="login.html"><span style="font-size: 25px;">注销</span></a></li>
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
				<br /><li ><a href="adminUsers.jsp"><span><font color="orange" size="6" >用户管理</font></span></a></li>
				<br /><li><a href="adminQuestion.jsp"><span><font font color="honeydew" size="6" >提问管理</font></span></a></li>
				<br /><li ><a href="adminResponse.jsp"><span><font color="honeydew" size="6" >回答管理</font></span></a></li>
				<br /><li ><a href="adminContactUs.jsp"><span><font color="honeydew" size="6" >留言管理</font></span></a></li>
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
							<th>删除</th>
						</tr>
					</thead>
					<tbody>
						<%
							UserDao udao=new UserDao();
							List<User> users=udao.getAll();
							for(int i=0;i<users.size();i++)
							{
								User u=users.get(i);
						%>
						<tr>
							<td><%=u.getUid() %></td>
							<td><%=u.getUsername() %></td>
							<td><%=u.getPassword() %></td>
							<td><%=u.getSecondname() %></td>	
							<td><a href="AdminUsersDelete?uid=<%=u.getUid() %>" style="color: #D58512;">删除</a></td>	
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>
</div></div></div>
   
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