<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/text.asp" -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>留言</title>
</head>

<body>
<%
Set Command1 = Server.CreateObject ("ADODB.Command")
Command1.ActiveConnection = MM_text_STRING
Command1.CommandType = 1
Command1.CommandTimeout = 0
Command1.Prepared = true


if request.form("radio")="ishide"then
hide = "hide"
else
hide = "real"
end if

if request.Form("webdeveloper") <> "" then

Command1.CommandText = "INSERT INTO content(title, content,[group]) select '"& request.Form("textfield") &"','"& request.Form("textbody") &"',max(groupno)+1 from [group]"
command1.execute
Command1.CommandText = "INSERT INTO [group](type,target,sno,[time],[groupno]) select '"& hide &"','webadmin','"& session("MM_Username") &"','"&date()& " "&time()&"',max(groupno)+1 from [group]"
command1.execute

end if

if request.Form("zzwdy") <> "" then
Command1.CommandText = "INSERT INTO content(title, content,[group]) select '"& request.Form("textfield") &"','"& request.Form("textbody") &"',max(groupno)+1 from [group]"
command1.execute
Command1.CommandText = "INSERT INTO [group](type,target,sno,[time],[groupno]) select '"& hide &"','zzw','"& session("MM_Username") &"','"&date()& " "&time()&"',max(groupno)+1 from [group]"
command1.execute

end if
if request.Form("zcydy") <> "" then
Command1.CommandText = "INSERT INTO content(title, content,[group]) select '"& request.Form("textfield") &"','"& request.Form("textbody") &"',max(groupno)+1 from [group]"
command1.execute
Command1.CommandText = "INSERT INTO [group](type,target,sno,[time],[groupno]) select '"& hide &"','zcy','"& session("MM_Username") &"','"&date()& " "&time()&"',max(groupno)+1 from [group]"
command1.execute
end if

%>
<script>
alert("留言成功")
window.history.back(-1);
</script>
<%response.End()%>
</body>
</html>