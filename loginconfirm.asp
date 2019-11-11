
<%

if session("MM_Username") = false or  session("MM_Username") = "" then
response.write(">The information you have logged is overdue,please log in again")
%>


<script>

alert("The information you have logged is overdue,please log in again")
</script>

<%
end if
%>