<html>
<head>

</head>
<body> 
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%try{
String fname=request.getParameter("fname"); 
if (request.getParameter("fname")==null)
{%>
<script type="text/javascript" >
     alert( "Please Enter Some Data" );
window.open("index.html","_self");
</script>
<% }
else{}
session.putValue("fname",fname); 
String id;
String password=request.getParameter("pwd"); 
String lname=request.getParameter("lname"); 
String email=request.getParameter("email"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","toor"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select max(id) from user; "); 
if(rs.next()) 
{   id = rs.getString(1);
int i;
    //id = Integer.toString(Integer.parseInt(id.substring(1,id.length()))+01);
    i =st.executeUpdate("insert into user values('"+id+"','"+fname+"','"+lname+"','"+email+"','"+password+"');"); 
%>
<script type="text/javascript" >
    //alert( "!!!!!!!!!Success!!!!!!!!!!" );
window.open("success.html","_self");
</script>
<% 
}

else {%>
<script type="text/javascript" >
alert( "Incorrect Username Or PssWord" );
window.open("index.html","_self");

</script>
<% }}catch(Exception e)
{ out.println(e.getMessage());
}
%>
</body>
</html>