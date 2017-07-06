<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章列表</title>
<link href="css/css2.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/page.css">
</head>
<body>
	<jsp:include page="top.jsp" />
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="30">您当前位置： <s:iterator value="path">
					<a href="<s:property value="value"/>"><s:property value="key" /></a>  &gt;&gt;   		
    								</s:iterator>文章列表
			</td>
			<td>&nbsp;</td>
		</tr>
	</table>
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td width="712" align="left" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#AEE1DC">
					<tr>
						<td><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/index5_37.gif">
								<tr>
									<td width="10" align="left" class="black14b">&nbsp;</td>
									<td align="left" class="black14b"><s:iterator value="clazz.child">
											<a href='Article_getClassArticles?classId=<s:property value="id"/>'>[<s:property value="sortName" />]
											</a>
										</s:iterator></td>
									<td align="right"></td>
									<td width="35" align="right"><img src="images/index5_39.gif" width="35" height="29" /></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="311" valign="top" bgcolor="#FFFFFF"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td height="12"></td>
								</tr>
							</table>
							<table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
								<s:iterator value="articleList">
									<tr>
										<td width="3%" height="24" align="center"><span class="gray">.</span></td>
										<td width="77%" height="24" align="left"><a href="Article_show?articleId=<s:property value='id'/>">
										<s:if test="%{isTop}"><font color="red"></s:if>
					       				<s:if test="%{isCommend}"><font color="green"></s:if>
					       					<s:property value="title"/>
					       				<s:if test="%{isTop}"></font><img  src="images/top.gif"></s:if>
					       				<s:if test="%{isCommend}"></font><img  src="images/recommend.png"></s:if>
										</a></td>
										<td width="20%" align="right" class="gray"><s:property value="addTime" /></td>
									</tr>
								</s:iterator>
							</table>
							<table width="92%" border="0" align="center" cellpadding="5" cellspacing="0">
								<tr>
									<td align="right"></td>
								</tr>
							</table></td>
					</tr>
				</table></td>
			<td width="288" align="right" valign="top">
			<table width="273" border="0" cellpadding="0" cellspacing="1" bgcolor="#AEE1DC">
					<tr>
						<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/index5_37.gif">
								<tr>
									<td width="4%">&nbsp;</td>
									<td width="53%" align="left" class="black14b">本类Top15</td>
									<td width="43%" align="right"><img src="images/index5_39.gif" width="35" height="29" /></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td align="center" valign="top" bgcolor="#FFFFFF"><table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="12"></td>
								</tr>
							</table>

							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr><td></td><td width="10%">点击</td></tr>	
								<s:iterator value="top15">
									<s:url action="Article_show" id="url">
										<s:param name="articleId">
											<s:property value="id" />
										</s:param>
									</s:url>
									
									<tr>

										<td height="24"><s:a href="%{url}">
											<s:if test="%{isTop}"><font color="red"></s:if>
						       				<s:if test="%{isCommend}"><font color="green"></s:if>
						       					<s:property value="title"/>
						       				<s:if test="%{isTop}"></font><img  src="images/top.gif"></s:if>
						       				<s:if test="%{isCommend}"></font><img  src="images/recommend.png"></s:if>
											</s:a>
										</td>
										<td><s:property value="hits"/></td>
									</tr>
								</s:iterator>
							</table></td>
					</tr>
				</table></td>
		</tr>
	</table>
	
</body>
</html>