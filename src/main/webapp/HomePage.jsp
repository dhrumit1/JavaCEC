<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProductDetails</title>
</head>
<body>
	<form action="">
		<h1 align="center">Product Details</h1>
		<table align="center" border="2">
			<tr>
				<td>ProductID</td>
				<td>ProductName</td>
				<td>ProductDescription</td>
				<td>ProductPrice</td>
				<td>Action</td>
			<tr>
			<% 
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/javacec", "root", "");
					Statement st = con.createStatement();
					String query = "select * from product";
					ResultSet rs = st.executeQuery(query);
					
					while(rs.next()){
						%>
						<tr>
							<td><%= rs.getInt(1) %></td>
							<td><%= rs.getString(2) %></td>
							<td><%= rs.getString(3) %></td>
							<td><%= rs.getString(4) %></td>
							<td><a href="update.jsp?id=<%= rs.getInt(1) %>">Update</a></td>
							<td><a href="ProductDelete?id=<%= rs.getInt(1) %>">Delete</a></td>
						</tr>
						<%
					}
				}
				catch(Exception e){
					e.printStackTrace();
				}
			%>
		</table>
		<p align="center">New Product Add?<a href="addProduct.html">ADD</a></p>
	</form>
</body>
</html>