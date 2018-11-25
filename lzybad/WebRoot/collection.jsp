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
<title>我的收藏</title>
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
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
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
				<li><a href="list.doCollection"><span><font color="orange" size="6">我的收藏</font></span></a></li><br />
				<li><a href="listforUser.doMessages"><span><font color="honeydew" size="6">联系我们</font></span></a></li><br />
				<li><a href="login.jsp"><span><font color="honeydew" size="6">注销</font></span></a></li><br />
			</ul>			
		</nav>	
</div>
 <!-- gallery -->
	<div class="gallery">  
		<div class="container"> 
		<div style="margin-top: 200px;">
			<label class="wel"></label>
			<h2 class="w3ls_head">我的收藏</h2>
			<div class="gallery-agileinfo">
				<%
					CollectionDao cdao=new CollectionDao();
					List<MyCollection> collections=cdao.getAllOfMy(user.getUid());
					for(int i=0;i<collections.size();i++){
						int cid=collections.get(i).getCid();
						int qid=collections.get(i).getQid();
						int rid=collections.get(i).getRid();
						QuestionDao qdao=new QuestionDao();
						MyQuestion q=qdao.getOneOfAll(qid);
						ResponseDao rdao=new ResponseDao();
						MyResponse r=rdao.getOneOfResponse(rid);
						MyCollection c=cdao.getOneOfAll(cid);						
				%>			
				<div class="col-sm-4 col-xs-6 w3gallery-grids">
					<a href="#" class="imghvr-hinge-right figure">
						<img src="images/cl<%=i+1 %>.png" alt="" title="New Designs Image" style="width:525px;height:250px;"/> 
						<div class="agile-figcaption">
						   <h4><%=q.getQtitle() %></h4>
						  <p><%=r.getRco()%></p> 
						</div>
					</a> 
					<div class="icon-box" style=" float: left; margin-left: 340px;">
						<!-- <%session.setAttribute("cid",cid);%> -->
						<a class="agile-icon" href="delete.doCollection?cid=<%=cid %>"><i class="fa fa-times"></i></a>
					</div>						
				</div> 
				<%
					if(i==8)break;
				} 
				%>							
				<div class="clearfix"> </div>
				<script type="text/javascript" src="js/simple-lightbox.min.js"></script>
				<script>
					$(function(){
						var gallery = $('.w3gallery-grids a').simpleLightbox({navText:['&lsaquo;','&rsaquo;']});
					});
				</script>  
			</div> 
			</div>
		</div>
	</div>
	<!-- //gallery --> 



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