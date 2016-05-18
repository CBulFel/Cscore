<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="check.jsp"%>
<%@page import="com.vote.bean.*"%>
<%@page import="com.vote.service.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>课堂评分统计系统</title>
		<link type="text/css" rel="stylesheet" href="/vote/view/css/main.css" />
<script type="text/javascript">
//提交
function sbmOK(){
	if (chkForm()) {
		document.fm.submit();
	}
 }

//校验
function chkForm() {
	
	var title = document.getElementById("title").value;
	var discribe = document.getElementById("discribe").value;
	var endtime =  document.getElementById("date").value;
	
	if (title == "" || title.length == 0) {
		alert("输入域 主题 不能为空。");
		document.getElemntById("title").focus();
		return false;
	} else if (discribe == "" || discribe.length == 0) {
		alert("输入域 描述 不能为空。");
		document.getElementById("discribe").focus();
		return false;
	}
	else if( !judge(endtime) ){
	      alert("输入日期不合理  不能晚于今天");
		  document.getElementById("date").focus();
		  return false;
	}
	
	return true;
}

//取消
function cancel(){
 	history.go(-1);
 }
 
 //判断时间
 function judge(value){
 var myDate = new Date();
 var now=myDate.toLocaleDateString();     //获取当前日期
 
  var nowarray=now.split("/");
  var year=nowarray[0];
  var month=nowarray[1];
  var day=nowarray[2];
  if((month.length)<2){
  month=0+month;
  }
  
  if((day.length)<2){
  day=0+day;
  }
  now=year+"0"+month+"0"+day;
  
  
  value=value.replace("-","0");
  value=value.replace("-","0");
  /*
  alert(now);
  alert(now.length);
  alert(value);
  alert(value.length);
  */
 if(now>=value){
 return false;
     }
 return true;
 }
 
</script>
	</head>
	<body leftmargin="8" topmargin="8">
		<form action="./wjNewAction.jsp" name="fm" method="post">
		<input type="hidden" name="createUser" value="<%=session.getAttribute("userName")%>" />
		<table width="100%" align="center" class="table">
				<tbody>
					<tr>
						<td height="30"></td>
					</tr>
					<tr>
						<td align="center">
							新建评分表<br/>
						</td>
					</tr>
				</tbody>
			</table>
			<table width="100%" align="center" class="table">
				<tr>
					<td height="30" width="80px" align="right">
						主题：
					</td>
					<td>
						&nbsp;
						<input type="text" name="title" id="title" style="width:350px" />
					</td>
				</tr>
				<tr>
					<td height="30" align="right">
						描述：
					</td>
					<td>
						&nbsp;
						<textarea name="discribe" id="discribe" cols="100" rows="15" ></textarea>
					</td>
				</tr>
				<tr>
					<td height="30" align="right">
						是否匿名：
					</td>
					<td>
						是<input name="anonymousFlag" type="radio" value="1" checked/>&nbsp;&nbsp;
                                                                否<input name="anonymousFlag" type="radio" value="0" />
					</td>
				</tr>
				<tr>
				<td height="30" align="right">
				       截止时间：
				</td>
				<td>
				      <input name="date" id="date" type="date"  >
				</td>
				</tr>
				<tr>
					<td height="30">
					</td>
					<td>
						&nbsp;
						<input type='button'   onClick="sbmOK();" value="确     定 "/>
						&nbsp;&nbsp;
						<input type="button"   onclick="cancel()" value=" 取    消 " />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
