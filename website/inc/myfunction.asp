<%function CHTMLEncode(fString) 
fString = Replace(fString, CHR(13), "") 
fString = Replace(fString, CHR(10), "<BR> ") 
CHTMLEncode= fString 
end function 




'//////获取表单信息
function myrequest(str)
     myrequest=replace(trim(request(str)),"'","")
end function




'=========根据搜索条件,返回记录条数*========
'str为搜索条件
Function readrscount(str)
   countsql=str
   Set countsqloRs = Server.CreateObject( "ADODB.Recordset" )
   countsqloRs.open countsql,conn,1,1
   readrscount=countsqloRs.recordcount
   countsqloRs.close
   set countsqloRs=nothing 
   Exit Function
End Function


'==============读取数据库类别=====生成表单/菜单========
'list_class 为大类别ID ,list_id为当前小类ID
Function readlist(list_class,list_id,list_name)
    if list_class="" or isnumeric(list_class)=0 then list_class=0
	if list_id="" or isnumeric(list_id)=0 then list_id=0 
	if list_name="" then list_name="不限"
	Set listrs = conn.execute ("select * from web_class where class="&list_class&"  order by orders asc")
	response.write("<option value=0>"&list_name&"</option>")
    do while Not listrs.eof
	    listselected=""
	    if listrs("id")=list_id then  listselected="  selected=selected" 
	    response.write("<option value="&listrs("id")&listselected&">"&listrs("title")&"</option>")
	listrs.movenext
	loop
       listrs.close
       set listrs=nothing
End Function

'==============带跳转===读取数据库类别=====生成表单/菜单========
'list_class 为大类别ID ,list_id为当前小类ID
Function readlist_go(list_class,list_id)
    if list_class="" or isnumeric(list_class)=0 then list_class=0
	if list_id="" or isnumeric(list_id)=0 then list_id=0 
	if list_name="" then list_name="不限"
	Set listrs = conn.execute ("select * from web_class where class="&list_class&"  order by orders asc")
	'response.write("<option value=0>"&list_name&"</option>")
    do while Not listrs.eof
	    listselected=""
	    if listrs("id")=list_id then  listselected="  selected=selected" 
	    response.write("<option value=?id="&request("id")&"&language="&listrs("id")&listselected&" target=main>"&listrs("title")&"</option>")
	listrs.movenext
	loop
	listrs.close
	set listrs=nothing
End Function
'==============以行形式读取数据库类别=============
'list_class 为大类别ID ,list_id为当前小类ID
Function readlist_row(list_class,list_id)
    if list_class="" or isnumeric(list_class)=0 then list_class=0
	if list_id="" or isnumeric(list_id)=0 then list_id=0 
	Set listrs = conn.execute ("select * from web_class where class="&list_class&"  order by orders asc")
	if list_id=0 then  list2008=" class=check" 
	response.write("&nbsp;<a href=?"&list2008&">所有</a>&nbsp;|")
    do while Not listrs.eof
	    listselected=""
	    if listrs("id")=list_id then  listselected=" class=check" 
	    response.write("&nbsp;<a href=?type="&listrs("id")&listselected&">"&listrs("title")&"</a>&nbsp;|")
	listrs.movenext
	
	loop
	listrs.close
	set listrs=nothing
End Function


'==============通过ID号来获取类别名称=======
'ID为当前小类ID,返回相应类别名称
Function readlist_name(id,str)
    if id="" or isnumeric(id)=0 then id=0
	if id=0 then 
	   readlist_name="不限"
	   if str<>"" then readlist_name=str
	else
	    Set readlist_namers = Server.CreateObject( "ADODB.Recordset" )
		readlist_namers.open "select top 1 title from web_class where id="&id,conn,1,1
		if readlist_namers.eof and readlist_namers.bof then
		    readlist_name="暂无"
		else
		    readlist_name=readlist_namers("title")
		end if
		readlist_namers.close
		set readlist_namers=nothing
	end if
End Function



Function checkisint(num,numint)  '判断是否为数字型或空值
  if num<>"" and isNumeric(num)=0 then  readvar("操作失败！！")
  if numint="" or isNumeric(numint)=0 then  numint=2008
  if num="" or isNumeric(num)=0 then  
     checkisint=cint(numint)
  else
     checkisint=cint(num)
  end if
  
