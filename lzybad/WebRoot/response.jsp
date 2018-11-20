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
<title>我的回答</title>

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
<style>
input::-webkit-input-placeholder { 
color: #999; 
-webkit-transition: color.5s; 
font-size: 20px;
} 
input:focus::-webkit-input-placeholder, 
input:hover::-webkit-input-placeholder { 
color: #c2c2c2; 
-webkit-transition: color.5s; 
}
.cover{
    font-size: 18px;
    color: #eead31; 
    font-weight: 600;
    text-decoration: none;
    text-transform: uppercase;
    display: inline-block;
    letter-spacing: 2px;
    padding: 5px 15px;
    border: 2px solid #eead31;

}
.cover:hover{
font-size:18px;
    border: 2px solid #FFFFFF;
    font-weight: 600;
    color:#eead31 ;
    background: cover;
    background-color: #EEAD31;
}
.cover>a:hover{
color:#FFFFFF;
background: none;
}
.cover>a{
 color: #eead31; 
background: none;
}

</style>
	
<body>
<!-- banner -->
<div class="banner" style="position: fixed;width: 2000px;z-index:11111111">
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
<div style="margin-top:115px;float: left; background-color: #2E6DA4;width: 350px;text-align: center; position: fixed;">
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
				<li><a href="listforUser.doResponse"><span><font color="orange" size="6">我的回答</font></span></a></li><br />
				<li><a href="list.doCollection"><span><font color="honeydew" size="6">我的收藏</font></span></a></li><br />
				<li><a href="listforUser.doMessages"><span><font color="honeydew" size="6">联系我们</font></span></a></li><br />
				<li><a href="login.jsp"><span><font color="honeydew" size="6">注销</font></span></a></li><br />
			</ul>			
		</nav>	
</div>
<div class="welcome">
		  <div class="container">
				<div class="ab-w3l-spa" style="margin-top: 200px;">
					<label class="wel"></label>
					<h2 class="w3ls_head">我的回答</h2>
					<hr/>
					
					<%
						ResponseDao rdao=new ResponseDao();
						List<MyResponse> responses=rdao.getAllOfMy(user.getUid());
						for(int i=0;i<responses.size();i++)
						{
							int rid=responses.get(i).getRid();
							int qid=responses.get(i).getQid();
							MyResponse r=rdao.getOneOfResponse(rid);
							QuestionDao qdao=new QuestionDao();
							MyQuestion q=qdao.getOneOfAll(qid);
					%>
					<div style="margin-left:80px">
					<div style="font-size: 30px;"><span>                </span><br/></div>
					<a href="#" style="margin-left: 0px;"></a>
					<div style="font-size: 35px; text-align: center;"><span><%=r.getRco() %></span>&nbsp;
					<br/>
					<span style="font-size: 15px; color:#656B6D;">回答时间:<span><%=r.getRtime() %></span></span></div>												
					
					<%
						if(q.getQtitle()!=null){						
					%>
					<div style="font-size: 20px; color: #000000;margin-top: 30px;"><%=q.getQtitle() %>&nbsp;
					<br/>					
					<span style="font-size: 15px; color:#656B6D;">提问时间:<span><%=q.getQtime() %></span></span></div>						
					<%} 
						else{ %>
					<div style="font-size: 20px; color: #000000;margin-top: 30px;">问题已经被提问者或管理员删除
					<br/>
					<span style="font-size: 15px; color:#656B6D;"><span></span></span>
					</div>	
					<%} %>
					<form action="deleteforUser.doResponse?rid=<%=rid%>" method="post">  
					<!--提交按钮-->
						<div class="contact-agileinfo" style="margin-left:600px;margin-top: -50px;">
					     	<div class="col-md-3 contact-right"> 			
					     		<!--<%session.setAttribute("rid",rid);%>	--> 			
								<input type="submit" value="删 除" > 									
					    	</div>		
			        	</div>
					</form>
					
					<br/><br/>
					</div>
					<%} %>
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