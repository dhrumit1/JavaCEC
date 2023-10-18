<%@page import="ProductManagement.ProductDetails"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<h1 align="center">Cart Details</h1>
		<table align="center" border="2" style="background-color: yellow;">
			<tr>
				<td>ProductName</td>
				<td>ProductDescription</td>
				<td>ProductPrice</td>
				<td>ProductQuntity</td>
				<td>TotalPrice</td>
			<tr>
			<% 
				try{
					//HttpSession ses = request.getSession(false);
					ArrayList<ProductDetails> products = (ArrayList<ProductDetails>) session.getAttribute("products");
					
					for(ProductDetails product:products){
						int totalprice = product.getProductPrice() * product.getproductQuntity();
						int id = product.getProductID();
						%>
						<tr>
							<td><%= product.getProductName() %></td>
							<td><%= product.getProductDes() %></td>
							<td><%= product.getProductPrice() %></td>
							<td align="center">
								<a href="Quntity?id=<%= product.getProductID() %>&op=1" style="text-decoration:none;">+</a>
								<input type="text" value="<%= product.getproductQuntity() %>" style="width: 20px;">
								<a href="Quntity?id=<%= product.getProductID() %>&op=0" style="text-decoration:none;">-</a>
							</td>
							<td><%= totalprice %></td>
						</tr>
						<%
					}
				}
				catch(Exception e){
					e.printStackTrace();
				}
			%>
		</table>
		<a href="UserHomePage.jsp">Back to Cart</a>
		<br>
		<a href="ProductBill.jsp">Make Bill</a>
	</form>
</body>
</html>