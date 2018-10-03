<script language="JavaScript" type="text/javascript" src="/js/load.js"></script>
<meta http=equiv="content=type" content="text/html; charset=gb2312">
<% @language=vbscript codepage=936 %><%noq="y" %>
<!--#include file="webadmin_inc.asp"-->
<script language = "JavaScript">
function CheckForm()
{

  if (document.myform.title.value=="")
  {
    alert("请填写标题名称！");
	document.myform.title.focus();
	return false;
  }
   if (document.myform.pic.value=="")
  {
    alert("请上传图片！");
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
   response.write("<script>window.alert ('非法操作,单击确定返回!');window.history.go(-1);</script>") 
   response.end()
end if
oRs.Open "Select * From web_intention where id="&newsid, conn,3,3
if oRs.eof and oRs.bof then
   oRs.close
   set oRs=nothing  
   call CloseConn()
   response.write("<script>window.alert ('没有找到相关记录,单击确定返回!');window.history.go(-1);</script>") 
   response.end()
end if
typeq=oRs("type")
typeqname="产品咨询"
if typeq=1 then typeqname="供应商加入"
if typeq=2 then typeqname="分销商招募"
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
           <div  class="manage_title">在线预约查看</div>          </td>
        </tr>
        <tr>
          <td colspan="6" align="center" bgcolor="#ECF5FF" style=" padding:20px ;"><BR>
            
      <ul>

        <li class="formtext">姓名：</li>

        <li class="forminput"><%=ors("uname")%></li>

      </ul>

      <ul>

        <li class="formtext">性别：</li>

        <li class="forminput"><%=ors("sex")%></li>

      </ul>

      <ul>

        <li class="formtext">身份证号码：</li>

        <li class="forminput"><%=ors("td1")%></li>
      </ul>

      <ul>

        <li class="formtext">出生日期：</li>

        <li class="forminput"><%=ors("td2")%></li>
      </ul>

      <ul>

        <li class="formtext">所在学校：</li>

        <li class="forminput"><%=ors("td3")%></li>
      </ul>

      <ul>

        <li class="formtext">所在年级：</li>

        <li class="forminput">

       <%=ors("td4")%>

        </li>

      </ul>

<!--      <ul>

        <li class="formtext">报考校区：</li>

        <li class="forminput">

        <%=ors("td5")%>

        </li>

      </ul>
-->
      <ul>

        <li class="formtext">报考学制：</li>

        <li class="forminput">

       <%=ors("td6")%>
        </li>

      </ul>

      <ul>

        <li class="formtext">户籍所在地：</li>

        <li class="forminput"><%=ors("td7")%>
          市/区</li>

      </ul>

      <ul>

        <li class="formtext">家庭住址：</li>

        <li class="forminput"><%=ors("td8")%>
        </li>

      </ul>

      <ul>

        <li class="formtext">家长姓名：</li>

        <li class="forminput">

        <%=ors("td10")%> : <%=ors("td11")%>

        </li>

      </ul>

      <ul>

        <li class="formtext">手机号码：</li>

        <li class="forminput"><%=ors("td12")%></li>
      </ul>

      <ul>

        <li class="formtext">电子信箱：</li>

        <li class="forminput"><%=ors("email")%>
        </li>

      </ul>

      <ul>

        <li class="formtext">工作单位：</li>

        <li class="forminput"><%=ors("td14")%>
        </li>

      </ul>

      <ul>

        <li class="formtext">兴趣特长：</li>

        <li class="forminput"><%=ors("td15")%>
        </li>

      </ul>

      <ul>

        <li class="formtext">备注：</li>

        <li class="forminput"><%=ors("context")%>
        </li>

      </ul>

    

      <ul>

        <li class="formtext">&nbsp;</li>

        <li class="forminput"></li>
      </ul>

      <ul id="clear"></ul>
            <p><span style=" padding-left:60px; padding-top:5px;">
              <input name="Add" type="button"  id="Add" value=" 返 回 " onClick="history.go(-1)">
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