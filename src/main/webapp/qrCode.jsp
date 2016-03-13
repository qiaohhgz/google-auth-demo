<%@ page import="com.jim.google.auth.util.QrCodeUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: qiao
  Date: 16/3/13
  Time: 下午9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="http://qiao-private.oss-cn-shanghai.aliyuncs.com/style/weui.min.css"/>
</head>
<body>
<%
    String value = request.getParameter("value");
    QrCodeUtil.INSTANCE.makeQrCode(request, response, value);
%>
</body>
</html>
