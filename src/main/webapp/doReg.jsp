<%@ page import="com.jim.google.auth.util.GoogleAuth" %>
<%@ page import="com.jim.google.auth.commons.Constants" %>
<%--
  Created by IntelliJ IDEA.
  User: qiao
  Date: 16/3/13
  Time: 下午9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>加入两步验证</title>
    <link rel="stylesheet" href="http://qiao-private.oss-cn-shanghai.aliyuncs.com/style/weui.min.css"/>
</head>
<body>
<%
    String loginName = request.getParameter("name");
    if (Constants.userSecretMap.containsKey(loginName)) {
        response.getWriter().write("账号已存在");
    }else{
        String secretKey = request.getParameter("secretKey");
        String otp = request.getParameter("otp");
        boolean loginFlag = GoogleAuth.login(secretKey, Integer.parseInt(otp));
        if(loginFlag){
            Constants.userSecretMap.put(loginName, secretKey);
            response.getWriter().write("绑定成功");
        }else{
            response.getWriter().write("绑定失败");
        }
    }
%>

<a href="login.jsp" class="weui_btn weui_btn_primary">去登录</a>
<a href="reg.jsp" class="weui_btn weui_btn_primary">去注册</a>



</body>
</html>
