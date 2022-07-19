<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp"%>
<%
String productCode=request.getParameter("productCode");
String productName=request.getParameter("productName");
String storeCode=request.getParameter("storeCode");
String stockQty =request.getParameter("stockQty");
String unitPrice=request.getParameter("unitPrice");
try{
	String sql="update product0719 set productName=?,storeCode=?,unitPrice=?,stockQty=? where productCode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(5, productCode);
	pstmt.setString(1, productName);
	pstmt.setString(2, storeCode);
	pstmt.setString(3, unitPrice);
	pstmt.setString(4, stockQty);
	pstmt.executeUpdate();
	%>
	<script>
	alert("상품 테이블 수정 성공");
	location.href="select_product.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정 실패");
}
%>
</body>
</html>