<%@language="vbscript" codepage="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信息保存</title>
</head><body>
<%
dim conn,db
dim connstr
db="webaccess/webaccess.mdb" '数据库文件位置
connstr="DBQ="+server.mappath(""&db&"")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
set conn=server.createobject("ADODB.CONNECTION")
if err then
err.clear
else
conn.open connstr
end if
sub CloseConn()
	'oRs.close
	set oRs=nothing
	conn.close
	set conn=nothing
	
end sub
Set oRs = Server.CreateObject( "ADODB.Recordset" )


td1=request("firstname")
td2=request("lastname")
td3=request("email")
td4=request("phone")

td5=request("serviceitem1")
td5=replace(td5,",","<Br>")
td5=td5&"<BR>Total Fees:<span>"&request("mFees")&"</span><BR>"
td5=td5&"Date:<span>"&request("serviceitem4")&"</span><BR>"



td6=""


'
'response.write td3
'response.End()


If DateDiff("s", session("time"), Now())<10 Then
response.write("<script>window.alert ('请隔10秒后再尝试!');window.location = ('index.htm');</script>")
    response.End
Else
    'session("time") = Now()
End If







sql="select * from [web_intention] "
   oRs.open sql,conn,3,3
   oRs.addnew

   oRs("type")=2
   oRs("td1")=td1
   oRs("td2")=td2
   oRs("td3")=td3
   oRs("td4")=td4
   oRs("td5")=td5
   oRs("td6")=td6





   oRs.update
   oRs.close




response.write("<script>;window.location = ('ok.htm');</script>")
response.End()
%>
<style>
.box{ max-width:760px; border:1px #CCCCCC solid; margin:20PX auto; display:none}
.title img{ max-width:100%}
.orderbox{ margin:30px; line-height:26px; font-size:16px;}
.go{ text-align:center}
</style>



</body>
</html>
