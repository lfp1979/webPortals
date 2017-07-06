<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  
 	<s:url action="Article_getClassArticles" id="url" >
 		<s:param name="classId"><s:property value="clazz.id"/></s:param>
 	</s:url>
	 <div class="inner">
		 <div class="title">
        		<span>
        		<s:a href="%{url}"><s:property value="clazz.sortName"/></s:a></span>
        		<span><s:a href="%{url}">更多</s:a></span>
        		<img src="images/index5_39.gif" class="img-right"/>
        </div>
     
        <ul>
       		<s:iterator value="articleList">
       			
       				<li><a href="Article_show?articleId=<s:property value='id'/>">
       				<s:if test="%{isTop}"><font color="red"></s:if>
       				<s:if test="%{isCommend}"><font color="green"></s:if>
       					<s:property value="title"/>
       				<s:if test="%{isTop}"></font><img  src="images/top.gif"></s:if>
       				<s:if test="%{isCommend}"></font><img  src="images/recommend.png"></s:if>
       				</a></li>
       			
       		</s:iterator>
        </ul>
     </div>
</body>
</html>