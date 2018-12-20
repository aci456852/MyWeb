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
<title>联系我们</title>
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
<link href="css/style4.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- font-awesome-icons -->
<link href="css/font-awesome1.css" rel="stylesheet"> 
<!-- //font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Shadows+Into+Light+Two&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Cinzel" rel="stylesheet">         
<link rel="stylesheet" href="css/style3.css">     
</head>
	
<body>
<!-- banner -->
<div class="banner" style="position: fixed;width: 2000px;">
		<div class="container">	
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
				<h1><a class="navbar-brand" href="Login">The<span>Wise </span></a></h1>
				</div>
				<% 
					UserDao udao=new UserDao();
					List<User> users=udao.getAll();
					int uid=Integer.parseInt(request.getAttribute("uid").toString());
					User user=(User)users.get(uid-1);
				%>
				<div class="collapse navbar-collapse navbar-right " id="bs-example-navbar-collapse-1">
					<nav style="margin-left: 200px; width: 3000px;padding-left: 100px;padding-right:100px ;">
						<ul class="nav navbar-nav link-effect-14" id="link-effect-14">							
							<li><a href="Login"><span style="font-size: 25px;">主页</span></a></li>
							<li><a href="PersonalModification"><span style="font-size: 25px;">个人信息</span></a></li>
							<li><a href="listforUser.doQuestion"><span style="font-size: 25px;">我的提问</span></a></li>
							<li><a href="listforUser.doResponse"><span style="font-size: 25px;">我的回答</span></a></li>
							<li><a href="list.doCollection" ><span style="font-size: 25px;">我的收藏</span></a></li>                      
                            <li><a href="listforUser.doMessages" ><span style="font-size: 25px;">联系我们</span></a></li>
							<li><a href="login.jsp"><span style="font-size: 25px;">注销</span></a></li>
						</ul>			
				</nav>	
				</div>	
				
			</nav>
			
		</div>
	</div>
<div style="margin-top:100px;float: left; background-color: #2E6DA4;width: 350px;text-align: center; position: fixed;">
		<nav>
		<ul style="list-style: none;" class="nav" >
				<img src="images/<%= user.getTximg() %>" style="width: 130px;" />
				<div style="margin-top: 10px;margin-bottom: 20px;"><font style="color:#EEAD31; font-size: 25px;"><%= user.getSecondname() %></font></div>
				<% if(user.getMotto()!=null) {%>
					<div style="margin-top: 10px;margin-bottom: 20px;"><font style="color:#C9E2B3;">
					<%= user.getMotto() %></font></div>
				<%} %>
				<li><a href="Login"><span><font color="honeydew" size="6">主页</font></span></a></li>
				<br />
				<li>
					<a href="PersonalModification">
					<span><font color="honeydew" size="6">个人信息</font></span>
					</a>
				</li><br />
				<li><a href="listforUser.doQuestion"><span><font color="honeydew" size="6">我的提问</font></span></a></li><br />
				<li><a href="listforUser.doResponse"><span><font color="honeydew" size="6">我的回答</font></span></a></li><br />
				<li><a href="list.doCollection"><span><font color="honeydew" size="6">我的收藏</font></span></a></li><br />
				<li><a href="listforUser.doMessages"><span><font color="orange" size="6">联系我们</font></span></a></li><br />
				<li><a href="login.jsp"><span><font color="honeydew" size="6">注销</font></span></a></li><br />
			</ul>		
		</nav>	
