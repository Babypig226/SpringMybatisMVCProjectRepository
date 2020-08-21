<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<a href="<c:url value = '/cart/goodsCartList'/>" >장바구니 가기</a>
	<a href="<c:url value = '/cart/wishList'/>" >관심상품 가기</a>
</div>
<table width=50% cellpadding="0" cellspacing="0" align = "center">
 	<caption>상품리스트</caption>
	<tr align="center" valign="middle">
		<td colspan="4" align=right>
			<font size=2>상품 개수 : ${count }</font>
		</td>
	</tr>
	<tr><td>번호</td><td>이미지</td><td>상품명</td><td>가격</td></tr>
<c:forEach items="${list }" var="dto" varStatus="cnt">
	<tr><td  width=10% >
			<a href="goodsDetail?goodsNum=${dto.goodsNum }">
			${dto.goodsNum }</a>
		</td>
	    <td width = "20%">
		<c:forTokens items="${dto.goodsImage}" delims="`" var = "i" begin = "0" end = "0">			
	    <img width="50"	src="../goodsView/upload/${i}" />
		</c:forTokens>
	    </td>
	    <td  width=20%>${dto.goodsName }</td>
	    <td  width=10%>
	    <fmt:formatNumber value="${dto.goodsPrice }" 
	    					type="currency"/>
	    </td></tr>
</c:forEach>
<tr>
	<td align="center" colspan = "4">
<%@ include file="../include/includePage.jsp" %>
	</td>
</tr>
</table>
<div><a href="goodsForm" >상품등록</a></div>
</body>
</html>