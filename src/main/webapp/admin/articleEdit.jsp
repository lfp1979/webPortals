<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑文章</title>
<link rel="stylesheet" type="text/css" href="images/Style.css">
<script src="ckeditor/ckeditor.js"></script>
</head>
<body>
	<script type="text/javascript">
		var msg = "<s:property value='msg'/>";
		if (msg != "")
			alert(msg);
	</script>
	<s:include value="top.jsp" />
	<table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
		<tbody>
			<tr>
				<td style="PADDING-LEFT: 2px; HEIGHT: 22px" background="images/tab_top_bg.gif">
					<table cellspacing="0" cellpadding="0" width="477" border="0">
						<tbody>
							<tr>
								<td width="147"><table height="22" cellspacing="0" cellpadding="0" border="0">
										<tbody>
											<tr>
												<td width="3"><img id="tabImgLeft__0" height="22" src="images/tab_active_left.gif" width="3" /></td>
												<td background="images/tab_active_bg.gif" class="tab"><strong class="mtitle">文章编辑</strong></td>
												<td width="3"><img id="tabImgRight__0" height="22" src="images/tab_active_right.gif" width="3" /></td>
											</tr>
										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td bgcolor="#ffffff"><table cellspacing="0" cellpadding="0" width="100%" border="0">
						<tbody>
							<tr>
								<td width="1" background="images/tab_bg.gif"><img height="1" src="images/tab_bg.gif" width="1" /></td>
								<td style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px" valign="top">
									<div id="tabContent__0" style="DISPLAY: block; VISIBILITY: visible">
										<table cellspacing="1" cellpadding="1" width="100%" align="center" bgcolor="#8ccebd" border="0">
											<tbody>
												<tr>
													<td style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px" valign="top" bgcolor="#fffcf7">
														<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#EBEBEB">
															<s:form action="Article_saveOrUpdate" theme="simple">
																<s:textfield type="hidden" name="article.id" />
																<s:textfield type="hidden" name="article.sortPath" />
																<tr bgcolor="#FFFFFF">
																	<td align="right">标题 <span class="red">*</span>
																	</td>
																	<td colspan="3"><s:textfield name="article.title" size="50" maxlength="225" /> <s:fielderror fieldName="article.title" style="color:red" /></td>
																</tr>
																<tr bgcolor="#FFFFFF">
																	<td align="right">分类 <span class="red">*</span>
																	</td>
																	<td colspan="3"><s:select list="sorts" name="article.clazz.id" listKey="id" listValue="sortName" /></td>
																</tr>
																<tr bgcolor="#FFFFFF">
																	<td align="right">上传</td>
																	<td colspan="3"><iframe src="upload.jsp" width="100%" height="50px" scrolling="no"></iframe></td>
																</tr>
																<tr bgcolor="#FFFFFF">
																	<td align="right">内容 <span class="red">*</span> <br> <s:fielderror fieldName="article.content" style="color:red" />
																	</td>
																	<td colspan="3"><s:textarea name="article.content" id="content" /> <script>
																		CKEDITOR
																				.replace('content');
																	</script></td>
																</tr>

																<tr bgcolor="#FFFFFF">
																	<td align="right">文章属性</td>
																	<td colspan="3">通过审核:<s:checkbox name="article.isPass" label="通过审核" /> 
																					图片<s:checkbox id="IsPic" name="article.isPic" label=" 图片" onClick="javascript:ChkIsPic();" /> 
																					滚动<s:checkbox name="article.isMove" label=" 滚动" /> 
																					首页轮播<s:checkbox name="article.isPlay" label=" 首页轮播" /> 
																					推荐<s:checkbox name="article.isCommend" label=" 推荐" /> 
																					置顶<s:checkbox name="article.isTop" label=" 置顶" />
																	</td>
																</tr>
																<tr style="display: none;" id="DisIsPic" bgcolor="#FFFFFF">
																	<td align="right">&nbsp;图片地址<span class="red">*</span></td>
																	<td colspan="3"><s:textfield name="article.picFile" size="50" maxlength="225" /></td>
																</tr>

																<tr bgcolor="#FFFFFF">

																	<td align="right">来源</td>
																	<td><s:textfield name="article.comeFrom" size="50" maxlength="225" /></td>
																	<td align="right">作者</td>
																	<td><s:textfield name="article.author" size="50" maxlength="225" /></td>
																</tr>
																<tr bgcolor="#FFFFFF">
																	<td align="right">添加时间</td>
																	<td><input readonly="readonly" type="text" size="50" maxlength="225" name="article.addTime" value="<s:date name="article.addTime" nice="false"/>"></td>
																	<td align="right">查看数</td>
																	<td><s:textfield name="article.hits" size="50" maxlength="225" /></td>
																</tr>

																<tr bgcolor="#FFFFFF">
																	<td align="right">&nbsp;</td>
																	<td colspan="3"><input type="submit" name="Submit2" value="保 存" /> <input type="button" name="Submit" value="取 消" onclick="javascript:document.URL='Article_List.asp';" /></td>
																</tr>
															</s:form>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</td>
								<td width="1" background="images/tab_bg.gif"><img height="1" src="images/tab_bg.gif" width="1" /></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td background="images/tab_bg.gif" bgcolor="#ffffff"><img height="1" src="images/tab_bg.gif" width="1" /></td>
			</tr>
		</tbody>
	</table>
	<script language="JavaScript" type="text/javascript">
		function ChkIsPic() {
			obj = document.getElementById("DisIsPic");
			obj.style.display = obj.style.display == "none" ? "" : "none";
		}

		if (document.getElementById("IsPic").checked)
			document.getElementById("DisIsPic").style.display = "";
	</script>
</body>
</html>