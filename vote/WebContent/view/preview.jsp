<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.vote.service.*"%>
<%@page import="com.vote.bean.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
	//从请求当中获取到ID，根据ID查询出题目和内容
	String id = request.getParameter("oid");
	int oid = Integer.parseInt(id);
	ObjectBean ob = ObjectBeanService.findPublishedObjectBeanByID(oid);//查找发布后的问卷
	QuestionService qs = new QuestionService();
	SelecterService ss = new SelecterService();
	List quesList = qs.litQuesByOid(oid);//查找题目
	//List<String> txtArray= new ArrayList<String>();
	
//	List<String> textarry=new ArrayList<String>();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link type="text/css" rel="stylesheet" href="/vote/view/css/main.css" />
		<title>课堂评分统计系统</title>
<script type="text/javascript">
	   function btnOK_onclick (myForm){
		   myForm.action="./voteSuccess.jsp?oid="+<%=oid%>;
		   if(validCheck(myForm)) myForm.submit();
		   return false;
	   }
		
		//校验
		function validCheck(myForm)
		{
			var flag = 0;
			var i = 0;
    		var subCnt = document.getElementById("subCnt").value;
    		var subIndex = 0;
    		var index = 0;
    		
    		for (i=0;i<myForm.elements.length;i++)
    			{ 
    			if(myForm.elements[i].type=="textarea")
    				{
    				   if(myForm.elements[i].value=="")
    					   {
    					   alert("请填完评分表");
    					   return false;
    					   }
    				}
    			else if(myForm.elements[i].type=="text")
    				{
    				    if(myForm.elements[i].value=="")
    				    	{
    				    	alert("请填学号和姓名");
    				    	return false;
    				    	}
    				}
    			else if(myForm.elements[i].type=="radio")
    				{
    				var title1 = document.getElementById("title" + subIndex).innerHTML;
    				subIndex++;
    				var v = "";
    				var subs = document.getElementsByName("radio_" + subIndex);
    				var j = 0;
    				for (j = 0; j < subs.length; j++) {
    					if (subs[j].checked == true) {
    						v = subs[j].value;
    					}
    					i++;
    				}
    				if (subs.length > 0) {
    					i--;
    				}
    				if (v == "") {
    					alert("“" + title1 + "” 必须选择一个选项!");
    					return false;
    				} 
    				}
    			else if(myForm.elements[i].type=="select-one")
    				{
    				var title2 = document.getElementById("title" + subIndex).innerHTML;
    				subIndex++;
    				var v = myForm.elements[i].value;
    				if (v == "-1") {
    					alert("“" + title2 + "” 请选择下拉菜单的值！");
    					return false;
    				}
    				}
    			else if(myForm.elements[i].type="checkbox")
    				{
    				var title3 = document.getElementById("title" + subIndex).innerHTML;
    				subIndex++;
    				var v = "";
    				var chkName = document.getElementsByName("check_" + subIndex);
    				var c = 0;
    				for (c = 0; c < chkName.length; c++) {
    					if (chkName[c].checked == true) {
    						v = chkName[c].value;
    					}
    					i++;
    				}
    				if (chkName.length > 0) {
    					i--;
    				}
    				if (v == "") {
    					alert("“" + title3 + "” 复选框至少得选一个选项!");
    					return false;
    				}
    				}
    			}
	
	/*	for (i = 0; i < myForm.elements.length && subIndex < subCnt; i++) {
			var title = document.getElementById("title" + subIndex).innerHTML;
			subIndex++;
			//alert(myForm.elements.length)
			var element = myForm.elements[i];
			var eType = element.type;
			alert(myForm.elements[4].value+"-"+myForm.elements[4].type);
			//var eName = element.name;
			//var eValue = element.value;
			
			
			if (eType == "radio") {
				var v = "";
				var subs = document.getElementsByName("radio_" + subIndex);
				var j = 0;
				for (j = 0; j < subs.length; j++) {
					if (subs[j].checked == true) {
						v = subs[j].value;
					}
					i++;
				}
				if (subs.length > 0) {
					i--;
				}
				if (v == "") {
					alert("“" + title + "” 必须选择一个选项!");
					return false;
				}
			} else if (eType == "select-one") {


			} else if (eType == "checkbox") {
				var v = "";
				var chkName = document.getElementsByName("check_" + subIndex);
				var c = 0;
				for (c = 0; c < chkName.length; c++) {
					if (chkName[c].checked == true) {
						v = chkName[c].value;
					}
					i++;
				}
				if (chkName.length > 0) {
					i--;
				}
				if (v == "") {
					alert("“" + title + "” 复选框至少得选一个选项!");
					return false;
				}
			}else if(eType == "textarea")
			{
				alert("textarea"+i);
					
			}else if (eType == "text")
			{
				alert("eType==text");
				var x="studentid_0";
				var value=document.getElementById(x).value;
				if(value.length==0)
					{
					alert("请填写学号");
					return false;
					}
			}
		}*/
		return true;
	}

	function btnRest_onclick() {
		document.myForm.reset();
	}

	function btnBack_onclick() {
		document.forms[0].action = "./wjList.jsp";
		document.forms[0].submit();
	}
	//限制文本框输入
function judge(lim,Qseq,Selseq) {
		var x="txt_"+Qseq+"_"+Selseq;
		var value=document.getElementById(x).value;
		if(value>lim)
			{
			document.getElementById(x).value="";
			alert("超出范围：（" + lim + "）");
			}
		
}
function check(){
	var x="studentid_0";
	var value=document.getElementById(x).value;
	var y="studentname_0";
	var value1=document.getElementById(y).value;
	if(value.length==0||value1.length==0)
		{
		document.getElementById("studentinfo").innerHTML="请填写学号和姓名！";
		}
	else
		document.getElementById("studentinfo").innerHTML="";
	}
	
