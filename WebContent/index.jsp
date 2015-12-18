<%@page import="com.sun.javafx.font.PGFont"%>
<%@page import="beans.Profit"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>原生态JAVA生成报表</title>
<style type="text/css">

table.hovertable{
font-family:verdana,arial,sans-serif;
font-size:13px;
color:#333333;
border-width:1px;
border-color:#999999;
border-collapse: collapse;
}

table.hovertable th{
background: #c3dde0;
border-width: 1px;
padding:8px;
border-style:solid;
border-color:#a9c6c9;
}

table.hovertable tr{
background-color: #d4e3e5;
}

table.hovertable td{
border-width:1px;
padding:8px;
border-style: solid;
border-color: #a9c6c9;
}
</style>
</head>

<body>
<form action="showReport" method="post">
<input type="submit" value="生成报表">
</form>
<table class="hovertable">
<tr>
   <th colspan="5">利润表</th>
</tr>
<tr>
   <th>序号</th>
   <th>商品名称</th>
   <th>卖出数量</th>
   <th>交易笔数</th>
   <th>盈利额</th>
   
</tr>
<%
List list;
if(session.getAttribute("PROFIT")!=null){
	list=(List)session.getAttribute("PROFIT");
	if(list.size()>0){
		int temp =0;
		int temp1 =0;
		int temp2 =0;
		int temp3 =0;
		Profit pf;
		
		for(int i=0;i<list.size();i++){
			pf=new Profit();
			pf=(Profit)list.get(i);
			
			temp1 +=pf.getTradingNum();
			temp2 += pf.getTimes();
			temp3 +=pf.getPorfit();
			%>
			
			<tr onmouseover="this.style.backgroundColor ='#FEFF65';"
			onmouseout="this.style.backgroundColor='#d4e3e5';">
			    <td><%= temp+=1 %></td>
			    <td><%= pf.getGoodsName() %></td>
			    <td><%= pf.getTradingNum() %></td>
			    <td><%= pf.getTimes() %></td>
			    <td><%= pf.getPorfit() %></td>
			</tr>
		<%
		}%>
				<tr onmouseover="this.style.backgroundColor ='#FEFF65';"
			onmouseout="this.style.backgroundColor='#d4e3e5';">
			    <td colspan="2">合计</td>
			    <td><%= temp1%></td>
			    <td><%= temp2 %></td>
			    <td><%= temp3 %></td>
			</tr>
		
		<%
	}
}
%>
</table>
</body>
</html>