<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebPortals</title>
<link href="css/css2.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/page.css">
<link href="css/index.css" rel="stylesheet" type="text/css">
</head>
<body>

<jsp:include page="top.jsp"/>
	<div class="cell">
		<s:action name="Article_listByOrderId" executeResult="true">
			<s:param name="orderId" value="1"/>
		</s:action>
	
        <s:action name="Article_listByOrderId" executeResult="true">
			<s:param name="orderId" value="2"/>
		</s:action>
    </div>
    <div class="cell">
		 <s:include value="picShow.jsp"/>
         <s:action name="Article_listByOrderId" executeResult="true">
			<s:param name="orderId" value="3"/>
		</s:action>
    </div>
    <div class="cell  right">
		 <s:include value="articleList.jsp"/>
    </div>

    <div class="cell">
		 <s:action name="Article_listByOrderId" executeResult="true">
			<s:param name="orderId" value="4"/>
		</s:action>
    </div>
    <div class="cell">
		 <s:action name="Article_listByOrderId" executeResult="true">
			<s:param name="orderId" value="5"/>
		</s:action>
    </div>
    <div class="cell">
		 <s:action name="Article_listByOrderId" executeResult="true">
			<s:param name="orderId" value="6"/>
		</s:action>
    </div>


    <div class="cell bottom">
		<div class="inner ">
        	<div class="title">
        		<span>友情链接</span>
        		<img src="images/index5_39.gif" class="img-right"/>
        	</div>
		 	<ul>
            	<s:iterator value="urlList" var="u">
       				<li><a href='<s:property value="Lurl"/>'><s:property value="Lname"/></a></li>
       			</s:iterator>
         	</ul>
        </div>
   	</div>
<jsp:include page="footer.jsp"/>
</body>

</html>
