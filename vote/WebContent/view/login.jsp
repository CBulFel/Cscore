<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//清IE缓存，防止用户注销后点IE后退进入系统
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires",0);
%>
<%
String errmsg = request.getParameter("errmsg");
request.getSession(true);
String chk = "false";
session.setAttribute("Enter", chk);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户登录</title>
    <style type="text/css" >
        *{
            margin: 0px;
            padding: 0px;
        }

        .top{
            width: 100%;
            height: 100px;
            background-color: #4587ff;
            padding-top: 50px;
        }
        .top_content {

            width: 80%;
            height: 50px;

            margin: 0px auto;
        }
        .center_tips{
        // background-color: cornflowerblue;
            width: 50%;
            height: 50px;
            margin: 20px auto;
            padding-top: 20px;
        }
        .center_tips_box{
        // background-color: aquamarine;
            width: 20%;
            height: 50px;
            margin: 0 auto;
        }
        .center_username{
        //background-color: blanchedalmond;
            width: 50%;
            height: 50px;
            margin: 20px auto;
            padding-top: 10px;
        }
        .center_username_box{
        // background-color: cadetblue;
            width:50%;
            height: auto;
            margin: 0 auto;
        }
        .center_password{
        // background-color: #34ff7f;
            width: 50%;
            height: 50px;
            margin: 20px auto;
            padding-top: 10px;
        }
        .center_password_box{
        // background-color: #fe2eff;
            width: 50%;
            height: auto;
            margin: 0px auto;
        }
        .center_radio{
        // background-color: #6bf8ff;
            width: 50%;
            height: 50px;
            margin: 20px auto;
            padding-top: 10px;
        }
        .center_radio_box{
        // background-color: #fe2eff;
            width: 50%;
            height: auto;
            margin: 0px auto;
        }
        .center_button{
        // background-color: #ff4bd3;
            width: 50%;
            height: 50px;
            margin: 20px auto;
            padding-top: 10px;
        }
        .center_button_box{
        // background-color: #4163ff;
            width: 50%;
            height: auto;
            margin: 0px auto;
        }

    </style>
</head>
<body>

<div class="top">
    <div class="top_content">
        <b style="font-size:32px;">欢迎使用课堂评分统计系统 </b>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;
        <a href="login.jsp">
            <b style="font-size:20px;background-color: #4587ff;">登录</b>
        </a>
        &nbsp;&nbsp;
        <a href="register.jsp">
        <b style="font-size:20px;background-color: #4587ff;">注册</b>
        </a>
    </div>
</div>

<div class="center_tips">
    <div class="center_tips_box"><h2 style="color: #4587ff">用户名登录</h2>
    
    </div>
</div>

<form id="logform" action="user/loginAction.jsp" method="post" onKeyDown="entersubmit(event)">
    <div class="center_username">
        <div class="center_username_box">
            <input style="width:300px; height:50px;font-size:18px;" type="text" placeholder="输入用户名"
                   id="txtUserName" name="username" /><br/>
            <font color='red'><span id="usnError"></span></font>
        </div>
    </div>

    <div class="center_password">
        <div class="center_password_box">
            <input style="width:300px; height:50px;font-size:18px;" type="password" placeholder="输入密码"
                   id="txtUserPassword"  name="password"  /><br/>
    <span style="font-size:15px;color: red;">
        <%
        if (errmsg != null && errmsg.equals("error1"))
        out.print("用户名或者密码不正确!");
        else if (errmsg != null && errmsg.equals("error2"))
        out.print("请先登陆!");
        %>
    </span>
        </div>
    </div>

    <div class="center_radio">
        <div class="center_radio_box">
            &nbsp;  <b style="color: #4587ff; font-size:20px;">管理员</b>
            <input style="width:15px; height:15px;" name=radioFlag type="radio" value="1" checked = "checked" >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <b style="color: #4587ff;font-size:20px;">子用户</b>
            <input style="width:15px; height:15px;"  name=radioFlag type="radio" value="0">
        </div>
    </div>

</form>
<div class="center_button">
    <div class="center_button_box">
        <input style="width:305px; height:50px;background-color: #4587ff; font-size:20px;font-style:oblique;color: aliceblue"
               type="button" value="立即登录 " id="btnLogin"  name="btnLogin" onClick="javascript:OK_onClick()"/>
    </div>
</div>

</body>

<script type="text/javascript">
    function OK_onClick() {
        if (chkForm()) {
            document.getElementById("logform").submit();

            return;
        }
    }

    function chkForm() {
        var chkName = document.getElementById("txtUserName").value;
        var chkPassword = document.getElementById("txtUserPassword").value;

        if (chkName == "" || chkName.length == 0) {
            alert("请输入用户名。");
            return false;
        } else if (chkPassword == "" || chkPassword.length == 0) {
            alert("请输入密码。");
            document.getElementById("txtUserPassword").focus();
            return false;
        }

        return true;
    }

    //通过点击回车键提交表单
    function entersubmit(e) {
        var charCode = (navigator.appName == "Netscape") ? e.which : e.keyCode;
        if (charCode == 13) {
            OK_onClick();
        }
    }

</script>
</html>