<script language="JavaScript" type="text/javascript" src="/js/load.js"></script>
<meta http=equiv="content=type" content="text/html; charset=gb2312">
<% @language=vbscript codepage=936 %><%noq="y" %>
<!--#include file="webadmin_inc.asp"-->
<script language = "JavaScript">
function CheckForm()
{

  if (document.myform.title.value=="")
  {
    alert("����д�������ƣ�");
	document.myform.title.focus();
	return false;
  }
   if (document.myform.pic.value=="")
  {
    alert("���ϴ�ͼƬ��");
	document.myform.pic.focus();
	return false;
  }

    
}
</script>
<style type="text/css">
<!--
.STYLE1 {	font-size: 14px;
	font-weight: bold;
}
.STYLE3 {color: #FF0000}
.center_form { margin: 0px auto; }
.center_form ul { padding: 0px 0px;clear: both; }
.center_form li { float: left; padding: 5px 0px; margin: 0px; vertical-align: middle; line-height: 22px; }
.center_form .formtext { width: 225px; text-align: right; color: #666; }
.center_form .forminput { width: 400px; text-align: left; color: #666; }


-->
</style>
<!-- #include file="Inc/Head.asp" -->

<body >
<% 

newtype=checkisint(request("newtype"),0)

 %>

<% 

dim newsid
newsid=request.QueryString("id")
if newsid="" or isnumeric(newsid)=0 then 
   response.write("<script>window.alert ('�Ƿ�����,����ȷ������!');window.history.go(-1);</script>") 
   response.end()
end if
oRs.Open "Select * From web_intention where id="&newsid, conn,3,3
if oRs.eof and oRs.bof then
   oRs.close
   set oRs=nothing  
   call CloseConn()
   response.write("<script>window.alert ('û���ҵ���ؼ�¼,����ȷ������!');window.history.go(-1);</script>") 
   response.end()
end if
typeq=oRs("type")
typeqname="��Ʒ��ѯ"
if typeq=1 then typeqname="��Ӧ�̼���"
if typeq=2 then typeqname="��������ļ"
 %>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="100%" align="center" valign="top">
   <div class="center_form"> <form method="POST" name="myform"   action="manageintention_save.asp?action=edit" target="_self">
      <br>
      <br>
      <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table_southidc">
        <tr>
          <td class="back_southidc" height="28" colspan="6" align="right" bgcolor="#C0C0C0">
           <div  class="manage_title">����ԤԼ�鿴</div>          </td>
        </tr>
        <tr>
          <td colspan="6" align="center" bgcolor="#ECF5FF" style=" padding:20px ;"><BR>
            
      <ul>

        <li class="formtext">������</li>

        <li class="forminput"><%=ors("uname")%></li>

      </ul>

      <ul>

        <li class="formtext">�Ա�</li>

        <li class="forminput"><%=ors("sex")%></li>

      </ul>

      <ul>

        <li class="formtext">���֤���룺</li>

        <li class="forminput"><%=ors("td1")%></li>
      </ul>

      <ul>

        <li class="formtext">�������ڣ�</li>

        <li class="forminput"><%=ors("td2")%></li>
      </ul>

      <ul>

        <li class="formtext">����ѧУ��</li>

        <li class="forminput"><%=ors("td3")%></li>
      </ul>

      <ul>

        <li class="formtext">�����꼶��</li>

        <li class="forminput">

       <%=ors("td4")%>

        </li>

      </ul>

<!--      <ul>

        <li class="formtext">����У����</li>

        <li class="forminput">

        <%=ors("td5")%>

        </li>

      </ul>
-->
      <ul>

        <li class="formtext">����ѧ�ƣ�</li>

        <li class="forminput">

       <%=ors("td6")%>
        </li>

      </ul>

      <ul>

        <li class="formtext">�������ڵأ�</li>

        <li class="forminput"><%=ors("td7")%>
          ��/��</li>

      </ul>

      <ul>

        <li class="formtext">��ͥסַ��</li>

        <li class="forminput"><%=ors("td8")%>
        </li>

      </ul>

      <ul>

        <li class="formtext">�ҳ�������</li>

        <li class="forminput">

        <%=ors("td10")%> : <%=ors("td11")%>

        </li>

      </ul>

      <ul>

        <li class="formtext">�ֻ����룺</li>

        <li class="forminput"><%=ors("td12")%></li>
      </ul>

      <ul>

        <li class="formtext">�������䣺</li>

        <li class="forminput"><%=ors("email")%>
        </li>

      </ul>

      <ul>

        <li class="formtext">������λ��</li>

        <li class="forminput"><%=ors("td14")%>
        </li>

      </ul>

      <ul>

        <li class="formtext">��Ȥ�س���</li>

        <li class="forminput"><%=ors("td15")%>
        </li>

      </ul>

      <ul>

        <li class="formtext">��ע��</li>

        <li class="forminput"><%=ors("context")%>
        </li>

      </ul>

    

      <ul>

        <li class="formtext">&nbsp;</li>

        <li class="forminput"></li>
      </ul>

      <ul id="clear"></ul>
            <p><span style=" padding-left:60px; padding-top:5px;">
              <input name="Add" type="button"  id="Add" value=" �� �� " onClick="history.go(-1)">
            </span></p></td>
        </tr> 
      </table>
      <div align="center"><p>&nbsp; 
      </p>
      </div>
    </form></div></td>
  </tr>
</table>
<% 
oRs.close
set oRs=nothing  
call CloseConn()

%>
</body>
<!-- #include file="Inc/Foot.asp" -->