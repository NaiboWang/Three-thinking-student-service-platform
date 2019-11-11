<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
if session("MM_Admin") = false or  session("MM_Admin") = "" then
%>


<script>
alert("The information you have logged is overdue,please log in again")
</script>

<%
end if
%>