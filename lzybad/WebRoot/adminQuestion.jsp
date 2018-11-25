<%@ page language="java" import="java.util.*,Bean.*,Dao.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en"><head>
<title>问题管理</title>
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
    font-size: 20px;
    color: #eead31;
    
    font-weight: 600;
    text-decoration: none;
    text-transform: uppercase;
    display: inline-block;
    letter-spacing: 2px;
    padding: 12px 25px;
    border: 2px solid #eead31;

}
.cover:hover{
font-size:20px;
    border: 2px solid #FFFFFF;

    font-weight: 600;
    color: white;
    background: cover;
    background-color: #EEAD31;
}
.cover>a{
color: #EEAD31;
background: none;
}

</style>
<body>
<!-- banner -->

<div class="banner" style="position: fixed;width: 2000px;">
		<div class="container">	
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					
					<h1><a class="navbar-brand" href="adminQuestion.jsp">The<span>Wise </span></a></h1>
				</div>
				<% 
					UserDao udao=new UserDao();
					List<User> users=(List)udao.getAll();
					int uid=1;
					User user=(User)users.get(0);
				%>
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
				<br /><li><a href="listforAdmin.doQuestion"><span><font color="orange" size="6" >提问管理</font></span></a></li>
				<br /><li><a href="listforAdmin.doResponse"><span><font color="honeydew" size="6" >回答管理</font></span></a></li>
				<br /><li><a href="listforAdmin.doMessages"><span><font color="honeydew" size="6" >留言管理</font></span></a></li>
                <br /><li><a href="login.jsp"><span><font color="honeydew" size="6" >注销</font></span></a></li>						
			</ul>								
      </nav>	
	</div>
<%! int myuid;
	int myqid[]=new int[1005]; 
	int o=0;
%>
<div class="welcome">
		  <div class="container">
				<div class="ab-w3l-spa" style="margin-top: 200px;">
					<label class="wel"></label>
					<h2 class="w3ls_head">提问管理</h2>
					<hr/>
				<%
					QuestionDao qdao=new QuestionDao();
					List<MyQuestion> questions=qdao.getAll();
					MyQuestion question=new MyQuestion();
					o=0;
					for(int i=0;i<questions.size();i++)
					{
						int qid=questions.get(i).getQid();
						question=qdao.getOneOfAll(qid);
				%>
					<div class="ab-w3l-spa">
						<h2 class="w3ls_head"><%= question.getQtitle() %> </h2>
						<p><%= question.getQco() %></p>  
						<p>提问时间:<span><%= question.getQtime()%></span></p>
						<div class="agileits_w3layouts_more">	
							<form action="deleteforAdmin.doQuestion?qid=<%=question.getQid() %>" method="post">  
								<!--提交按钮-->
								<div class="contact-agileinfo" style="margin-left:90px;margin-top: 0px;">
							     <div class="col-md-3 contact-right"> 						
									<input type="submit" value="删    除" > 									
							    </div>		
						        </div>
							</form>
							<br />
							<!--弹窗 -->
							<div class="cover" style="margin-top: 0px;margin-right:200px;">
								<%
								 	myuid=uid;
									myqid[o]=question.getQid();
									String s="#modal"+o;
									o++;
								%>
								<a href="#" data-toggle="modal" data-target="<%=s%>">查看详情</a>													
							</div>
						</div>				
					</div>	
				<br/><br/><br/><br/>
				<%} %>	
		</div>		
	</div>
</div>	
<!-- bootstrap-pop-up -->
<%
	for(int i=0;i<questions.size();i++){
		String ss="modal"+i;
		QuestionDao qdao2=new QuestionDao();
		MyQuestion q=qdao2.getOneOfAll(myqid[i]);
%>
<div class="modal video-modal fade" id="<%=ss%>" tabindex="-1" role="dialog" aria-labelledby="myModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<%= q.getQtitle() %>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>	
			</div>
			<%
				ResponseDao rdao=new ResponseDao();
				List<MyResponse> responses=rdao.getAllOfQuestion(myqid[i]);
				for(int j=0;j<responses.size();j++)
				{
					MyResponse res=(MyResponse)responses.get(j);
					int uidooo=res.getUid();
					UserDao udaoo=new UserDao();
					User u=udaoo.getOneOFAll(uidooo);
					//System.out.println(res.getQid()+"***");
			%>
				<section>
					<div class="modal-body">
					<!--评论回复-->
					<div style="margin-bottom: 50px;">
						<img src="images/<%= u.getTximg() %>" width="50px" class="img-responsive" style="float: left;"/>
						<div style="float: left;margin-top: 20px;">
						&nbsp;&nbsp;<span><%= u.getSecondname() %></span>
						&nbsp;&nbsp;&nbsp;&nbsp;<span>评论时间：<span><%=res.getRtime()%></span></span>
						</div>
					</div>
						<p><%= res.getRco() %></p>
					<!--评论回复结束-->
					</div>
				</section>
			<% } %>
		</div>
	</div>
</div>
<%} %>
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