End Function


'==================弹出变量值==========做错误查检测试用========
sub readvar(str)  '判断是否为数字型或空值
  response.Write "<script>alert('"&str&"');history.back();</script>"
  response.end()
End sub

'==================利用正规表达式写替换函数==================
Function ReplaceExp(pann,srcstr,replStr) 
Set regEx = New RegExp 
'regEx.Pattern = "[^\u0391-\uFFE5]*"
regEx.Pattern = pann
regEx.IgnoreCase = True 
regEx.Global = True 
regEx.Execute(srcstr) 
ReplaceExp = regEx.Replace(srcstr, replStr) 
Set regEx = Nothing 
End Function 


' ********************************************
' 以下为常用函数
' ********************************************
' ============================================
' 错误返回处理
' ============================================
Sub Go_Error(str)
	
	Response.Write "<script language=javascript>alert('" & str & "\n\n系统将自动返回前一页面...');history.back();</script>"
	Response.End
End Sub
Function mycodetoHTML(fString)

	fString = replace(fString,"&lt;","<") 
	fString = replace(fString,"&gt;",">") 
	fString = Replace(fString, "&nbsp;", chr(32)) 
	fString = Replace(fString, "&amp;", "&") 


    mycodetoHTML=fString   
End Function

' ============================================
'标题截取，1个中文站2个字符，codez by Simpwind,foosun
' ============================================
	Function GotTopic(Str,StrLen)
'		Dim l,t,c, i,LableStr,regEx,Match,Matches
'		If StrLen=0 then
'			GotTopic=""
'			exit function
'		End If
'		if IsNull(Str) then
'			GotTopic = ""
'			Exit Function
'		end if
'		if Str = "" then
'			GotTopic=""
'			Exit Function
'		end If
'		Str=Replace(Replace(Replace(Replace(Str,"&nbsp;"," "),"&quot;",Chr(34)),"&gt;",">"),"&lt;","<")
'		l=len(str)
'		t=0
'		strlen=Clng(strLen)
'		for i=1 to l
'			c=Abs(Asc(Mid(str,i,1)))
'			if c>255 then
'				t=t+2
'			else
'				t=t+1
'			end if
'			if t>=strlen then
'				GotTopic=left(str,i)
'				exit for
'			else
'				GotTopic=str
'			end if
'		Next
		'GotTopic = Replace(Replace(GotTopic," ","&nbsp;"),Chr(34),"&quot;")
		GotTopic = left(str,StrLen)
	End Function



' ============================================
' 格式化时间(显示)
' 参数：n_Flag
'	1:"yyyy-mm-dd hh:mm:ss"
'	2:"yyyy-mm-dd"
'	3:"hh:mm:ss"
'	4:"yyyy年mm月dd日"
'	5:"yyyymmdd"
' ============================================
Function Format_Time(s_Time, n_Flag)
	Dim y, m, d, h, mi, s
	Format_Time = ""
	If IsDate(s_Time) = False Then Exit Function
	y = cstr(year(s_Time))
	m = cstr(month(s_Time))
	If len(m) = 1 Then m = "0" & m
	d = cstr(day(s_Time))
	If len(d) = 1 Then d = "0" & d
	h = cstr(hour(s_Time))
	If len(h) = 1 Then h = "0" & h
	mi = cstr(minute(s_Time))
	If len(mi) = 1 Then mi = "0" & mi
	s = cstr(second(s_Time))
	If len(s) = 1 Then s = "0" & s
	Select Case n_Flag
	Case 1
		' yyyy-mm-dd hh:mm:ss
		Format_Time = y & "-" & m & "-" & d & " " & h & ":" & mi & ":" & s
	Case 9
		' mm-dd hh:mm
		Format_Time =  m & "-" & d & " " & h & ":" & mi 
	Case 2
		' yyyy-mm-dd
		Format_Time = y & "-" & m & "-" & d
   Case 6
		' yyyy-mm-dd
		Format_Time =  m & "/" & d&""
	Case 7
		' yyyy-mm-dd
		Format_Time = "["& y & "-"& m & "-" & d&"]"
	Case 3
		' hh:mm:ss
		Format_Time = h & ":" & mi & ":" & s
	Case 101
		' yyyy-mm-dd
		Format_Time =  "["&m & "-" & d&"]"
	Case 4
		' yyyy年mm月dd日
		Format_Time = y & "年" & m & "月" & d & "日"
	Case 5
		' yyyymmdd
		Format_Time = y & m & d
	End Select
