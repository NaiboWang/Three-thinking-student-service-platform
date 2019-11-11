
		   function checkes()
		  {
	 ss=document.getElementById('semail').value;
         re= /\w@\w*\.\w/
		 if(re.test(ss))
         {
			
			document.getElementById('semailc').style.display="none";		  
			 }
        else
        {
        document.getElementById('semailc').style.display="";
					 document.getElementById('semailc').value = "邮箱格式错误！"
					
        }
		
		
				
			 
			 }
			 
		  
		  
		   function checktels()
		  {
	 ss=document.getElementById('stel').value;
         re= /^[0-1]\d{10}$/
		 if(re.test(ss))
         {
			 document.getElementById('stelc').style.display="none";
					  
			 }
        else
        {
			document.getElementById('stelc').style.display="";
					 document.getElementById('stelc').value = "联系电话格式错误！"
					
       
        }
		
		
				
			 
			 }
			 
		   function checkids()
		  {
	 ss=document.getElementById('sid').value;
         re= /^[0-9]\d{17}$/
		 if(re.test(ss))
         {
			 document.getElementById('sidc').style.display="none";
					  
			 }
        else
        {document.getElementById('sidc').style.display="";
					 document.getElementById('sidc').value = "身份证号格式错误！"
					
       
        }
		
		
				
			 
			 }
			 
			 
			 
		  function checkps()
		  {

				if(document.getElementById("pass").value.length <6 || document.getElementById("pass").value.length >16)
				{ 
				document.getElementById('passc').style.display="";
					 document.getElementById('passc').value = "密码长度应为6-16位！"
					 return false;
				}
					else
					document.getElementById('passc').style.display="none";
			  if(document.getElementById('passconfirm').value != ""){
			  if(document.getElementById('pass').value != document.getElementById('passconfirm').value)
			  {
				  document.getElementById('passc').style.display="";
				 document.getElementById('passc').value = "两次密码不匹配！"
				 }
				 else
				 {
					 document.getElementById('passc').style.display="none";
					 }
			  }
			 
			 }
		  function check()
		  {
		 	
			var ss=document.getElementById('username').value;
        var re= /^[A-Za-z]\w{5,15}$/
		
		if(re.test(ss))
         {}
        else
        {
        alert ("用户名应为字母打头的6-16位字符串");
  		return false;
        }
		
		
				if(document.getElementById("pass").value.length <6 || document.getElementById("pass").value.length >16)
				{
					 alert("密码长度应为6-16位！")
					 return false;
				}

			  if(document.getElementById('pass').value != document.getElementById('passconfirm').value)
			  {
				 alert("两次密码不匹配！")
				 return false;
				 }
				
				if(document.getElementById('sname').value == "")
			  {
				 alert("请输入真实姓名")
				 return false;
				 }
				 	if(document.getElementById('sdate').value == "")
			  {
				 alert("请输入出生日期")
				 return false;
				 }
				 
		
				 ss=document.getElementById('sid').value;
         re= /^[0-9]\d{17}$/
		 if(re.test(ss))
         {}
        else
        {
        alert ("请输入正确的身份证号！");
  		return false;
        }
				 
			  ss=document.getElementById('stel').value;
        re= /^[0-1]\d{10}$/
        if(re.test(ss))
         {}
        else
        {
        alert ("请输入正确的联系电话！");
  		return false;
        }
		if(document.getElementById('saddress').value == "")
			  {
				 alert("请输入通信地址")
				 return false;
				 }
       
		
           ss=document.getElementById("semail").value;
          re= /\w@\w*\.\w/
         if(re.test(ss))
         {}
         else
         {
           alert("请输入正确的邮箱格式")
         return false;
		 }
		 	
		 if(document.getElementById('sqq').value == "")
			  {
				 alert("请输入QQ")
				 return false;
				 }
       
		 
				  
		  }
		  	
	