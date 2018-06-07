<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
	
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>


<title>前台首页</title>

</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="${pageContext.request.contextPath }/client/IndexServlet?method=getAll">网上书店</a>
				<a class="navbar-brand"
					href="${pageContext.request.contextPath }/client/IndexServlet?method=getAll">首页</a>
				<a class="navbar-brand"
					href="${pageContext.request.contextPath }/client/listcart.jsp">查看购物车</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<c:if test="${user==null }">
					<form class="navbar-form navbar-right"
						action="${pageContext.request.contextPath }/client/LoginServlet"
						method="post">
						<div class="form-group">
							<input type="text" placeholder="用户名" class="form-control"
								name="username">
						</div>
						<div class="form-group">
							<input type="password" placeholder="密码" class="form-control"
								name="password">
						</div>
						<button type="submit" class="btn btn-success">登录</button>
						<a
							onclick="href='${pageContext.request.contextPath }/client/register.jsp'"
							class="btn btn-success">注册</a>
					</form>
				</c:if>
				<c:if test="${user!=null }">
					<div class="navbar-right">
						<div class="navbar-brand">
							欢迎您：${user.username } <a class="btn btn-success"
								href="${pageContext.request.contextPath }/client/LoginOutServlet">注销</a>
						</div>
					</div>
				</c:if>
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>

	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<br> ${message }
		</div>
	</div>


	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">

			<div class="col-xs-12 col-sm-9">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">Toggle nav</button>
				</p>
				
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="${pageContext.request.contextPath }/ads/ad1.jpg" alt="...">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath }/ads/ad2.jpg" alt="...">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath }/ads/ad3.jpg" alt="...">
							<div class="carousel-caption"></div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
				
				<br><br>
				
				<div class="row">
					<c:forEach var="book" items="${page.list }">
						<div class="col-xs-6 col-lg-4">
							<div class="thumbnail">
								<img style="width: 200px; height: 200px"
									src="${pageContext.request.contextPath }/images/${book.image}">
								<div class="caption">
									<ul class="list-group">
										<li class="list-group-item">书名：${book.name }</li>
										<li class="list-group-item">作者：${book.author }</li>
										<li class="list-group-item">售价：¥${book.price }</li>
										<li class="list-group-item">${book.description }</li>
									</ul>
									<p align="center">
										<a
											href="${pageContext.request.contextPath }/client/BuyServlet?bookid=${book.id}"
											class="btn btn-primary" role="button">加入购物车</a>
									</p>
								</div>
							</div>
						</div>
						<!--/.col-xs-6.col-lg-4-->
					</c:forEach>
				</div>
				<!--/row-->
				<div align="center">
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<li><a href="${pageContext.request.contextPath }/client/IndexServlet?method=${param.method }&pagenum=${(page.pagenum-1)<1?1:(page.pagenum-1)}&category_id=${param.category_id}" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<c:forEach var="pagenum" begin="${page.startpage }"
								end="${page.endpage }">
								<li><a
									href="${pageContext.request.contextPath }/client/IndexServlet?method=${param.method }&pagenum=${pagenum}&category_id=${param.category_id}">${pagenum }</a>
								</li>
							</c:forEach>
							<li><a href="${pageContext.request.contextPath }/client/IndexServlet?method=${param.method }&pagenum=${(page.pagenum+1)>page.totalpage?page.totalpage:(page.pagenum+1)}&category_id=${param.category_id}" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<!--/.col-xs-12.col-sm-9-->

			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<div class="list-group">
					<a href="#" class="list-group-item active">图书分类</a>
					<c:forEach var="category" items="${categories }">
						<a class="list-group-item"
							href="${pageContext.request.contextPath }/client/IndexServlet?method=listBookWithCategory&category_id=${category.id}">${category.name }</a>
					</c:forEach>
				</div>
			</div>
			<!--/.sidebar-offcanvas-->
		</div>
		<!--/row-->

	</div>

	<%-- <div class="row">
		<div class="col-md-3 col-md-offset-1">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">图书分类</h3>
				</div>

				<div class="list-group">
					<c:forEach var="category" items="${categories }">
						<a class="list-group-item"
							href="${pageContext.request.contextPath }/client/IndexServlet?method=listBookWithCategory&category_id=${category.id}">${category.name }</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="col-md-4 col-md-offset-1">
			<div>
				<c:forEach var="book" items="${page.list }">
					<div class="thumbnail">
						<img style="width: 200px; height: 100px"
							src="${pageContext.request.contextPath }/images/${book.image}">
						<div class="caption">
							<ul class="list-group">
								<li class="list-group-item">${book.name }</li>
								<li class="list-group-item">作者：${book.author }</li>
								<li class="list-group-item">售价：${book.price }</li>
							</ul>
							<p align="center">
								<a
									href="${pageContext.request.contextPath }/client/BuyServlet?bookid=${book.id}"
									class="btn btn-primary" role="button">加入购物车</a>
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div align="center">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="pagenum" begin="${page.startpage }"
							end="${page.endpage }">
					    	<li>
					    		<a href="${pageContext.request.contextPath }/client/IndexServlet?method=${param.method }&pagenum=${pagenum}&category_id=${param.category_id}">${pagenum }</a>
							</li>
			    		</c:forEach>
						<li><a href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>

		</div>

	</div>
 --%>

	<%-- <div id="container">
    	<div id="content" style="margin:0 auto;width:840px;">
    	<div id="category" style="float:left; width:200px; border:1px solid black; text-align:left; height:300px;"> 
    		分类列表：
    		<ul>		
	    		<c:forEach var="category" items="${categories }">
	    			<li>
	    				<a href="${pageContext.request.contextPath }/client/IndexServlet?method=listBookWithCategory&category_id=${category.id}">${category.name }</a>
	    			</li>
	    		</c:forEach>
    		</ul>	
    	</div>
    	<div id="bookandpage" style="float:left; margin-left:30px;">   		
    		<div id="books">
    			<c:forEach var="book" items="${page.list }">
    				<div id="book" style="height:150; margin-top:20px;">
    					<div id="image" style="float:left;">
    						<img src="${pageContext.request.contextPath }/images/${book.image}" height=150 width=100>
    					</div>
    					<div id="bookinfo" style="float:left; text-align:left;">
    						<ul>
    							<li>${book.name }</li>
    							<li>作者：${book.author }</li>
    							<li>售价：${book.price }</li>
    							<li>
    								<a href="${pageContext.request.contextPath }/client/BuyServlet?bookid=${book.id}">加入购物车</a>
    							</li>
    						</ul>
    					</div>
    				</div>
    				<div style="clear:both"></div><!-- 做div浮动后，为了不影响后续页面的显示，在这里清楚浮动效果 -->
    			</c:forEach>
    		</div>
    		<div style="clear:both"></div><!-- 做div浮动后，为了不影响后续页面的显示，在这里清楚浮动效果 -->
    		<div id="page" style="margin-top:20px; text-align:center;">
    			当前第[${page.pagenum }]页 &nbsp;&nbsp;
			    <c:forEach var="pagenum" begin="${page.startpage }" end="${page.endpage }">
			    	[<a href="${pageContext.request.contextPath }/client/IndexServlet?method=${param.method }&pagenum=${pagenum}&category_id=${param.category_id}">${pagenum }</a>]
			    </c:forEach>
			    &nbsp;&nbsp;
			    总共[${page.totalpage }]页，共[${page.totalrecord }]条记录
    		</div>
    	</div>
    </div>
    </div> --%>




	<br>
	<hr style="width: 80%">

	<div align="center">
		<footer>
			<p>&copy; 2018 Company, Inc.</p>
		</footer>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
	</script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
<%-- 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>前台首页</title>
  	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </head>
  
  <frameset rows="15%,*">
  	<frame src="${pageContext.request.contextPath }/client/head.jsp" name="head">
  	<frame src="${pageContext.request.contextPath }/client/IndexServlet?method=getAll" name="body">
  </frameset>

</html> --%>
