<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var msg="<s:property value='msg'/>";
	if(msg!="")
		{
		alert("上传成功，文章中插入该图片请使用<img src='"+msg+"'/>");
		}
</script>
<table >
	<form action="Upload" method="post" enctype="multipart/form-data">
		<td><input type="file" name="file1"></td>
		
		<td><input type="submit"></td>
		<td><s:property value="msg" /></td>
	</form>
</table>
</body>
</html>