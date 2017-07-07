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
	<div >
			您当前位置：
			<s:iterator value="path">
				<a href="<s:property value=" value"/>"><s:property value="key" /></a> >>
    		</s:iterator>
			文章列表
			<s:property value="article.title" />
	</div>
	<div class="w650 wrapper">
		
		<div class="black14b title">
			<s:iterator value="clazz.child">
				<a href='Article_getClassArticles?classId=<s:property value="id"/>'>[<s:property value="sortName" />]</a>
			</s:iterator>
			<img src="images/index5_39.gif" class="img-right" />
		</div>
		<div>
			<ul>
				<s:iterator value="articleList">
					<li>
						 <span class="gray">.</span>
						 <span><a href="Article_show?articleId=<s:property value='id'/>"> 
						 		<s:if test="%{isTop}">
									<font color="red">
								</s:if>
								 <s:if test="%{isCommend}">
									<font color="green">
								</s:if> 
								<s:property value="title" /> 
								<s:if test="%{isTop}">
									</font><img src="images/top.gif">
								</s:if> 
								<s:if test="%{isCommend}">
									</font><img src="images/recommend.png">
								</s:if>
								</a>
						</span> 
						<span class="right"><s:property value="addTime" /></span>
					</li>
				</s:iterator>
			</ul>
		</div>
	</div>
	<div class="w250 wrapper">
		<div class="title">
			<span>本类top15</span> <img src="images/index5_39.gif" class="img-right" />
		</div>
		
		<ul>
			<li><span class="right">点击</span></li>
			<s:iterator value="top15">
				<s:url action="Article_show" id="url">
					<s:param name="articleId">
						<s:property value="id" />
					</s:param>
				</s:url>

				<li>
					  <span class="left"><s:a href="%{url}">
							<s:if test="%{isTop}">
								<font color="red">
							</s:if>
							<s:if test="%{isCommend}">
								<font color="green">
							</s:if>
							<s:property value="title" />
							<s:if test="%{isTop}">
								</font><img src="images/top.gif">
							</s:if>
							<s:if test="%{isCommend}">
								</font><img src="images/recommend.png">
							</s:if>
							</s:a> 
						</span> 
						<span class="right"><s:property value="hits" /></span>
				</li>
			</s:iterator>
		</ul>
	</div>
	
</body>
</html>