</div>
<!-- testimonials -->
	<div class="testimonials" >
	<br/><br/><br/>
		<div class="container" style="margin-left: 550px;">
		<div style="width:500px;margin-left:50px;margin-top:20px;font-size:20px;line-height: 2;">TheWise创立于2016年12月23日
		<br />创办者梁紫怡旨在创立一个大学生学习交流的平台。
		<br />在二周年到来之际，网站功能日渐完善。
		<br />欢迎大家关注公众号TheWise
		<br />官方粉丝群：262821078。
		<br />如有建议可以给我们留言哦↓</div>
		<!-- subscribe -->	
		<div style="width:800px;padding-right: 0px;padding-left: 0px;margin-top:-30px;margin-left: -5em;margin-right: 0; margin-bottom: 2em;font-size: 20px;float: left;">
			<div class="w3-agileits-subscribe-form">
				<form action="add.doMessages" method="post">
					<input type="text" name="mco" placeholder="留言内容" name="search" required="" style="border: 2px solid rgba(255, 185, 15, 0.5);font-size: 1.45em;padding: .25em .5em .3125em;color: rgba(255, 185, 15, 0.5);background: transparent;-webkit-transition: all .100s;transition: all .100s;">		
					<button class="btn1"><font style="font-family:'黑体';font-size: 22px; ">留   言</font></button>
				</form>
			</div>		
		</div>
		<div style="float:left;margin-left:-1em;margin-top:-240px;">
					<div style="color:orange;font-size:30px;margin-bottom:10px;margin-left:35px">最近提问</div>
					<%
						UserDao uop=new UserDao();
						User op=new User();
						QuestionDao qdao=new QuestionDao();
						List<MyQuestion> questions1=qdao.getAll();
						MyQuestion question=new MyQuestion();
						List<MyQuestion> questions=qdao.getAll();
						for(int i=questions.size()-1;i>=questions.size()-3;i--)
						{
							question= (MyQuestion) questions.get(i);
							int tu=question.getUid();
							op=uop.getOneOFAll(tu);
					%>
					<div style="margin-bottom:10px;">
						<div class="w3l_services_footer_top_right_main_l1">	
							<div class="w3ls_service_icon">
								<img src="images/<%=op.getTximg() %>" style="width: 50px;margin-top:8px;"/>
							</div>
						</div>
						<div style="margin-left:120px;margin-top:30px;">
							<div style="font-size:20px;margin-bottom:10px;width:200px"><%=op.getSecondname() %></div>
							<p><%=1900+question.getQtime().getYear() %>.<%=1+question.getQtime().getMonth() %>.<%=question.getQtime().getDate() %></p>
						</div>
					</div>	
					<%} %>	
					<div style="margin-top:50px;margin-left:20px">历史提问人数：<%=questions.size() %></div>	
		</div>
		<div style="float:left;margin-left:60em;margin-top:-419px;">
					<div style="color:orange;font-size:30px;margin-bottom:10px;margin-left:35px">最近回答</div>
					<%
						ResponseDao rd=new ResponseDao();
						List<MyResponse> responses=rd.getAll();
						MyResponse r=new MyResponse();
						for(int i=responses.size()-1;i>=responses.size()-3;i--)
						{
							r=(MyResponse) responses.get(i);
							int tu2=r.getUid();
							op=uop.getOneOFAll(tu2);
					%>
					<div style="margin-bottom:10px;">
						<div class="w3l_services_footer_top_right_main_l1">	
							<div class="w3ls_service_icon">
								<img src="images/<%=op.getTximg() %>" style="width: 50px;margin-top:8px;"/>
							</div>
						</div>
						<div style="margin-left:120px;margin-top:30px;">
							<div style="font-size:20px;margin-bottom:10px;width:200px"><%=op.getSecondname() %></div>
							<p><%=1900+question.getQtime().getYear() %>.<%=1+question.getQtime().getMonth() %>.<%=question.getQtime().getDate() %></p>
						</div>
					</div>
					<%} %>	
					<div style="margin-top:50px;margin-left:20px">历史提问人数：<%=responses.size() %></div>			
		</div>

<!-- offer-bottom -->

	<div class="banner-bottom">
<br/><br/><br/><br/><br/><hr />

		<div style="margin-left: 25em; padding-right: 0px;padding-left: 0px;margin-right: 0; float: left;">		
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
				</div>
				<br /><br /><br /><br />
						<div class="clearfix"> </div>
			</div>
			<%} %>
			
		</div>	
	</div>


<!-- //offer-bottom -->

<!-- //subscribe -->
<div style="margin-top:500px">
			<h3 class="w3ls_head">关于我们</h3>
			<div class="testimonials-grids">
				<div class="wmuSlider example1 animated wow slideInUp" data-wow-delay=".5s">
					<div class="wmuSliderWrapper">
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<div class="testimonials-grid">
									<div class="testimonials-grid-left">
										<img src="images/badlazy.jpg" alt=" " class="img-responsive" style="width: 200px;height: 200px;" />
									</div>
									<div class="testimonials-grid-right">
										<p style="font-size: 20px;">史上最强的后台 and lzy not bad!</p>
										<p style="font-size: 20px;">“人啊，认识你自己。”</p>
										<h4>梁紫怡——Wiselzy</h4>
									</div>
									<div class="clearfix"> </div>
								</div>
							</div>
						</article>
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<div class="testimonials-grid">
									<div class="testimonials-grid-left">
										<img src="images/goodwyp.jpg" alt=" " class="img-responsive" style="width: 200px;height: 200px;" />
									</div>
									<div class="testimonials-grid-right">
										<p style="font-size: 20px;">超可爱超努力的前端 and 高级按摩技师</p>
										<p style="font-size: 20px;">“Go BIG OR GO HOME”</p>
										<h4>王依萍——OrlaWang</h4>
									</div>
									<div class="clearfix"> </div>
								</div>
							</div>
						</article>						
					</div>
				</div>
					<script src="js/jquery.wmuSlider.js"></script> 
						<script>
							$('.example1').wmuSlider();         
						</script> 
			</div>
		</div>
		</div>
	</div>
<!-- //testimonials -->
<div style="margin-left: 1030px;">
<img src="images/LZY.jpg" style="width: 200px;height: 200px;"/>
<div style="font-size: 20px; margin-left: 50px;">扫我有惊喜</div>
</div>
<br />

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
 <script src="js/index.js"></script>

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