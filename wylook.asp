<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/text.asp" -->
<%
Dim Recordset60
Dim Recordset60_cmd
Dim Recordset60_numRows
response.charset="utf-8" 
Set Recordset60_cmd = Server.CreateObject ("ADODB.Command")
Recordset60_cmd.ActiveConnection = MM_text_STRING
Recordset60_cmd.CommandText = "SELECT count(*) as numm FROM content WHERE [group] in(select [groupno] from [group] where target = 'webadmin')and lookornot = 'unlook'" 
Recordset60_cmd.Prepared = true

Set Recordset60 = Recordset60_cmd.Execute
Recordset60_numRows = 0
response.write "违约情况：总共"&Recordset60.Fields.Item("numm").Value&"条。"
Recordset60.Close()
Set Recordset60 = Nothing
%>
