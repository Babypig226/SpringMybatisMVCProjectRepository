<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src = "js/jquery.form.js"></script>
<script type="text/javascript">
function checkQty(num, qty){
	if(qty > 1){
		location.href="goodsCartQtyDown?cartNum="+num;
	}else{
		return false;
	}
}
function goodsCartAdd(goodsNum){
	$.ajax({
		type : "post",
		url : "<c:url value = '/cart/goodsCartAdd'/>",
		dataType : "text",
		data : {"goodsNum" : goodsNum},
		success : function(){
					location.href = "<c:url value = '/cart/goodsCartList'/>";				
		},
		error : function(){
			alert("error alert");
			return;
		}
			
	});
}
</script>
</head>
<body>
<form action="goodsCartRemove" method="post" name="frm">
<table align="center" width="600" >
	<caption>${cartList[0].userId}님의 장바구니</caption>
	<tr align="center" bgcolor="#F2E0F7">
		<td>번호	</td>
		<td>상품이미지</td>
		<td>상품명</td>
		<td>가격</td>
		<td>수량</td>
		<td align="center">
		<input type="submit"  value="삭제" />
		</td>
	</tr>
<c:forEach items="${cartList }" var="dto" varStatus="cnt">
	<tr align="center" >
		<td>${cnt.count }</td>
		<td><img src = "../goodsView/upload/${dto.goodsImage }" 
					width="30"/>
		</td>
		<td>${dto.goodsName }</td>
		<td>
			<fmt:formatNumber value="${dto.goodsPrice }" 
										type="currency"/>
		</td>
		<td><a href="javascript:goodsCartAdd(${dto.goodsNum })"> + </a> 
		 ${dto.qty }
		<a href="javascript:checkQty('${dto.cartNum }','${dto.qty }');" > - </a></td>
		<td align="center">
		<input type="checkbox" name="delete" value="${dto.cartNum }" />
		</td>
	</tr>	
</c:forEach>
</table>
</form>
<table align="center" width="600" >
	<tr align="center" bgcolor="#F2E0F7">
		<td align="right" colspan="6">
		<font color ="gray" size="3">
			총 결제금액 :
			<fmt:formatNumber value="${sumTP}"
				type="currency"/></font>
		<font color ="black" size="3">원</font>
		</td>
	</tr>
	<tr>
		<td align = "right" colspan = "6">
			<a href="<c:url value = '/gd/goodsList'/>" >목록으로 가기</a>
		</td>
	</tr>
</table>
</body>
</html>