</script> 
	</head>
	<body>
		<table width="808" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top">
					<table width="106%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="35" rowspan="2" valign="top"></td>
							<td>
								<br />
								<table class="table1">
									<tr>
										<td height="20"></td>
									</tr>
									<tr>
										<td colspan="2">
											<div align="center">
												<strong><%=ob.getTitle()%></strong>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tr>
													<td>
														<%=ob.getDiscribe().replaceAll("\\n","<br/>")%>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr><td height="10">
									</td>
									</tr>
									<tr>
										<td colspan="5">
											<form method="post" action="" name="myForm">
                                                                                                                              
												<table class="table2">
													<%
														int subCnt = 0;
														if (quesList != null && quesList.size() > 0) {
															for (int i = 0; i < quesList.size(); i++) {
																Question ques = (Question) quesList.get(i);
																int qtype = ques.getQtype();
																int seq = ques.getSeq();
																subCnt++;
													%>
													<tr>
														<td bgcolor="#CDE2FD" colspan=4>
														<span id="title<%=i%>" ><span id="title<%=i%>" ><%=seq%></span>.<%=ques.getContent()%></span>
															<br/>													  </td>
													</tr>
													<tr>
														<%
																	List selList = ss.listSelecterBySeq(seq, oid);
																	if (qtype == 0) {
														%>
														<td>
															<table>
																	<%
																				for (int j = 0; j < selList.size(); j++) {
																				Selecter sel = (Selecter) selList.get(j);
																				String radioName = "radio_" + sel.getQseq();
																	%>
																	<tr>
																	<td width="25%" valign="top">
																		<input type="radio" id="<%=radioName%>" name="<%=radioName%>" value="<%=sel.getSelseq()%>" />
																		<%=sel.getContent()%>																	</td>
																	<%
																	if (j == 3) {
																	%>
																</tr>
																<tr>
																	<%
																			}
																			}
																	%>
																</tr>
															</table>														</td>
														<%
														} else if (qtype == 1) {
														%>
													<tr>
														<td>
															<table>
																	<%
																				for (int j = 0; j < selList.size(); j++) {
																				Selecter sel = (Selecter) selList.get(j);
																				String cbxName = "check_" + sel.getQseq();
																	%>
																    <tr>
																	<td width="25%"
																		style="word-break:break-all;" valign="top">
																		<input type="checkbox" name="<%=cbxName%>"
																			value="<%=sel.getSelseq()%>" />
																		<%=sel.getContent()%>
																		<br/>																	</td>
																	<%
																	if (j == 3) {
																	%>
																</tr>
																<tr>
																	<%
																			}
																			}
																	%>
																</tr>
															</table>														</td>
														<%
																} else if (qtype == 2) {
																String selectname = "select_" + ques.getSeq();
														%>
														<td colspan=4>
															<select name="<%=selectname%>">
																<option value="-1">
																	请选择																</option>
																<%
																			for (int j = 0; j < selList.size(); j++) {
																			Selecter sel = (Selecter) selList.get(j);
																%>
																<option value="<%=sel.getSelseq()%>">
																	<%=sel.getContent()%>																</option>
																<%
																}
																%>
															</select>														</td>
														<%
																} else if (qtype == 3) {
																for (int j = 0; j < selList.size(); j++) {		
																Selecter sel = (Selecter) selList.get(j);
																String txtname = "txt_" + sel.getQseq();
																String txtId = "txt_" + sel.getQseq()+"_" + sel.getSelseq();
																String textValue = "";
																//textarry.add(txtname);
																int lim=sel.getlim();
																textValue = sel.getContent();
																subCnt++;
														%>
														<td colspan=4>
														    <%=textValue %>
														    <br/>
															<textarea id=<%= txtId %> name="<%=txtname%>" rows="3" style="width:100%" onkeyup="if(isNaN(value))execCommand('undo')" value="<%=sel.getSelseq()+1%>"  onblur="judge(<%=lim%>,<%=sel.getQseq()%>,<%= sel.getSelseq() %>)"></textarea>														</td><%}%>
														<%
																}
																}
															}
														%>
													</tr>
													<br /><br />
													<tr>
									<td>
									请输入学号：<input type="text" id="studentid_0" name="studentid_0" onblur="check()" onkeyup="value=value.replace(/\D/g,'')"/>
									请输入姓名：<input type="text" id="studentname_0" name="studentname_0" onblur="check()"/>
									<p id="studentinfo" name="studentinfo" > </p>
									</td>
									</tr>
												</table>
											</form>
										</td>
									</tr>
									<tr>
										<td height="5">

										</td>
									</tr>
									<tr>
										<td height="5">
										</td>
									</tr>
									<tr>
										<td class="m_right">
											<br />
											<input type="button" name="btnOK" value="   提  交   " 
											onclick="btnOK_onclick(myForm);" />
											&nbsp;
											<input type="button" name="btnRedo" value="   重  填   " 
											onclick="btnRest_onclick();" />
											&nbsp;
											<input type="button" name="btnRedo" value="   返 回   "
												onclick="btnBack_onclick();" />
											<br />
										</td>
									</tr>
									
								</table>
								<input type="hidden" name="subCnt" id="subCnt"
									value="<%=subCnt%>" />
							</td>
						</tr>
						<tr>
							<td height="20"></td>
						</tr>
					</table>
					<br />
				</td>
				<td width="23" rowspan="2">&nbsp;
					 
				</td>
			</tr>
		</table>
	</body>
</html>
