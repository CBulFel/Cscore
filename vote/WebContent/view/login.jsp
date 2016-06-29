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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="bootstrap/disk/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="list-group ">
        <ol class="breadcrumb  col-md-10 col-md-offset-1  navbar-fixed-top ">
            <li ><a><h1>欢迎使用课堂评分统计系统</h1></a></li>
        </ol>
    </div>
<br/><br/><br/><br/><br/>
    <div class="row ">
        <ul class="btn-lg nav nav-pills col-md-offset-5 " id="myTabs" >
            <li role="presentation" class="active">
                <a href="#login" aria-controls="login" role="tab" data-toggle="tab">登录</a>
            </li>

            <li role="presentation">
                <a href="#register" aria-controls="register" role="tab" data-toggle="tab">注册</a></li>
        </ul>

           

      
        <div class="tab-content col-md-4 col-md-offset-4">
            <div class="tab-pane  active " id="login">
                <br/><br/>
      <form id="logform" action="user/loginAction.jsp" method="post" onKeyDown="entersubmit(event)">
                <div class="input-group input-group-lg">
            <span class="input-group-addon " id="basic-addon1">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            </span>
                    <input type="text" id="txtUserName" name="username" 
                     class="form-control " placeholder="Username" aria-describedby="basic-addon1">
                     
                </div>
               <font><span size=4 style="font-size:15px;color: red;" >
        <%
        if (errmsg != null && errmsg.equals("error1"))
        out.print("用户名或者密码不正确!");
        else if (errmsg != null && errmsg.equals("error2"))
        out.print("请先登陆!");
        %>
            </span></font> 
                <br/><br/>
                <div class="input-group input-group-lg">
             <span class="input-group-addon "  id="basic-addon2">
                 <span class="glyphicon glyphicon-lock"></span>
             </span>
                    <input type="password" id="txtUserPassword" name="password" 
                     class="form-control" placeholder="Password" aria-describedby="basic-addon2">
                </div>
                <br/><br/>
                <label class="radio-inline ">
                    <input type="radio" name="radioFlag" value="1" checked > 管理员
                </label>

                <label class="radio-inline ">
                    <input type="radio" name="radioFlag" value="0"> 子用户
                </label>

                <br/><br/>
                
     </form>
                <button type="button" class="btn btn-primary col-md-12 btn-lg"
                        id="btnLogin"  name="btnLogin" onClick="javascript:OK_onClick()">立即登录</button>
            </div>
             
            
        
            <div class="tab-pane" id="register">
                <br/><br/>
     <form action="" name="fm" method="post">
                <div class="input-group input-group-lg">
            <span class="input-group-addon " id="basic-addon11">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            </span>
                    <input type="text" id="registerName" name="registerName" onBlur="showInfo(this.value)" class="form-control" placeholder="Username" aria-describedby="basic-addon11">
                </div>
            <font color='red'><span id="usnError"></span></font>
                <br/><br/>
         
                <div class="input-group input-group-lg">
             <span class="input-group-addon "  id="basic-addon22">
                 <span class="glyphicon glyphicon-lock"></span>
             </span>
                    <input type="password" id="registerPassword" name="registerPassword" class="form-control" placeholder="Password" aria-describedby="basic-addon22">
                </div>
                
                <br/><br/>
                <div class="input-group input-group-lg">
             <span class="input-group-addon "  id="basic-addon23">
                 <span class="glyphicon glyphicon-lock"></span>
             </span>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="confirmPassword" aria-describedby="basic-addon23">
                </div>
                <br/>
                
                
                <div class="checkbox ">
                    <label>
                        <input type="checkbox" onchange="chboxChange(this)" name="chbox" checked>我已同意
                    </label>
                </div>
                <br/>
         </form>
                <button type="button" id="regId" name="add" onClick="submit();" class="btn btn-primary col-md-12 btn-lg">立即注册</button>
            </div>
        
        
        </div>

    </div>


    <div class="row " >
        <ol class="breadcrumb col-md-10 col-md-offset-1 navbar-brand navbar-fixed-bottom "
        >
            <li><a href="#">关于系统</a></li>
            <li><a href="#">联系我们</a></li>
            <li><a href="#">常见问题</a></li>
        </ol>
    </div>
</div>

<script src="bootstrap/disk/js/jquery-2.2.3.min.js"></script>
<script src="bootstrap/disk/js/bootstrap.min.js"></script>
<script>
    $("#myTabs a").click(function (e) {
        e.preventDefault();
        $(this).tab("show");
    });

</script>


<script type="text/javascript">
//登录提交
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

<script type="text/javascript">
//同意判断函数
function chboxChange(chbox){
	if(chbox.checked==false){
		document.getElementById("regId").disabled=true;
	}
	else
		document.getElementById("regId").disabled=false;
}
    //注册提交
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
</body>
</html>