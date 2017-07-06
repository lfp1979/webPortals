<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>error</title>

</head>
<body>

	<%
		Exception e = (Exception) ActionContext.getContext().getValueStack().findValue("exception");
		Throwable t=e.getCause();
		String msg="";
	    while(t!=null)
	    {
		  msg=t.getMessage();
		  t=t.getCause();
	    }
	    if(msg.contains("Duplicate entry") && msg.contains("SortName"))
	    {
	    	String name=msg.substring(16, msg.length()-18);
	    	msg="栏目名称："+name+" 重复";
	    }
	    if(msg.contains("Cannot delete") && msg.contains("ok3w_article_ibfk_1"))
	    {
	    	msg="不能删除此类别，请确认此类别下的所有文章都已删除！";
	    }
	    if(msg.contains("Cannot delete") && msg.contains("ok3w_class_ibfk_1"))
	    {
	    	msg="不能删除此类别，请确认此类别下的所有子类别都已删除！";
	    }
	%>
	出错了！错误信息：
	<div id="show"></div>
		<a title="后退" href="javascript:history.back();">返回上一頁</a>

	<script type="text/javascript">
           document.getElementById("show").innerHTML="<%=msg%>";
	</script>

</body>
</html>