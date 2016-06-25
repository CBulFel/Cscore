<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<input type="number" name="text1" onkeyup="var v=this.value||'';
v=v.replace(/[^\d]/g,'');v=parseInt(v,10);
if(v<20){this.value=20;}
else if(v>50){this.value=50;}"  >

</body>
</html>