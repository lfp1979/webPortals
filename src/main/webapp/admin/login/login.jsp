<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<script language="javascript"> 
function loadimage(){ 
document.getElementById("randImage").src = "login/image.jsp?"+Math.random(); 

} 
window.onload=loadimage;
</script> 
</head>
<body>
<div id="showMsg">欢迎使用，请登陆...</div>

<br />
<br />
<br />
<br />
<table cellspacing="0" cellpadding="0" width="420" align="center" border="0">
  <form id="form1" name="form1" method="post" action="Login_validate">
    <tbody>
      <tr>
        <td><img height="36" src="images/login_admin1.gif" 
      width="420" /></td>
      </tr>
      <tr>
        <td><img height="106" src="images/login_admin2.gif" 
      width="420" /></td>
      </tr>
      <tr>
        <td width="420" background="images/login_admin3.gif" height="137"><table width="341" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25">管理员帐号</td>
            <td height="25"><input id="username" style="FONT-SIZE: 9pt; WIDTH: 120px; COLOR: black" maxlength="18" name="name" /></td>
            <td height="25"><input id="Button1" type="submit" value="管理登陆" name="Button1" /></td>
          </tr>
          <tr>
            <td height="25">管理员密码</td>
            <td height="25"><input id="userpwd" style="FONT-SIZE: 9pt; WIDTH: 120px; COLOR: black" type="password"  maxlength="18" name="pwd" /> </td>
            <td height="25"><input type="reset" name="Submit" value="清除再来" /></td>
          </tr>
          <tr>
            <td height="25">程序验证码<br><font size="2px" color="red"><s:property value="msg"/></font> </td>
            <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="19%"><input id="getcode" style="WIDTH: 40px" maxlength="4" name="rand" /></td>
                <td width="81%"><img src="image.jsp" id="randImage" width="80" height="20" border="0" style="cursor:hand;" title="没有看清？点击换一个..." onClick="loadimage()" /></td>
              </tr>
            </table></td>
            <td height="25"><span style="HEIGHT: 31px">
              <input onClick="window.location='../'" type="button" value="返回首页" name="Submit3" />
            </span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><img height="51" src="images/admin_login.jpg"  
      width="420" /></td>
      </tr>
    </tbody>
  </form>
</table>
</body>
</html>