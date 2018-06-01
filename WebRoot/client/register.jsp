<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <title>注册页面</title>

	
  </head>

  <body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath }/client/IndexServlet?method=getAll">首页</a>
          <span class="navbar-brand navbar-center">注册界面</span>
        </div>
      </div>
    </nav>
	
	<div class="jumbotron">
		<div class="container" style="width:500px">

      <form class="form-signin" action="${pageContext.request.contextPath }/client/RegisterServlet" method="post">
        <h2 class="form-signin-heading">注册表单</h2>
        <input type="text" name="username" class="form-control" placeholder="用户名" required autofocus>
        <input type="password" name="password" class="form-control" placeholder="密码" required>
        <input type="text" name="phone" class="form-control" placeholder="电话" required>
        <input type="text" name="cellphone" class="form-control" placeholder="手机号码" required>
        <input type="text" name="email" class="form-control" placeholder="邮箱" required>
        <input type="text" name="address" class="form-control" placeholder="住址" required>
        <div><br></div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
      </form>
		
    </div>
	</div>
    
    <div class="container">
    	<footer>
	        <p>&copy; 2018 Company, Inc.</p>
	    </footer>
    </div>
    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

<%-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>注册表单</title>
  </head>
  
  <body style="text-align:center;">
  	<form action="${pageContext.request.contextPath }/client/RegisterServlet" method="post">
    	用户名：<input type="text" name="username"><br/>
    	密码：<input type="password" name="password"><br/>
    	电话：<input type="text" name="phone"><br/>
    	手机：<input type="text" name="cellphone"><br/>
    	邮箱：<input type="text" name="email"><br/>
    	住址：<input type="text" name="address"><br/>
    	<input type="submit" value="注册">
    </form>
  </body>
</html>
 --%>