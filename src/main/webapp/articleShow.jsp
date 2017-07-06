<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="article.title" /></title>
<link href="css/css2.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<jsp:include page="top.jsp" />
<div>
	<div>
		您当前位置：
		<s:iterator value="path">
			<a href="<s:property value=" value"/>"><s:property value="key" /></a> >>
    	</s:iterator>
		<s:property value="article.title" />&nbsp;
	</div>
	<div class="w650 wrapper">
		<h1><s:property value="article.title" /></h1>
		<div class="hui hcenter">
			来源：
			<s:property value="article.comeFrom" />
			发布时间：
			<s:property value="article.addTime" />
			点击数：
			<s:property value="article.hits" />
		</div>
		<hr size="2" color="#C3E7E3" width="95%" />
		<span class="gray14"> <s:property value="article.content" escape="false" /></span>
	</div>
	<div class="w250 wrapper">
		<div class="title">
			<span>本类New15</span> 
			<img src="images/index5_39.gif" class="img-right" />
		</div>
		<ul>
		<s:iterator value="new15">
			<s:url action="Article_show" id="url">
				<s:param name="articleId">
					<s:property value="id" />
				</s:param>
			</s:url>
			<li>
			<s:a href="%{url}">
				<s:property value="title" />
			</s:a>
			</li>
		</s:iterator>
		</ul>
	</div>
</div>
</body>
</html>
