<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%><%noq="y" %>
<!--#include file="webadmin_inc.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��˾��ҵ��վϵͳ��̨</title>
</head>
<body>
<% 
historyurl=""
historyurl=session("usrsession")
if historyurl="" then historyurl="Right_Master.htm"



if request("action")="add" then'========================���================================
   dim new_title,new_type,new_state,new_context,new_author,new_addtime
   new_title=replace(trim(request.Form("title")),"'","")
   new_type=replace(trim(request.Form("type")),"'","")
   new_state=replace(trim(request.Form("state")),"'","")
   new_orders=replace(trim(request.Form("orders")),"'","")
   new_context=replace(trim(request.Form("content")),"'","")
   new_pic=replace(trim(request.Form("pic")),"'","")
   weburl=replace(trim(request.Form("weburl")),"'","")
   new_addtime=replace(trim(request.Form("addtime")),"'","")
   new_type=checkisint(new_type,0)
   new_state=checkisint(new_state,0)
   new_orders=checkisint(new_orders,100)
   if isdate(new_addtime)=false then readvar("ʱ���ʽ����ȷ��")
   new_sql="insert into web_intention (title,type,pic,context,orders,weburl,addtime,state) values('" & new_title & "'," & new_type & ",'" & new_pic & "','" & new_context & "'," & new_orders & ",'"&weburl&"','"&new_addtime&"',"&new_state&")"
   'response.Write new_sql
'   response.End()
   conn.execute(new_sql)
   call CloseConn()
   %>
<SCRIPT LANGUAGE="JScript">
var truthBeTold = window.confirm("��ӳɹ�!\n�Ƿ�������?");
if (truthBeTold) {
window.location = ("manageintention_add.asp");
}  else  window.location = ("<%=historyurl%>");
</SCRIPT>
   <%   
elseif request("action")="edit" then'========================�޸�================================
  
   new_title=replace(trim(request.Form("title")),"'","")
   new_type=replace(trim(request.Form("type")),"'","")
   new_state=replace(trim(request.Form("state")),"'","")
   new_orders=replace(trim(request.Form("orders")),"'","")
   new_context=replace(trim(request.Form("content")),"'","")
   new_pic=replace(trim(request.Form("pic")),"'","")
   weburl=replace(trim(request.Form("weburl")),"'","")
   new_addtime=replace(trim(request.Form("addtime")),"'","")
   new_type=checkisint(new_type,0)
   new_state=checkisint(new_state,0)
   new_orders=checkisint(new_orders,100)
   if isdate(new_addtime)=false then readvar("ʱ���ʽ����ȷ��")
  
   new_sql="update web_intention set title='"&new_title&"',type="&new_type&",orders="&new_orders&",context='"&new_context&"',pic='"&new_pic&"',weburl='"&weburl&"',state="&new_state&",addtime='"&new_addtime&"' where id="&cint(request("newsid"))
   conn.execute(new_sql)
   call CloseConn()
   response.write("<script>window.alert ('�޸ĳɹ�,����ȷ������!');window.location = ('"&historyurl&"');</script>")
elseif request("action")="del"  then'========================ɾ��================================
   conn.execute ("delete from web_intention where id in ("&Request("newsid")&")")
   response.write("<script>window.alert ('ɾ���ɹ�,����ȷ������!');window.location = ('"&historyurl&"');</script>") 
end if

 %>
</body>
</html>
