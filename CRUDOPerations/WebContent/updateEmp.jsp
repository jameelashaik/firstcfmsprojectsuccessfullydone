<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <!-- <link rel="stylesheet" href="form.css"> -->  
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateEmp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
  <%@ page import="in.apcfss.service.CRUDOPerations" %>
  <%@ page import="in.apcfss.dto.Employee" %>
 <%
 String sid=request.getParameter("id"); 
int id=Integer.parseInt(sid);
Employee e=CRUDOPerations.getEmployeeById(id); 
 System.out.println("checking getname:"+e.getName());
 System.out.println("using java code in jsp"); 
%>
	<form action="updateemp" method="post" align="center">
	<table align="center">
	<tr><td><h1>Edit employee details</h1><br></br></td></tr>
	<tr><td><input type='hidden' name='id' value='<%= e.getId()%>'></td></tr>
		<tr><td>Name:<input type="text" name="user" value='<%=e.getName() %>'
		pattern="[A-Za-z]{4,12}"
			title="name must be between 4 and 12 charecters length and contains only letters and numbers"
			required><br> <br></td></tr>
		<tr><td>dob:<input type="date"  value='<%=e.getDob() %>'
			name="dob" max="2000-12-31" min="1970-01-01"
			title="DOB should not be greater than 50 years of age with current date"
			required><br> <br></td></tr>
		<tr><td>Qualification:<select name="qualification"  id="qualification">
    <option  <%= (e.getQualification().equals("B.Tech")?"selected='selected'":"") %>>btech</option>
    <option  <%= (e.getQualification().equals("B.com")?"selected='selected'":"") %>>bcom</option>
     <option  <%= (e.getQualification().equals("bsc")?"selected='selected'":"") %>>bsc</option>
      <option  <%= (e.getQualification().equals("other")?"selected='selected'":"") %>>other</option>
      </select><br></br></td></tr>
			<tr><td>Gender:<%if(e.getGender().equalsIgnoreCase("male")) { %>
    <input type="radio" name="gender" value="male" checked/>Male 
    <input type="radio" name="gender" value="female"/>Female 
    <input type="radio" name="gender" value="other" />other
<% } else if(e.getGender().equalsIgnoreCase("female")) {%>
    <input type="radio" name="gender" value="male" />Male 
    <input type="radio" name="gender" value="female" checked/>Female 
    <input type="radio" name="gender" value="other" />other
 <% } else if(e.getGender().equalsIgnoreCase("other")) {%>   
     <input type="radio" name="gender" value="male" />Male 
    <input type="radio" name="gender" value="female" />Female 
    <input type="radio" name="gender" value="other" checked/>other
<% } %><br></br></td></tr>
		 <tr><td>Date of joining: <input
			type="date" min="1970-01-01" name="joiningdate"  value='<%=e.getDoj() %>'
			title="DOJ should not be less than 50 years of age with current date"
			required> <br><br></td></tr>
		<tr><td>Pancard :<input type="text" name="pancard"  value='<%=e.getPancard() %>'
			pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}" title="incorrect pan card number" required><br><br>	</td></tr>
					
	  	<tr><td>Salary :<input type="text" name="salary"  value='<%=e.getSalary() %>'
			pattern="[0-9]{1,20}" title="salary must be numeric" required><br><br></td></tr>
			<input type='hidden' name='dayspresent'  value='<%=e.getDayspresent() %>'></td></tr>
		<tr><td><input type="submit" value="submit"></td></tr>
		</table>
	</form>
  </body>
</html>
