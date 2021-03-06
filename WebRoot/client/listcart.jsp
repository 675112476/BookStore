<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
    <title>购物车显示列表</title>
  </head>
  
  <body style="text-align:center;">\
  
  	<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath }/client/IndexServlet?method=getAll">网上书店</a>
          <a class="navbar-brand" href="${pageContext.request.contextPath }/client/IndexServlet?method=getAll">首页</a>
          <a class="navbar-brand" href="${pageContext.request.contextPath }/client/listcart.jsp">查看购物车</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
        <c:if test="${user==null }"> 
          <form class="navbar-form navbar-right" action="${pageContext.request.contextPath }/client/LoginServlet" method="post">
            <div class="form-group">
              <input type="text" placeholder="用户名" class="form-control" name="username">
            </div>
            <div class="form-group">
              <input type="password" placeholder="密码" class="form-control" name="password">
            </div>
            <button type="submit" class="btn btn-success">登录</button>
        	<a onclick="href='${pageContext.request.contextPath }/client/register.jsp'" class="btn btn-success">注册</a>
          </form>
        </c:if>
        <c:if test="${user!=null }">
        	<div class="navbar-right">
	    		<div class="navbar-brand">
	    		欢迎您：${user.username } 
	    		<a class="btn btn-success" href="${pageContext.request.contextPath }/client/LoginOutServlet">注销</a>
	    		</div> 
        	</div>
	    </c:if>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>
    
    <div class="jumbotron">
      <div class="container">
      	<br>
      	<c:if test="${user == null }">
  		对不起，请先登录
  		</c:if>
  		${message }
      </div>
    </div>
  	
  	<div class="container">
  		<c:if test="${user != null }">
  	<h2>购物车列表</h2>
    <table class="table table-striped">
    	<tr>
    		<td>书名</td>
    		<td>作者</td>
    		<td>单价</td>
    		<td>数量</td>
    		<td>小计</td>
    		<td>操作</td>
    	</tr>
    	<c:forEach var="me" items="${cart.map }">
    		<tr>
    			<td>${me.value.book.name }</td>
	    		<td>${me.value.book.author }</td>
	    		<td>${me.value.book.price }</td>
	    		<td>${me.value.quantity }</td>
	    		<td>${me.value.price }</td>
	    		<td>
	    			<a href="#">删除</a>
	    		</td>
    		</tr>
    	</c:forEach>
    	
    	<tr>
    		<td colspan="1">总价</td>
    		<td colspan="5">${cart.price }</td>
    	</tr>
	</table>
	<a class="btn btn-primary" href="${pageContext.request.contextPath }/client/OrderServlet">购买</a>
	</c:if>
	
  	</div>
  	
   </body>
</html>