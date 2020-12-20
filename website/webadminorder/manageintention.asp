
<meta http=equiv="content=type" content="text/html; charset=gb2312">
<% @language=vbscript codepage=936 %><%noq="y" %>
<!--#include file="webadmin_inc.asp"-->
<!--#include file="urlsession.asp"-->
<SCRIPT language=javascript>
function unselectall()
{
    if(document.del.chkAll.checked){
	document.del.chkAll.checked = document.del.chkAll.checked&0;
    } 	
}

function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
    }
  }
function ConfirmDel()
{
   if(confirm("确定要删除选中的信息吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;
	 
}
</SCRIPT>
<style>
.mycontext{ line-height:20px;}
.mycontext span{ color:#FF0000}
</style>
<%

dim so_keyword
so_keyword=replace(trim(request("so_keyword")),"'","")
stype=checkisint(request("type"),0)
%><!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top">
     <%

 if session("it139AdminName")<>"" and session("utype")=0 then%>
      <br><table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table_southidc">
        <form name="search" method="get" action="?type=<%=stype%>">
          <tr class="title"> 
          <td height="25" bgcolor="#DFEEFF">&nbsp;<b>搜索：</b>&nbsp;关键字:   
            <input name="so_keyword" type="text" class=smallInput id="so_keyword" value="<% If  so_keyword<>"" Then response.write(so_keyword)    end if%>" size="23" maxlength="50">
            <input type="hidden" name="action" id="action" value="so" />
            <input name="Query2" type="submit" id="Query2" value="查 询">          </td>
          </tr>
        </form>
      </table><% End If %>
      
      <table><tr><td height="1"></td></tr></table><form name="del" method="Post" action="manageintention_save.asp?action=del" onSubmit="return ConfirmDel();">  
          
        

       
      <table width="98%" border="0" cellpadding="3" cellspacing="1" class="table_southidc" style="word-break:break-all">
         
          <tr bgcolor="#A4B6D7" class="title"> 
            <td  height="25" align="center" bgcolor="#DFEEFF"><strong>选中</strong></td>
           <!-- <td height="25" align="center" bgcolor="#DFEEFF"><strong>ID</strong></td>-->
            <td width="81" align="center" bgcolor="#DFEEFF" ><strong>firstname</strong></td>
            <td width="81"  align="center" bgcolor="#DFEEFF" ><strong>lastname</strong></td>
            <td width="141"  align="center" bgcolor="#DFEEFF" ><strong>email</strong></td>
            <td width="145"  align="center" bgcolor="#DFEEFF" ><strong>phone</strong></td>
            <td width="141"  align="center" bgcolor="#DFEEFF" ><strong>Insurance</strong></td>
            <td width="215"  align="center" bgcolor="#DFEEFF" ><strong>Summary</strong></td>
            <td width="198"  align="center" bgcolor="#DFEEFF" ><strong>Item</strong></td>
            <td width="81"  align="center" bgcolor="#DFEEFF" ><strong>更新时间</strong></td>
            <td width="77" align="center" bgcolor="#DFEEFF"  ><strong>操作</strong></td>
          </tr>
<%
Sql=""
if request("action")="so" then
  Sql="Select * From web_intention where 1=1 "
  if request("so_keyword")<>"" then
    Sql=Sql&" and (td1 like '%"& trim(so_keyword)&"%' or td2 like '%"& trim(so_keyword)&"%' or td3  like '%"& trim(so_keyword)&"%' or td4  like '%"& trim(so_keyword)&"%' or td6  like '%"& trim(so_keyword)&"%')"
  end if
  'sql=sql&" and type="&stype
end if
if Sql="" then Sql="Select * From web_intention where 1=1 "
 ' sql=sql&" and type="&stype
  if session("utype")=1 then sql=sql&" and uid='"&session("tuid")&"'"
Sql=Sql&" order by id desc"



oRs.PageSize = 15
oRs.CursorLocation = 3
oRs.open Sql,conn,1,1
call page1()
for i=1 to oRs.PageSize
if oRs.Eof then exit for
pro=oRs("td2")
pro=replace(pro,"，",",")
pro=replace(pro,",","<BR>")
if oRs("td9")<>"" then pro="<span style=""color:#ff0000"">"&oRs("td9")&"</span><BR>"&pro
%>
          <tr class="tdbg" bgcolor="#ECF5FF" onMouseOver="mOvr(this,'#cae1fb');"  onMouseOut="mOut(this,'#ECF5FF');"> 
            <td width="63" height="22" align="center"> <input name='newsid' type='checkbox' onClick="unselectall()" id="newsid" value='<%=oRs("id")%>'>            </td>
            <!--<td width="40" align="center"><%=oRs("id")%></td>-->
           
            <td align="center"><%=oRs("td1")%></td>
            <td align="center"><%=oRs("td2")%></td>
            <td align="center"><%=oRs("td3")%></td>
            <td align="center"><%=oRs("td4")%></td>
            <td align="left" class="mycontext"><%=oRs("td8")%></td>
            <td align="left" class="mycontext"><%=oRs("td6")%></td>
            <td align="left"class="mycontext"><%=oRs("td5")%></td>
            <td  align="center"><%=Format_Time(oRs("addtime"),2)%></td>
            <td  align="center"><a href="manageintention_add.asp?id=<%=oRs("id")%>&action=edit"><!--查看--></a> <a href="manageintention_save.asp?action=del&newsid=<%=oRs("id")%>" onClick="return confirm('您确定要删除该信息吗？')">删除</a></td>
          </tr>
<%

oRs.movenext
next
%>
      </table>
      <table><tr><td height="1"></td></tr></table>
        <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table_southidc">
          <tr class="title">
            <td width="448" height="25" bgcolor="#DFEEFF" style="padding-left:13px;"><input name="chkAll" type="checkbox" id="chkAll" onClick=CheckAll(this.form) value="checkbox">
选中本页显示的所有信息
  <input name="submit" type='submit' value='删除选定的信息'  >
  <input name="Action" type="hidden" id="Action" value="Del"></td>
            <td width="736" align="left" bgcolor="#DFEEFF"><%Call  Page_nobg()%></td>
          </tr>
        </table>
        <br>
      </form>
      </td>
  </tr>
</table>
<% 
oRs.close
set oRs=nothing  
call CloseConn()
 %>

<!-- #include file="Inc/Foot.asp" --><script type="text/javascript"> 
function copyUrl2(texid) 
{ 
var Url2=document.getElementById(texid); 
Url2.select(); // 选择对象 
document.execCommand("Copy"); // 执行浏览器复制命令 
alert("已复制好，可贴粘。"); 
} 
</script> 


