<%function CHTMLEncode(fString) 
fString = Replace(fString, CHR(13), "") 
fString = Replace(fString, CHR(10), "<BR> ") 
CHTMLEncode= fString 
end function 




'//////��ȡ������Ϣ
function myrequest(str)
     myrequest=replace(trim(request(str)),"'","")
end function




'=========������������,���ؼ�¼����*========
'strΪ��������
Function readrscount(str)
   countsql=str
   Set countsqloRs = Server.CreateObject( "ADODB.Recordset" )
   countsqloRs.open countsql,conn,1,1
   readrscount=countsqloRs.recordcount
   countsqloRs.close
   set countsqloRs=nothing 
   Exit Function
End Function


'==============��ȡ���ݿ����=====���ɱ���/�˵�========
'list_class Ϊ�����ID ,list_idΪ��ǰС��ID
Function readlist(list_class,list_id,list_name)
    if list_class="" or isnumeric(list_class)=0 then list_class=0
	if list_id="" or isnumeric(list_id)=0 then list_id=0 
	if list_name="" then list_name="����"
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

'==============����ת===��ȡ���ݿ����=====���ɱ���/�˵�========
'list_class Ϊ�����ID ,list_idΪ��ǰС��ID
Function readlist_go(list_class,list_id)
    if list_class="" or isnumeric(list_class)=0 then list_class=0
	if list_id="" or isnumeric(list_id)=0 then list_id=0 
	if list_name="" then list_name="����"
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
'==============������ʽ��ȡ���ݿ����=============
'list_class Ϊ�����ID ,list_idΪ��ǰС��ID
Function readlist_row(list_class,list_id)
    if list_class="" or isnumeric(list_class)=0 then list_class=0
	if list_id="" or isnumeric(list_id)=0 then list_id=0 
	Set listrs = conn.execute ("select * from web_class where class="&list_class&"  order by orders asc")
	if list_id=0 then  list2008=" class=check" 
	response.write("&nbsp;<a href=?"&list2008&">����</a>&nbsp;|")
    do while Not listrs.eof
	    listselected=""
	    if listrs("id")=list_id then  listselected=" class=check" 
	    response.write("&nbsp;<a href=?type="&listrs("id")&listselected&">"&listrs("title")&"</a>&nbsp;|")
	listrs.movenext
	
	loop
	listrs.close
	set listrs=nothing
End Function


'==============ͨ��ID������ȡ�������=======
'IDΪ��ǰС��ID,������Ӧ�������
Function readlist_name(id,str)
    if id="" or isnumeric(id)=0 then id=0
	if id=0 then 
	   readlist_name="����"
	   if str<>"" then readlist_name=str
	else
	    Set readlist_namers = Server.CreateObject( "ADODB.Recordset" )
		readlist_namers.open "select top 1 title from web_class where id="&id,conn,1,1
		if readlist_namers.eof and readlist_namers.bof then
		    readlist_name="����"
		else
		    readlist_name=readlist_namers("title")
		end if
		readlist_namers.close
		set readlist_namers=nothing
	end if
End Function



Function checkisint(num,numint)  '�ж��Ƿ�Ϊ�����ͻ��ֵ
  if num<>"" and isNumeric(num)=0 then  readvar("����ʧ�ܣ���")
  if numint="" or isNumeric(numint)=0 then  numint=2008
  if num="" or isNumeric(num)=0 then  
     checkisint=cint(numint)
  else
     checkisint=cint(num)
  end if
  
End Function


'==================��������ֵ==========�������������========
sub readvar(str)  '�ж��Ƿ�Ϊ�����ͻ��ֵ
  response.Write "<script>alert('"&str&"');history.back();</script>"
  response.end()
End sub

