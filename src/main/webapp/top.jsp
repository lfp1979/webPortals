<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/index.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
	function logout()
	{
		$.ajaxSetup({cache:false});
		$('#welcome').load("admin/Login_logout");
		alert("退出登陆！");
	}
</script>
<body>
	<div id="header">
	<div id="logo">
		<img src="images/logo.gif"/>
	</div>
    <div id="mar">
    	<span><strong><font color="red">滚动新闻：</font></strong></span>
    	<marquee ><s:property value="moveArticle.content" escapeHtml="false"/></marquee>
    </div>
    <div id="nav">
    	<ul>
    	   	<li><img src="images/index5_08.gif" /></li><li><a href="admin/Login_login">管理登陆</a></li>
    	   	<li><img src="images/index5_11.gif" /></li><li><a href="javascript:logout();">退出登陆</a></li>
        	<li><img src="images/index5_11.gif" /></li><li><a href="admin/Article_list">文章管理</a></li>
            <li><img src="images/index5_11.gif" /></li><li><a href="admin/Class_list?id=0">类别管理</a></li>
            <s:iterator value="clazz0.child">
            		<s:url action="Article_getClassArticles" id="url" >
 						<s:param name="classId"><s:property value="id"/></s:param>
 					</s:url>
            	  <li><img src="images/index5_11.gif" /></li>
            	  <li><s:a href="%{url}"><s:property value="sortName"/></s:a></li>
            </s:iterator>
          
        </ul>
    </div>
    <div id="welcome" >
    	<s:if test="#session.login==null">您还未登录&nbsp;&nbsp;</s:if>
    	<s:else>
    		<s:property value="#session.login"/>欢迎访问!&nbsp;&nbsp;
    	</s:else>
    	
    </div>
</div>
</body>
</html>