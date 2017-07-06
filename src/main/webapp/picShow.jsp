<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="bootstrap/js/jquery-1.9.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script> 
 $(document).ready(function(){ 
 $('#myCarousel').carousel({interval:5000});//每隔5秒自动轮播 
 }); 
 </script> 
</head>
<body>
	<div class="inner">
		<div id="myCarousel" class="carousel slide">
  			<ol class="carousel-indicators">
  				<s:iterator value="picList" begin="0" end="0">
  					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
  				</s:iterator>
    			<s:iterator value="picList" begin="1" status="st">
  					<li data-target="#myCarousel" data-slide-to="<s:property value="#st.index"/>" ></li>
  				</s:iterator>
  			</ol>
  <!-- Carousel items -->
  			<div class="carousel-inner">
  				<div class="active item">
  					<s:iterator value="picList" begin="0" end="0">
  					<div class="item">
  							<a href="Article_show?articleId=<s:property value='id'/>">
  								<img src="<s:property value="PicFile"/>" style="width:100%; height:200px"/>
  							</a>
        					<div class="carousel-caption">
                      			<s:property value="title"/>
                      		</div>
    				</div>
  					</s:iterator>
    			</div>
  				<s:iterator value="picList" begin="1">
  					<div class="item">
  					    <a href="Article_show?articleId=<s:property value='id'/>">
  							<img src="<s:property value="PicFile"/>" style="width:100%; height:200px"/>
        				</a>
        					<div class="carousel-caption">
                      			<s:property value="title"/>
                      		</div>
    				</div>
  				</s:iterator>
  			</div>
  <!-- Carousel nav -->
  		<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
  		<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
	</div>  
	
</body>
</html>