End Function

' ============================================
' 把字符串进行HTML解码,替换server.htmlencode
' 去除Html格式，用于显示输出
' ============================================
Function HTMLtocode(str)
	Dim sTemp
	sTemp = str
	outHTML = ""
	If IsNull(sTemp) = True Then
		Exit Function
	End If
	sTemp = Replace(sTemp, "&", "&amp;")
	sTemp = Replace(sTemp, "<", "&lt;")
	sTemp = Replace(sTemp, ">", "&gt;")
	sTemp = Replace(sTemp, Chr(34), "&quot;")
	sTemp = Replace(sTemp, Chr(10), "<br>")
	outHTML = sTemp
End Function

' ============================================
' 去除Html格式，用于从数据库中取出值填入输入框时
' 注意：value="?"这边一定要用双引号
' ============================================
Function codetoHTML(str)
	codetoHTML=replace(replace(str,vbCrlf,"<br>"),"   ","&nbsp;")   
End Function

' ============================================
' 检测上页是否从本站提交
' 返回:True,False
' ============================================
Function IsSelfRefer()
	Dim sHttp_Referer, sServer_Name
	sHttp_Referer = CStr(Request.ServerVariables("HTTP_REFERER"))
	sServer_Name = CStr(Request.ServerVariables("SERVER_NAME"))
	If Mid(sHttp_Referer, 8, Len(sServer_Name)) = sServer_Name Then
		IsSelfRefer = True
	Else
		IsSelfRefer = False
	End If
End Function

' ============================================
' 得到安全字符串,在查询中使用
' ============================================
Function Get_SafeStr(str)
	Get_SafeStr = Replace(Replace(Replace(Trim(str), "'", ""), Chr(34), ""), ";", "")
End Function

' ============================================
' 取实际字符长度
' ============================================
Function Get_TrueLen(str)
	Dim l, t, c, i
	l = Len(str)
	t = l
	For i = 1 To l
		c = Asc(Mid(str, i, 1))
		If c < 0 Then c = c + 65536
		If c > 255 Then t = t + 1
	Next
	Get_TrueLen = t
End Function

' ============================================
' 判断是否安全字符串,在注册登录等特殊字段中使用
' ============================================
Function IsSafeStr(str)
	Dim s_BadStr, n, i
	s_BadStr = "' 　&<>?%,;:()`~!@#$^*{}[]|+-=" & Chr(34) & Chr(9) & Chr(32)
	n = Len(s_BadStr)
	IsSafeStr = True
	For i = 1 To n
		If Instr(str, Mid(s_BadStr, i, 1)) > 0 Then
			IsSafeStr = False
			Exit Function
		End If
	Next
End Function


'过滤跨站脚本和HTML标签,codez by foosun

Function NoHtmlHackInput(Str) 
	Dim regEx
	Set regEx = New RegExp
	regEx.IgnoreCase = True
	regEx.Pattern = "<|>|(script)|on(mouseover|mouseon|mouseout|click|dblclick|blur|focus|change)|eval|\t"
	If regEx.Test(LCase(Str)) Then
			Response.Write "<html><title>警告</title><body bgcolor=""EEEEEE"" leftmargin=""60"" topmargin=""30""><font style=""font-size:16px;font-weight:bolder;color:blue;""><li>您提交的数据有恶意字符</li></font><font style=""font-size:14px;font-weight:bolder;color:red;""><br><li>提交的内容不能包括[<|>|(script)|on(mouseover|mouseon|mouseout|click|dblclick|blur|focus|change)|eval]</li><li>您的数据已经被记录!</li><br><li>您的IP："&Request.ServerVariables("Remote_Addr")&"</li><br><li>操作日期："&Now&"</li></font></body></html>"
			Response.End
	End If
	Set regEx = Nothing
	NoHtmlHackInput = Str
End Function



'过滤安全字符
Function SafeRequest(ParaName,ParaType) 
'--- 传入参数 --- 
'ParaName:参数名称-字符型 
'ParaType:参数类型-数字型(1表示以上参数是数字，0表示以上参数为字符) 