'==================�����������ʽд�滻����==================
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
' ����Ϊ���ú���
' ********************************************
' ============================================
' ���󷵻ش���
' ============================================
Sub Go_Error(str)
	
	Response.Write "<script language=javascript>alert('" & str & "\n\nϵͳ���Զ�����ǰһҳ��...');history.back();</script>"
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
'�����ȡ��1������վ2���ַ���codez by Simpwind,foosun
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
' ��ʽ��ʱ��(��ʾ)
' ������n_Flag
'	1:"yyyy-mm-dd hh:mm:ss"
'	2:"yyyy-mm-dd"
'	3:"hh:mm:ss"
'	4:"yyyy��mm��dd��"
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
		' yyyy��mm��dd��
		Format_Time = y & "��" & m & "��" & d & "��"
	Case 5
		' yyyymmdd
		Format_Time = y & m & d
	End Select
End Function

' ============================================
' ���ַ�������HTML����,�滻server.htmlencode
' ȥ��Html��ʽ��������ʾ���
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
' ȥ��Html��ʽ�����ڴ����ݿ���ȡ��ֵ���������ʱ
' ע�⣺value="?"���һ��Ҫ��˫����
' ============================================
Function codetoHTML(str)
	codetoHTML=replace(replace(str,vbCrlf,"<br>"),"   ","&nbsp;")   
End Function

' ============================================
' �����ҳ�Ƿ�ӱ�վ�ύ
' ����:True,False
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
' �õ���ȫ�ַ���,�ڲ�ѯ��ʹ��
' ============================================
Function Get_SafeStr(str)
	Get_SafeStr = Replace(Replace(Replace(Trim(str), "'", ""), Chr(34), ""), ";", "")
End Function

' ============================================
' ȡʵ���ַ�����
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
' �ж��Ƿ�ȫ�ַ���,��ע���¼�������ֶ���ʹ��
' ============================================
Function IsSafeStr(str)
	Dim s_BadStr, n, i
	s_BadStr = "' ��&<>?%,;:()`~!@#$^*{}[]|+-=" & Chr(34) & Chr(9) & Chr(32)
	n = Len(s_BadStr)
	IsSafeStr = True
	For i = 1 To n
		If Instr(str, Mid(s_BadStr, i, 1)) > 0 Then
			IsSafeStr = False
			Exit Function
		End If
	Next
End Function


'���˿�վ�ű���HTML��ǩ,codez by foosun

Function NoHtmlHackInput(Str) 
	Dim regEx
	Set regEx = New RegExp
	regEx.IgnoreCase = True
	regEx.Pattern = "<|>|(script)|on(mouseover|mouseon|mouseout|click|dblclick|blur|focus|change)|eval|\t"
	If regEx.Test(LCase(Str)) Then
			Response.Write "<html><title>����</title><body bgcolor=""EEEEEE"" leftmargin=""60"" topmargin=""30""><font style=""font-size:16px;font-weight:bolder;color:blue;""><li>���ύ�������ж����ַ�</li></font><font style=""font-size:14px;font-weight:bolder;color:red;""><br><li>�ύ�����ݲ��ܰ���[<|>|(script)|on(mouseover|mouseon|mouseout|click|dblclick|blur|focus|change)|eval]</li><li>���������Ѿ�����¼!</li><br><li>����IP��"&Request.ServerVariables("Remote_Addr")&"</li><br><li>�������ڣ�"&Now&"</li></font></body></html>"
			Response.End
	End If
	Set regEx = Nothing
	NoHtmlHackInput = Str
End Function



'���˰�ȫ�ַ�
Function SafeRequest(ParaName,ParaType) 
'--- ������� --- 
'ParaName:��������-�ַ��� 
'ParaType:��������-������(1��ʾ���ϲ��������֣�0��ʾ���ϲ���Ϊ�ַ�) 

Dim ParaValue 
ParaValue=Request(ParaName) 
If ParaType=1 then 
If not isNumeric(ParaValue) then 
Response.write "����" & ParaName & "����Ϊ�����ͣ�<br /><br />" 
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

Function qq(q)  '�����ЧQQ��
 qq = True
 if len(q) >9 or len(q) <5 then qq = false
 If not isNumeric(q) then qq = false
 if q="" then qq = True
End Function



