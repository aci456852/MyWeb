<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Meta tags -->
	<title>注册The Wise</title>
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
</head>
<body>
	<div class="agile-login">
		<h1>欢迎注册</h1>
		<div class="wrapper">
			<div class="w3ls-form">
				<div align="center"><img width="100px "height="100px" src="images/tx.png"></div>
				<br/>
				<form action="Register" method="post">
				<% 
					String error= (String)request.getAttribute("error");
	            	if(error!=null){
	            %>
	            	<p style="color:orange" align="center"><%=error %></p>
	            <%} %>			
					<label><font style="font-size: 1.5em">用户名</font></label>
					<input type="text" name="username" placeholder="用户名" required/>
					<label><font style="font-size: 1.5em">昵称</font></label>
					<input type="text" name="secondname" placeholder="昵称"required/>
					<label><font style="font-size: 1.5em">密码</font></label>
					<input type="password"  onkeyup="value=value.replace(/[^\w\/]/ig,'')"  maxlength="16"  name="password"  placeholder="密码" required />
					<label><font style="font-size: 1.5em">确认密码</font></label>
					<input type="password" name="repassword" placeholder="确认密码 " required />					
					<label><font style="font-size: 1.5em">年龄</font></label>
					<input type="text" oninput="value=value.replace(/[^\d]/g,'')" name="age" required/>
					<label><font style="font-size: 1.5em">性别</font></label>					
					<input type="radio" name="sex" style="float:left;" value="男"/><span style="color:white;font-size:15px;margin-right:100px;float:left;margin-top:-3px;">男</span>
					<input type="radio" checked="checked" name="sex" style="float:left;" value="女"/><span style="color:white;font-size:15px;float:left;margin-top:-3px;">女</span>
					<br/>
					<input type="submit" onclick="alert("注册成功");"value="确认注册" />
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