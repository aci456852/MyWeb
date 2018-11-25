<%@ page language="java" import="java.util.*,Bean.*,Dao.*" pageEncoding="utf-8"%>
<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
<head>
<title>留言管理</title>
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
				<br /><li><a href="list.doAdminUsers"><span><font color="honeydew" size="6" >用户管理</font></span></a></li>
				<br /><li><a href="listforAdmin.doQuestion"><span><font color="honeydew" size="6" >提问管理</font></span></a></li>
				<br /><li><a href="listforAdmin.doResponse"><span><font color="honeydew" size="6" >回答管理</font></span></a></li>
				<br /><li><a href="listforAdmin.doMessages"><span><font color="orange" size="6" >留言管理</font></span></a></li>
                <br /><li><a href="login.jsp"><span><font color="honeydew" size="6" >注销</font></span></a></li>						
			</ul>							
      </nav>	
</div>
<div class="container" style="margin-left:545px;margin-top:0px">
				<div class="ab-w3l-spa" style="margin-top:200px">
					<label class="wel"></label>
					<h2 class="w3ls_head">留言管理</h2>
					<hr/>
				<!-- offer-bottom -->
	<div class="banner-bottom">
		<div style="margin-left: 9em; padding-right: 0px;padding-left: 0px;margin-right: 0; float: left;">
			<%
				MessagesDao mdao=new MessagesDao();
				List<Messages> messages=(List)mdao.getAll();
				for(int i=0;i<messages.size();i++){
					Messages m=messages.get(i);
					int u=m.getUid();
					UserDao udao2=new UserDao();
					User uu=udao2.getOneOFAll(u);
			%>
			<div class="col-md-8 w3l_services_footer_top_right">
				<div class="w3l_services_footer_top_right_main">
					<div class="w3l_services_footer_top_right_main_l">
						<h3><%=m.getMtime() %></h3><br/>
					</div>
					<div class="w3l_services_footer_top_right_main_l1">	
						<div class="w3ls_service_icon">
							<img src="images/<%=uu.getTximg() %>" style="width: 60px;"/>
						</div>
					</div>
					<div class="w3l_services_footer_top_right_main_r">
						<%=uu.getSecondname() %>
						<p><%= m.getMco() %></p>
					</div>
					<!--删除按钮-->
					<form action="delete.doMessages?mid=<%=m.getMid()%>" method="post">  
					<div class="contact-agileinfo" style="margin-left:600px;margin-top: -100px;float:left;">
				     <div class="col-md-3 contact-right"> 						
						<input type="submit" value="删 除" > 									
				    </div>		
			        </div>
					</form>
					<div class="clearfix"> </div>
				</div>
				<br /><br /><br /><br />
			</div>
			<%} %>
		</div>
	</div>
	
	<div class="clearfix"> </div>
<!-- //offer-bottom -->                      
				
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