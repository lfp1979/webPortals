<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章管理</title>
<link rel="stylesheet" type="text/css" href="images/Style.css">
<script language="javascript">
	var IsChkAll = false;
	var msg = "<s:property value='msg'/>";
	if (msg != "")
		alert(msg);
	function ChkAll(frm) {
		IsChkAll = !IsChkAll;
		for (var i = 0; i < frm.elements.length; i++)
			if (frm.elements[i].type == "checkbox")
				frm.elements[i].checked = IsChkAll;
	}

	function a_edit(frm) {
		var a_id = 0;
		var a_count = 0;
		for (var i = 0; i < frm.elements.length; i++)
			if (frm.elements[i].id == "Id" && frm.elements[i].checked) {
				a_id = frm.elements[i].value;
				a_count++;
			}
		if (a_count != 1)
			alert("请选择一篇你需要修改/查看的文章");
		else
			window.location.href = "Article_edit?id=" + a_id;
	}

	function add() {

		window.location.href = "Article_add";
	}

	function a_action(frm, aStr) {
		var a_count = 0;
		for (var i = 0; i < frm.elements.length; i++)
			if (frm.elements[i].name == "ids" && frm.elements[i].checked)
				a_count++;
		if (a_count == 0)
			alert("你需要至少选择一篇文章进行相关操作");
		else {
			frm.cmd.value = aStr;
			frm.submit();
		}
	}
</script>
</head>
<body>
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
												<td background="images/tab_active_bg.gif" class="tab"><strong class="mtitle">文章管理</strong></td>
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
														<table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#aaaaaa">
															<s:form theme="simple" id="form1" name="form1" method="post" action="Article_search">
																<tr>
																	<td colspan="7" align="left" bgcolor="#dddddd">
																	<s:select list='#{"title":"按标题","content":"按内容"}' name="stype" id="stype"/>
																	<input name="keyword" type="text" id="keyword" size="25" /> 
																	按属性排序：
																	<s:select name="paixu" list='#{"isPlay":"轮播","isMove":"滚动","isPic":"图片" }'/>
																	  <input name="Submit" type="submit" class="bntStyle"	value="查 找" /></td>
																</tr>
															</s:form>
															<s:form id="form2" name="form2" method="post" action="Article_update" theme="simple">
																<s:textfield type="hidden" name="cmd" />
																<s:textfield type="hidden" name="pageNum" />
																<s:textfield type="hidden" name="isSearch" />
																<s:textfield type="hidden" name="paixu" />
																<s:textfield type="hidden" name="keyword" />
																<s:textfield type="hidden" name="stype" />
																<tr>
																	<td colspan="7" align="left" bgcolor="#dddddd">
																	<input name="bntEdit" type="button" class="bntStyle" id="bntEdit" onClick="a_edit(this.form)" value="修改/查看" /> 
																		<input name="bntCopy" type="button" class="bntStyle" id="bntCopy" onClick="add()" value="添加文章" /> 
																		<input name="bntDel" type="button" class="bntStyle" id="bntDel"	onClick="a_action(this.form,'del')" value="删 除" /> 
																		<input name="bntPass" type="button" class="bntStyle" id="bntPass"	onClick="a_action(this.form,'pass')" value="开 通" /> 
																		<input name="bntNotPass" type="button" class="bntStyle"	id="bntNotPass" onClick="a_action(this.form,'unpass')" value="关 闭" /> 
																		<input name="bntIsTop" type="button"	class="bntStyle" id="bntIsTop" onClick="a_action(this.form,'top')" value="置 顶" />
																		 <input name="bntNotIsTop" type="button"	class="bntStyle" id="bntNotIsTop" onClick="a_action(this.form,'untop')" value="取消置顶" /> 
																		<input name="bntIsCommend"	type="button" class="bntStyle" id="bntIsCommend" onclick="a_action(this.form,'commend')" value="推 荐" />
																		 <input	name="bntNotIsCommend" type="button" class="bntStyle" id="bntNotIsCommend" onClick="a_action(this.form,'uncommend')" value="取消推荐" /> 
																		<input name="bntIsPic" type="button" class="bntStyle" id="bntIsPic" onClick="a_action(this.form,'pic')"	value="图 片" />
																		 <input name="bntNotIsPic" type="button" class="bntStyle" id="bntNotIsPic"	onClick="a_action(this.form,'unpic')" value="取消图片" /> 
																		 <input name="Cmd" type="hidden" id="Cmd" /></td>
																		 
																</tr>
																<tr>
																	<td align="center" bgcolor="#dddddd">
																	<img src="images/formcheckbox.gif" width="20" height="20" style="cursor: hand;"	onClick="javascript:ChkAll(forms[1]);" /></td>
																	<td align="center" bgcolor="#dddddd">编号</td>
																	<td align="center" bgcolor="#dddddd">标题</td>
																	<td align="center" bgcolor="#dddddd">栏目</td>
																	<td align="center" bgcolor="#dddddd">属性</td>
																	<td align="center" bgcolor="#dddddd">状态</td>
																	<td align="center" bgcolor="#dddddd">添加时间</td>
																</tr>
																<s:iterator value="articles" var="art">
																	<s:set name="check" value="false"/>
																	<s:iterator value="ids" var="id">
																		<s:if test="%{#id==#art.id}">
																			<s:set name="check" value="true"/>
																		</s:if>
																		
																	</s:iterator>
																	<tr>
																		<td align="center" bgcolor="#FFFFFF"><s:checkbox id="Id" name="ids" fieldValue="%{#art.id}" value="%{#check}"/></td>
																		<td align="center" bgcolor="#FFFFFF"><s:property value="id" /></td>
																		<td align="center" bgcolor="#FFFFFF"><a href="Article_edit?id=<s:property value="id"/>"><s:property value="title" /></a></td>
																		<td align="center" bgcolor="#FFFFFF"><s:property value="clazz.sortName" /></td>
																		<td align="center" bgcolor="#FFFFFF"><s:if test="isTop">置顶</s:if> <s:if test="isCommend">推荐 </s:if> <s:if
																				test="isPic">图片 </s:if> <s:if test="isPlay">轮播</s:if> <s:if test="isMove">滚动</s:if></td>
																		<td align="center" bgcolor="#FFFFFF"><s:if test="isPass">√</s:if>
																			<s:else>
																				<span style="color: red;">×</span>
																			</s:else></td>
																		<td align="center" bgcolor="#FFFFFF"><s:property value="addTime" /></td>
																	</tr>
																</s:iterator>

																<tr>
																	<td colspan="7" align="right" bgcolor="#FFFFFF"><s:property value="pagination" escape="false" /></td>
																</tr>
																<s:if test="articles.isEmpty()">
																	<tr>
																		<td colspan="7" align="center" bgcolor="#FFFFFF">没有相关内容</td>
																	</tr>
																</s:if>
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
</body>
</html>