Dim ParaValue 
ParaValue=Request(ParaName) 
If ParaType=1 then 
If not isNumeric(ParaValue) then 
Response.write "参数" & ParaName & "必须为数字型！<br /><br />" 
Response.end 
End if 
Else 
ParaValue=replace(ParaValue,"'","''") 
	ParaValue = Replace(ParaValue, "select", "sel&#101;ct")
	ParaValue = Replace(ParaValue, "join", "jo&#105;n")
	ParaValue = Replace(ParaValue, "union", "un&#105;on")
	ParaValue = Replace(ParaValue, "where", "wh&#101;re")
	ParaValue = Replace(ParaValue, "insert", "ins&#101;rt")
	ParaValue = Replace(ParaValue, "delete", "del&#101;te")
	ParaValue = Replace(ParaValue, "update", "up&#100;ate")
	ParaValue = Replace(ParaValue, "like", "lik&#101;")
	ParaValue = Replace(ParaValue, "drop", "dro&#112;")
	ParaValue = Replace(ParaValue, "create", "cr&#101;ate")
	ParaValue = Replace(ParaValue, "modify", "mod&#105;fy")
	ParaValue = Replace(ParaValue, "rename", "ren&#097;me")
	ParaValue = Replace(ParaValue, "alter", "alt&#101;r")
	ParaValue = Replace(ParaValue, "cast", "ca&#115;t")
	ParaValue = Replace(ParaValue, "and", "an&#100;")
	ParaValue = Replace(ParaValue, "or", "o&#114;")
End if 
SafeRequest=ParaValue 
End function

Function qq(q)  '检测有效QQ号
 qq = True
 if len(q) >9 or len(q) <5 then qq = false
 If not isNumeric(q) then qq = false
 if q="" then qq = True
End Function



Function IsValidEmail(Email) '检测是否有效的E-mail地址
	Dim names, name, i, c
	IsValidEmail = True
	Names = Split(email, "@")
	If UBound(names) <> 1 Then
   		IsValidEmail = False
   		Exit Function
	End If
	For Each name IN names
		If Len(name) <= 0 Then
     		IsValidEmail = False
     		Exit Function
   		End If
   		For i = 1 to Len(name)
     		c = Lcase(Mid(name, i, 1))
     		If InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 And Not IsNumeric(c) Then
       			IsValidEmail = false
       			Exit Function
     		End If
   		Next
   		If Left(name, 1) = "." or Right(name, 1) = "." Then
      		IsValidEmail = false
      		Exit Function
   		End If
	Next
	If InStr(names(1), ".") <= 0 Then
   		IsValidEmail = False
   		Exit Function
	End If
	i = Len(names(1)) - InStrRev(names(1), ".")
	If i <> 2 And i <> 3 Then
   		IsValidEmail = False
   		Exit Function
	End If
	If InStr(email, "..") > 0 Then
   		IsValidEmail = False
	End If
End Function

function read_left(str,zs)
  str=FilterBadHTML(str,"script,iframe,object,a","br,table,tr,td,TBODY,div,FONT,SPAN,p,STRONG,U,li","(<img(\s|\S)*?>)|(\s)|&nbsp;")
  strlen=len(str)
  strdd=""
  zs1=zs
  if strlen>zs then strdd="...":zs1=zs1-2
  read_left=left(str,zs1)&strdd
end function


function datetopic(str,p)
    strlen=len(str)
	datetopic=""
	for datetopici=1 to strlen
	   nowzm=Mid(str,datetopici,1)
	   if nowzm<>" " then  datetopic=datetopic&"<img src=images/date/"&p&"/"&nowzm&"g.gif border=0  align=absmiddle >"
	next
	'response.Write(datetopic)
end function



'==============================================================
'FilterBadHTML(strHTML,strTAGs,Single_tag,strword)====开始===
'strTAGs双标签里面内容,Single_tag保留签内容,strword屏蔽特殊字符
'==================================================	============	
Function FilterBadHTML(strHTML,strTAGs,Single_tag,strword)
Dim objRegExp,strOutput
Dim arrTAG,i
arrTAG=Split(strTAGs,",")
Set objRegExp = New Regexp
strOutput=strHTML
objRegExp.IgnoreCase = True
objRegExp.Global = True
if UBound(arrTAG)=-1 then FilterBadHTML = strOutput:exit function
For i=0 to UBound(arrTAG)
objRegExp.Pattern = "<"&arrTAG(i)&"[\s\S]+</"&arrTAG(i)&"[\s\S]*>"'屏蔽双标签里面内容
strOutput = objRegExp.Replace(strOutput, "")
Next

