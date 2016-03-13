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
    String secretKey = request.getParameter("secretKey");
    String url = GoogleAuth.generateOTPUrl(loginName, secretKey);
    if (Constants.userSecretMap.containsKey(loginName)) {
        request.setAttribute("msg", "用户名'" + loginName + "'已存在");
        request.getRequestDispatcher("msg.jsp").forward(request, response);
    }
%>

<p>请打开Google Authenticator 扫描二维码绑定注册用户</p>
<img src="qrCode.jsp?value=<%=url %>" alt="二次绑定二维码"/>

<form id="regForm" action="doReg.jsp" method="post">
    <input type="hidden" name="name" value="<%=loginName%>"/>
    <input type="hidden" name="secretKey" value="<%=secretKey%>"/>

    <div class="weui_cell weui_cell_warn">
        <div class="weui_cell_hd"><label for="" class="weui_label">随机码</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" name="otp" type="tel" value="" placeholder="请输入6位随机码"/>
        </div>
    </div>

    <a href="javascript:;regForm.submit()" class="weui_btn weui_btn_primary">确认</a>

</form>

</body>
</html>
