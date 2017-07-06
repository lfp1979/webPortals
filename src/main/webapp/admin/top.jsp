<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {text-decoration: none;}
#showMsg{
	width:200px;
	position:absolute;
	top:25px;
	right:5px;
	border:solid 1px #666666;
	padding:5px;
	color:#FF0000;
	background-color:#FFFFFF;
	z-index:1000;
}
</style>
<script language="javascript">
String.prototype.trim = function(){ return this.replace(/(^\s*)|(\s*$)/g, "");}

//显示错误信息
function ShowErrMsg(Info)
{
	document.getElementById("showMsg").innerHTML = Info;
}

window.onscroll = function()   
{   
	var t = document.documentElement.scrollTop + 25;     
	document.getElementById("showMsg").style.top = t + "px";
}
</script>
</head>
<body>
<div id="showMsg">准备就绪,欢迎使用...</div>

<table cellspacing="0" cellpadding="0" width="100%" align="center" bgcolor="#fda700" 
border="0" style="border-bottom:2px solid #CCCCCC;border-top:2px solid #CCCCCC;">
  <tbody>
    <tr>
      <td nowrap="nowrap" width="2%"></td>
      <td nowrap="nowrap" width="2%"><a title="后退" href="javascript:history.back();"><img 
      height="15" src="images/jiantou-Control-a1.jpg" width="16" 
    border="0" /></a></td>
      <td nowrap="nowrap" width="89%"><table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
          <tr>
            <td align="center"><strong>${login}</strong> 欢迎您！</td>
             <td align="center"><a href="../Article_index">网站首页</a></td>
            <td align="center"><a href="Article_list">文章管理</a></td>
            <td align="center"><a href="Class_list?id=0">类别管理</a></td>
            </tr>
        </tbody>
      </table></td>
      <td valign="bottom" nowrap="nowrap" width="4%" height="22"><a title="前进" 
      href="javascript:history.go(1);"><img height="16" 
      src="images/jiantou-Control-b2.jpg" width="15" align="right" border="0" /> </a>&nbsp; </td>
      <td nowrap="nowrap" align="right" width="3%">&nbsp;</td>
    </tr>
  </tbody>
</table>

</body>
</html>