Function IsValidEmail(Email) '����Ƿ���Ч��E-mail��ַ
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
'FilterBadHTML(strHTML,strTAGs,Single_tag,strword)====��ʼ===
'strTAGs˫��ǩ��������,Single_tag����ǩ����,strword���������ַ�
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
objRegExp.Pattern = "<"&arrTAG(i)&"[\s\S]+</"&arrTAG(i)&"[\s\S]*>"'����˫��ǩ��������
strOutput = objRegExp.Replace(strOutput, "")
Next

arrTAG=Split(Single_tag,",")
'response.write UBound(arrTAG):response.end
if UBound(arrTAG)=-1 then FilterBadHTML = strOutput:exit function
For i=0 to UBound(arrTAG)
objRegExp.Pattern = "<[/]*"&arrTAG(i)&"[\s\S]*?>"'����ǩ����
strOutput = objRegExp.Replace(strOutput, "")
Next

if strword<>"" then objRegExp.Pattern = strword'���������ַ�
strOutput = objRegExp.Replace(strOutput, "")
Set objRegExp = Nothing
FilterBadHTML = strOutput
End Function




'///��վ����-���ֶ��������Ӽ򻯹���

sub oRs_save(str)
 formarry=split(str,",")
 for i=0 to ubound(formarry)
  oRs(formarry(i))=myrequest(formarry(i))
 next
end sub


'==============��ȡ��Ӧ���е���Ӧ�ֶ���Ϣֵ������========
'idΪ��¼��ID,tableidΪ���ı��,fieldidΪ�ֶκ�, ���û���ҵ��͸���ֵ
Function readuserinf(id,nowtablename,fieldid)
   id=checkisint(id,0)
   fieldid=checkisint(fieldid,0)
   Set userinfoRs = Server.CreateObject( "ADODB.Recordset" )
   userinfsql="select * from ["&nowtablename&"] where id="&id
   if nowtablename="bigclass" then userinfsql="select * from ["&nowtablename&"] where bigid="&id
   if nowtablename="smallclass" then userinfsql="select * from ["&nowtablename&"] where smallid="&id


   userinfoRs.open userinfsql,conn,1,1
   if userinfoRs.eof and userinfoRs.bof then'---------------û���ҵ��Զ�Ӧ�ļ�¼��-
      readuserinf="δ֪"
	  userinfoRs.close
      set userinfoRs=nothing 
	  Exit Function
   else  
      if userinfoRs.Fields.count<=fieldid then '---------------û���ҵ���Ӧ�ı��ֶ�-
	     readuserinf="δ֪"
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



'///////http://www.449cg.com ��վ����/��վ�İ�/����ռ�/����ע�� QQ374150234 
'///////����HRML���룬������ȡ�������������������
Function my_nohtml(strHTML)

 Dim objRegExp,strOutput
 Dim arrTAG,i

'/////���α�ǩ�������ݿ�ʼ
 strTAGs="script,iframe,object"'/////���������ǩ��������,������á������ֿ�
 arrTAG=Split(strTAGs,",")
 Set objRegExp = New Regexp
 strOutput=strHTML
 objRegExp.IgnoreCase = True
 objRegExp.Global = True
 if UBound(arrTAG)=-1 then FilterBadHTML = strOutput:exit function
 For i=0 to UBound(arrTAG)
  objRegExp.Pattern = "<"&arrTAG(i)&"[\s\S]+</"&arrTAG(i)&"[\s\S]*>"'����˫��ǩ��������
  strOutput = objRegExp.Replace(strOutput, "")
 Next
'/////���α�ǩ�������ݽ���

'/////����HTML��ǩ���뿪ʼ
 objRegExp.Pattern = "<[/]*[^<]*?>"'����HTML��ǩ���룬������������
 strOutput = objRegExp.Replace(strOutput, "")
'/////����HTML��ǩ�������

'/////���������ַ���ʼ
 strword="(\s)|&nbsp;"'/////���������ַ�,������á�|���ֿ�
 if strword<>"" then objRegExp.Pattern = strword'���������ַ�
 strOutput = objRegExp.Replace(strOutput, "")
'/////���������ַ�����

 Set objRegExp = Nothing
 my_nohtml = strOutput

End Function




%>