<%@ page import="com.jim.google.auth.util.GoogleAuth" %>
<%@ page import="com.jim.google.auth.commons.Constants" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
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
</head>
<body>
<%
    String loginName = request.getParameter("name");
    String otp = request.getParameter("otp");
    String secretKey = Constants.userSecretMap.get(loginName);
    if (StringUtils.isEmpty(secretKey)) {
        response.getWriter().write("您未注册");
    } else if (StringUtils.isEmpty(otp)) {
        response.getWriter().write("请输入随机码");
    } else {
        boolean loginFlag = GoogleAuth.login(secretKey, Integer.parseInt(otp));
        if (loginFlag) {
            request.getRequestDispatcher("welcome.jsp").forward(request, response);
        } else {
            response.getWriter().write("随机码有误，请重新输入");
        }
    }
%>
</body>
</html>
