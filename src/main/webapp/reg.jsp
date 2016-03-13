<%@ page import="com.jim.google.auth.util.GoogleAuth" %>
<%--
  Created by IntelliJ IDEA.
  User: qiao
  Date: 16/3/13
  Time: 下午9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="http://qiao-private.oss-cn-shanghai.aliyuncs.com/style/weui.min.css"/>
</head>
<body>

<%
    String secretKey = GoogleAuth.generateSecretKey();
%>

<form id="loginForm" action="two-auth.jsp" method="post">
    <input type="hidden" name="secretKey" value="<%= secretKey%>"/>

  <div class="weui_cell weui_cell_warn">
    <div class="weui_cell_hd"><label for="" class="weui_label">登录名</label></div>
    <div class="weui_cell_bd weui_cell_primary">
      <input class="weui_input" name="name" type="tel" value="" placeholder="请输入"/>
    </div>
  </div>

  <a href="javascript:;loginForm.submit()" class="weui_btn weui_btn_primary">注册</a>
</form>

</body>
</html>
