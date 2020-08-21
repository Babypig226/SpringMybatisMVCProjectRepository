<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsWishList</title>
</head>
<body>
	<table align="center" width="600" >
		<caption>관심상품목록</caption>
		<tr>
			<td align = "center">
				번호
			</td>
			<td align = "center">
				상품명
			</td>
			<td align = "center">
				이미지
			</td>
			<td align = "center">
				가격
			</td>
		</tr>

	<c:forEach items="${wishList }" var="goods">
	<tr>
		<td valign = "top" align = "center">
			${goods.goodsNum }				
		</td>
		<td valign = "top" align = "center">
			<a href="../gd/goodsDetail?goodsNum=${goods.goodsNum }" >${goods.goodsName}</a>
		</td>
		<td valign = "top" align = "center">
			<c:forTokens items="${goods.goodsImage } " var="goodsImage" delims="`" varStatus="ii">
				<c:if test="${ii.index == 0 }">
					<img src="../goodsView/upload/${goodsImage}" width="150" />
				</c:if>
			</c:forTokens>
		</td>
		<td valign = "top" align = "center">
			${goods.goodsPrice }
		</td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>