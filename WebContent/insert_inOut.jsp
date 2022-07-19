<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>입출고 정보 등록</title>
<script>
function ch(){
	var doc=document.form;
	doc.submit();
}
function check() {
	var doc=document.form;
	if(doc.inOutDate.value==""){
		alert("입출고일자가 입력되지 않았습니다.");
		doc.inOutDate.focus();
		return false;
	}if(doc.storeCode.value==""){
		alert("매장코드가 입력되지 않았습니다.");
		doc.storeCode.focus();
		return false;
	}if(doc.productCode.value==""){
		alert("상품코드가 입력되지 않았습니다.");
		doc.productCode.focus();
		return false;
	}else{
		form.action="insert_inOutProcess.jsp";
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<%
int saleQty1=0;
int total=0;
String inOutDate=request.getParameter("inOutDate");
if(inOutDate==null){
	inOutDate="";
}
String storeName=request.getParameter("storeName");
if(storeName==null){
	storeName="";
}
String saleQty=request.getParameter("saleQty");
if(saleQty==null){
	saleQty="0";
}else{
	saleQty1=Integer.parseInt(saleQty);
}

String productName="";
String productCode=request.getParameter("productCode");
if(productCode==null){
	productCode="";}
String storeCode=request.getParameter("storeCode");
if(storeCode==null){
	storeCode="";}
try{
	String sql="select p.productName,s.storeName from product0719 p, store0719 s where p.productCode=s.productCode and p.productCode=? and p.storeCode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productCode);
	pstmt.setString(2, storeCode);
	rs=pstmt.executeQuery();
	if(rs.next()){
		productName=rs.getString(1);
		storeName=rs.getString(2);
	}

}catch(Exception e){
	e.printStackTrace();
}

%>
<h2>입출고 정보 등록</h2>
<form name="form" method="post" action="insert_inOut.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">입출고일자</th>
		<td colspan="3">
			<input type="text" name="inOutDate" value="<%=inOutDate %>">
			</td>
</tr>
<tr>
<th class="th1">매장코드</th>
 <td> 
 	<input type="text" name="storeCode" value="<%=storeCode %>">
 	</td>
<th class="th1">매 장 명</th>
 <td> 
 	<input type="text" name="storeName" value="<%=storeName %>">
 	</td>
</tr>
<tr>
<th class="th1">상품코드</th>
 <td> 
 	<input type="text" name="productCode" value="<%=productCode %>" onchange="ch()">
 	</td>
<th class="th1">상 품 명</th>
 <td> 
 	<input type="text" name="productName" value="<%=productName%>">
 	</td>
</tr>
<tr>
	<th class="th1">입출고구분</th>
	 <td colspan="3">
	 	<input type="radio" name="gubun" value="1">입고
	 	<input type="radio" name="gubun" value="2">출고
	 	</td>
</tr>
<tr>
<th class="th1">입출고 수량</th>
 <td> 
 	<input type="text" name="saleQty" value="<%=saleQty1 %>">
 	</td>
<th class="th1">입출고 금엑</th>
 <td> 
 	<input type="text" name="total" value="<%=total %>">
 	</td>
</tr>

<tr>
	<td colspan="4" class="td1">
		<input type="submit" value="등록" onclick="check()" class="bt2">
		<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt2">
	</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>