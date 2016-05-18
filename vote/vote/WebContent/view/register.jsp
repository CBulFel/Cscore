<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.vote.service.*"%>
<%@page import="com.vote.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册账号</title>
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
        .center_confirmpsw{
           // background-color: #6bf8ff;
            width: 50%;
            height: 50px;
            margin: 20px auto;
            padding-top: 10px;
        }
        .center_confirmpsw_box{
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
        <div class="center_tips_box"><h2 style="color: #4587ff">用户名注册</h2></div>
    </div>

<form action="" name="fm" method="post">
    <div class="center_username">
        <div class="center_username_box">
            <input style="width:300px; height:50px;font-size:18px;" type="text" placeholder="输入用户名"
                   id="registerName" name="registerName" onBlur="showInfo(this.value)"/><br/>
            <font color='red'><span id="usnError"></span></font>
        </div>
    </div>

    <div class="center_password">
        <div class="center_password_box">
            <input style="width:300px; height:50px;font-size:18px;" type="password" placeholder="输入密码"
                   id="registerPassword" name="registerPassword"  />
        </div>
    </div>

    <div class="center_confirmpsw">
        <div class="center_confirmpsw_box">
            <input style="width:300px; height:50px;font-size:18px;" type="password" placeholder="输入确认密码"
                   id="confirmPassword" name="confirmPassword" />
        </div>
    </div>
</form>
    <div class="center_button">
        <div class="center_button_box">
            <input style="width:305px; height:50px;background-color: #4587ff; font-size:20px;font-style:oblique;color: aliceblue"
                   type="button" value="立即注册 " name="add" onClick="submit();" class="btn"/>
        </div>
    </div>

</body>

<script type="text/javascript">
    //提交
    function submit(){
        if (validCheck()) {
            document.fm.action="./registerAction.jsp";
            document.fm.submit();
            return;
        }

    }


    //有效性校验
    function validCheck()
    {
        var registerName = document.fm.registerName.value;
        var registerPassword = document.fm.registerPassword.value;
        var confirmPassword = document.fm.confirmPassword.value;

        if (registerName == "" || registerName.length == 0) {
            alert("请输入用户名。");
            document.getElementById("registerName").focus();

            return false;
        }
//

        if (registerPassword == "" || registerPassword.length == 0) {
            alert("请输入新密码。");
            document.getElementById("registerPassword").focus();
            alert( "3" );

            return false;
        }
        if (confirmPassword == "" || confirmPassword.length == 0) {
            alert("请输入确认密码。");
            document.getElementById("confirmPassword").focus();
            alert( "4" );

            return false;
        }
        if (confirmPassword != "" && registerPassword != "") {
            if(confirmPassword != registerPassword)
            {
                alert("新密码与确认密码输入不一致，请检查。");
                document.getElementById("confirmPassword").focus();

                return false;
            }
        }
        //

        if(registerName != " " && registerName.length != 0){
            //去掉str的所有空格
            var str= document.getElementById("usnError").innerHTML.replace(/\s/g, "") ;

            if(str=="用户名已存在！"){

                return false;
            }

        }
        return true;
    }

    //Ajax请求
    var http_request = false;

    //初始化、指定处理函数、发送请求的函数
    function send_request(url) {
        http_request = false;
        //开始初始化XMLHttpRequest对象
        if (window.XMLHttpRequest) { //Mozilla 浏览器
            http_request = new XMLHttpRequest();
            if (http_request.overrideMimeType) {//设置MiME类别
                http_request.overrideMimeType('text/xml');
            }
        } else if (window.ActiveXObject) { //IE浏览器
            try {
                http_request = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    http_request = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {
                }
            }
        }
        if (!http_request) { // 异常，创建对象实例失败
            window.alert("不能创建XMLHttpRequest对象实例.");
            return false;
        }
        http_request.onreadystatechange = processRequest;
        // 确定发送请求的方式和URL以及是否同步执行下段代码
        http_request.open("GET", url, true);
        http_request.send(null);
    }

    //处理返回信息的函数
    function processRequest() {
        if (http_request.readyState == 4) { // 判断对象状态
            if (http_request.status == 200) { // 信息已经成功返回，开始处理信息
                //alert(http_request.responseText);
                var responseText = http_request.responseText;
                if(responseText !="")
                {
                    document.getElementById("usnError").innerHTML = responseText;
                }
            } else {//页面不正常
                alert("您所请求的页面有异常。");
            }
        }
    }

    //显示提示信息
    function showInfo(str) {
        if( str==null || str.length==0 ){
            alert("用户名不能为空");
            return ;
        }
        var url = "checkOldUsn.jsp";
        url = url + "?username=" + str;

        send_request(url);
    }

</script>

</html>