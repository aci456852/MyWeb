<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- Meta tags -->
		<title>登录The Wise</title>
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
		<meta name="keywords" content="The Wise" />
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- stylesheets -->
		<link rel="stylesheet" href="css/font-awesome.css">
		<link rel="stylesheet" href="css/style.css">
		<!-- google fonts  -->
		<link href="//fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
		<link href="//fonts.googleapis.com/css?family=Raleway:400,500,600,700" rel="stylesheet">
		<script type="text/javascript">
			//<!CDATA[
			var bodyBgs = [];
			bodyBgs[0] = "images/bg1.jpg";
			bodyBgs[1] = "images/bg2.jpg";
			bodyBgs[2] = "images/bg3.jpg";
			bodyBgs[3] = "images/bg4.jpg";
			bodyBgs[4] = "images/bg5.jpg";
			var randomBgIndex = Math.round(Math.random() * 4);
			document.write('<style>body{background:url(' + bodyBgs[randomBgIndex] + ') no-repeat;background-size:cover}</style>');
			//]]>
		</script>
		
	</head>

	<body>
		<div class="agile-login">
			<h1>The Wise</h1>
			<div align="center"><img width="140px " height="140px" src="images/tx.png"></div>
			<br />
			<div class="wrapper">
				<div style="font-size: 2.5em;color:#FFFFFF;font-family: '黑体';"><b>登&nbsp;&nbsp;&nbsp;录</b></div>
				<br>
				<% String error= (String)request.getAttribute("error");
	            if(error!=null){
	            %>
	            <p style="color:orange"><%=error %></p>
	            <%} %>
				<div class="w3ls-form">
					<form action="Login" method="post">
					<% 
						String success= (String)request.getAttribute("success");
		            	if(success!=null){
		            %>
		            	<p style="color:orange" align="center"><%=success %></p>
		            <%} %>		
						<label><font style="font-size: 1.5em">用户名</font></label>
						<input type="text" name="username" placeholder="用户名" required/>
						<label><font style="font-size: 1.5em">密码</font></label>
						<input  type="password" name="password" placeholder="密码" required />
						<a href="Register" class="pass">新用户注册</a>
						<input type="submit" value="登录" />
					</form>
				</div>
			</div>
			<br>
			<div class="copyright">
				<p>© 2018 The Wise | 浙ICP备17060288号</p>
			</div>
		</div>
		


	</body>

</html>