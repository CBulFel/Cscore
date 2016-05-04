<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="check.jsp"%>
<html>
<head>

<title>创建密钥</title>
<base target="_self">
<link rel="stylesheet" type="text/css" href="skin/css/base.css" />
<link rel="stylesheet" type="text/css" href="skin/css/main.css" />

<style type="text/css">
 .div_class{
 width:auto;
 height:auto;
 margin-left:20;
 margin-top:1%;
 }
</style>

<script>
function bu_submit(){
	var value=document.getElementById("textPsw").value;
	if( value!=" " && value.length!=0 ){
		document.fm.action="./createSubAction.jsp";
		document.fm.submit();
		return;
	}
	else 
		alert("密钥不允许为空！");
	}
	
function bu_cancel(){
    history.go(-1);
}
</script>

</head>
<body topmargin="2">
<form action="" name="fm"  method="post">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
    <div class="div_class"> 
    <h2>温馨提示：子用户密钥以 最新创建的 为当前密钥 </h2><br/>
	 <input placeholder="输入密钥" style="width:300px; height:30px;font-size:18px;" type="text" name="textPsw" id="textPsw"/> <br/><br/>
	<input style="width:100px; height:30px;font-size:18px;" type="button" value="确定" onClick="bu_submit()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input style="width:100px; height:30px;font-size:18px;" type="button" value="取消" onClick="bu_cancel()"/>
	</div>
     </td>
  </tr>
</table>
	</form>
</body>
</html>