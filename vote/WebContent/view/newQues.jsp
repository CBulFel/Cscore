<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="check.jsp"%>
<%@page import="com.vote.service.*"%>
<%@page import="com.vote.bean.*"%>
<%@page import="java.sql.*"%>
<%
			String id = request.getParameter("oid");
			int oid = Integer.parseInt(id);
			MyTool tool = new MyTool();
			ObjectBean ob = ObjectBeanService.findObjectBeanByID(oid);
			int state = ob.getState();
			if (state == 1 || state == 2) {
		    //清空回复表中的数据
		    ReplayService.delReplay(oid);
		    //修改问卷状态为草稿
		    tool.UpdateCol("wj_object", "state", "0", "oid", id);
		  }
%>
<html>
	<head>
		<title>问卷管理系统</title>
		<link type="text/css" rel="stylesheet" href="/vote/view/css/main.css" />
		<script type="text/javascript">
var textNumber = 1,sEle;
	var qvalue=0;
	function getSelect(){
		var qvalue = document.myForm.qtype.value;
		var addbutton=document.getElementById("add");
		 if(qvalue!=3){
			 for(var i=1;i<=textNumber;i++)
			 {
			 document.getElementById("limtd_"+i).style.visibility= "hidden";
			 document.getElementsByTagName("INPUT")[i*2].setAttribute("type","hidden");
			 }
			 document.getElementById("limtext").style.visibility= "hidden";
		 	addbutton.removeAttribute("disabled");
		}else if(qvalue==3){
			for(var i=1;i<=textNumber;i++)
			{
			document.getElementById("limtd_"+i).style.visibility= "visible";
			document.getElementsByTagName("INPUT")[i*2].setAttribute("type","visible");
			}
			document.getElementById("limtext").style.visibility= "visible";
			addbutton.setAttribute("disabled","false");
		}
	 }
function addTextBox(form, afterElement) {
textNumber++;
var label = document.createElement("label");
		label.setAttribute("class", "m_left");
label.appendChild(document.createTextNode("选项"+textNumber+"："));
		var myTable = document.getElementById("myTable");
		var rowCnt = myTable.rows.length;
		var nextRow = myTable.insertRow(rowCnt -1);
		var cellTitle = nextRow.insertCell(0);
		var cellText = nextRow.insertCell(1);
		var cellLim = nextRow.insertCell(2);
		cellTitle.className = "m_left";
		cellTitle.setAttribute("valign", "top");
		cellTitle.appendChild(label);
		cellLim.id="limtd_"+textNumber;
		var txtName = "txt" + textNumber;
		var txtId = "txt" + textNumber;
		var limName = "lim" + textNumber;
		var limId = "lim" + textNumber;
		cellText.innerHTML = "<input type='text' name='" + txtName + "' id='" + txtId + "' style=\"width:260px;\"/>";
		if(form.qtype.value!=3)
		{cellLim.innerHTML = "<input type='hidden' name='" + limName + "' id='" + limId + "' onKeyUp=\" value=value.replace(/\D/g,'') \" style=\"width:50px;\" value='0'/>";}
		else if(form.qtype.value==3)
			{cellLim.innerHTML = "<input type='text' name='" + limName + "' id='" + limId + "' onKeyUp=\" value=value.replace(/\D/g,'') \" style=\"width:50px;\" value='0'/>";}
}
function removeTextBox(form) {
		var myTable = document.getElementById("myTable");
		var rowCnt = myTable.rows.length;
if (rowCnt > 4) {
			myTable.deleteRow(rowCnt-2);
textNumber--;
}
}
    //提交
	function submit(){
 		if(document.myForm.content.value.length==0)	{
 			alert("输入域 题目 不能为空");
 			document.myForm.content.focus();
 			return false;
 		}else{
 				var listCnt = document.getElementById("listCnt");
				listCnt.value = textNumber;
 		  	 	document.myForm.action="./newQuesAction.jsp";
 		  	    document.myForm.submit();
 				return true;
		}
	}
	
	//返回
	function back() {
		window.location.href="./quesList.jsp?oid=<%=oid%>";
	}
</script>
</head>
<body topmargin="2">
		<table cellspacing="0" cellpadding="0" width="500" align="center" class="tab">
			<tbody>
				<tr>
					<td height="30"></td>
				</tr>
				<tr>
					<td align="center">
						新建题目
					</td>
				</tr>
				<tr>
					<td align="left">
						<button type="button" class="btn" class="btn" onclick="submit();"> 保     存 </button>
						<button type="button" class="btn" class="btn" onclick="back();"> 返     回 </button>
					</td>
				</tr>
			</tbody>
		</table>
		<form action="" name="myForm" method="post">
			<table width="500" border="0" align="center" cellpadding="2"  cellspacing="1" id="myTable" class="tab">
				<tr>
					<td width="60px">
						题目：
					</td>
					<td>
						<input type="text" name="content"  style="width:300px;"/>
					</td>
				</tr>
				<tr>
					<td valign="top">
						类型：
					</td>
					<td>
						<select name="qtype" onchange=getSelect() style="width:120px;">
							<option value="0" >
								单选
							</option>
							<option value="1">
								多选
							</option>
							<option value="2" >
								下拉框
							</option>
							<option value="3" selected>
								文本框
							</option>
						</select>
					</td>
					<td id="limtext" name="limtext">
					选择最大值
					</td>
				</tr>
				<tr>
					<td valign="top">
						<label>
							选项1：
						</label>
					</td>
					<td>
						<input type="text" name="txt1" id="txt1" style="width:260px;"/>
					</td>
					<td name="limtd_1" id="limtd_1">
					    <input type="text" name="lim1" id="lim1" onKeyUp="value=value.replace(/\D/g,'')"  style="width:50px;" value="0"/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" name="listCnt" id="listCnt" value="" />
						<input type="hidden" name="oid" value="<%=oid%>" />
					</td>
					<td id="td1">
						<input type="button" value="添加选项 " name="add" onClick="addTextBox(this.form,this.parentNode)" class="btn"/>
						<input type="button" value="删除选项 " onClick="removeTextBox(this.form)" class="btn"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>