arrTAG=Split(Single_tag,",")
'response.write UBound(arrTAG):response.end
if UBound(arrTAG)=-1 then FilterBadHTML = strOutput:exit function
For i=0 to UBound(arrTAG)
objRegExp.Pattern = "<[/]*"&arrTAG(i)&"[\s\S]*?>"'保留签内容
strOutput = objRegExp.Replace(strOutput, "")
Next

if strword<>"" then objRegExp.Pattern = strword'屏蔽特殊字符
strOutput = objRegExp.Replace(strOutput, "")
Set objRegExp = Nothing
FilterBadHTML = strOutput
End Function




'///网站开发-多字段数据添加简化过程

sub oRs_save(str)
 formarry=split(str,",")
 for i=0 to ubound(formarry)
  oRs(formarry(i))=myrequest(formarry(i))
 next
end sub


'==============读取相应表中的相应字段信息值并返回========
'id为记录集ID,tableid为表的编号,fieldid为字段号, 如果没有找到就赋空值
Function readuserinf(id,nowtablename,fieldid)
   id=checkisint(id,0)
   fieldid=checkisint(fieldid,0)
   Set userinfoRs = Server.CreateObject( "ADODB.Recordset" )
   userinfsql="select * from ["&nowtablename&"] where id="&id
   if nowtablename="bigclass" then userinfsql="select * from ["&nowtablename&"] where bigid="&id
   if nowtablename="smallclass" then userinfsql="select * from ["&nowtablename&"] where smallid="&id


   userinfoRs.open userinfsql,conn,1,1
   if userinfoRs.eof and userinfoRs.bof then'---------------没有找到对对应的记录集-
      readuserinf="未知"
	  userinfoRs.close
      set userinfoRs=nothing 
	  Exit Function
   else  
      if userinfoRs.Fields.count<=fieldid then '---------------没有找到对应的表字段-
	     readuserinf="未知"
		 userinfoRs.close
         set userinfoRs=nothing 
	     Exit Function
	  end if
      readuserinf=userinfoRs(fieldid)
	  if readuserinf="" or isnull(readuserinf) then readuserinf=""
	  userinfoRs.close
      set userinfoRs=nothing 
	  Exit Function
   end if
End Function



'///////http://www.449cg.com 网站建设/网站改版/虚拟空间/域名注册 QQ374150234 
'///////屏蔽HRML代码，用于提取文章里的内容做简介输出
Function my_nohtml(strHTML)

 Dim objRegExp,strOutput
 Dim arrTAG,i

'/////屏蔽标签里面内容开始
 strTAGs="script,iframe,object"'/////屏蔽特殊标签里面内容,多个可用“，”分开
 arrTAG=Split(strTAGs,",")
 Set objRegExp = New Regexp
 strOutput=strHTML
 objRegExp.IgnoreCase = True
 objRegExp.Global = True
 if UBound(arrTAG)=-1 then FilterBadHTML = strOutput:exit function
 For i=0 to UBound(arrTAG)
  objRegExp.Pattern = "<"&arrTAG(i)&"[\s\S]+</"&arrTAG(i)&"[\s\S]*>"'屏蔽双标签里面内容
  strOutput = objRegExp.Replace(strOutput, "")
 Next
'/////屏蔽标签里面内容结束

'/////屏蔽HTML标签代码开始
 objRegExp.Pattern = "<[/]*[^<]*?>"'屏蔽HTML标签代码，保留里面内容
 strOutput = objRegExp.Replace(strOutput, "")
'/////屏蔽HTML标签代码结束

'/////屏蔽特殊字符开始
 strword="(\s)|&nbsp;"'/////屏蔽特殊字符,多个可用“|”分开
 if strword<>"" then objRegExp.Pattern = strword'屏蔽特殊字符
 strOutput = objRegExp.Replace(strOutput, "")
'/////屏蔽特殊字符结束

 Set objRegExp = Nothing
 my_nohtml = strOutput

End Function




%>
