<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoodsDetail</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src = "js/jquery.form.js"></script>
<script type="text/javascript">
	function goodsCartAdd(goodsNum){
		$.ajax({
			type : "post",
			url : "<c:url value = '/cart/goodsCartAdd'/>",
			dataType : "text",
			data : {"goodsNum" : goodsNum},
			success : function(result){
				if(result.trim() == "1"){
					if(confirm("wanna continue? 'no', check the cart? 'yes'")){
						location.href = "<c:url value = '/cart/goodsCartList'/>";
					}					
				}else{
					alert("failed to add cart\n plz try again");
					return;
				}
			},
			error : function(){
				alert("error alert");
				return;
			}
				
		});
	}
$(function(){
		$("#wishBtn").click(function(){
			$.ajax({
				type : "post",
				url : "../cart/wishListAdd",
				data : {"goodsNum" : ${list.goodsNum}},
				dataType : "text",
				success : function(result){
					if(result.trim() == "1"){
						alert("add to wishlist has been succeed");
						$("#wishBtn").attr("src", "../images/heart_full.png");
					}else{
						alert("selected goods has been removed from wishlist");
						$("#wishBtn").attr("src", "../images/heart.png");
					}
				},
				error:function(){
					alert("plz login again");
					location.href = "../main";
					return;
				}
			});
		});
	});
</script>
</head>
<body>
<table align="center" width="600">
	<tr bgcolor="lemonchiffon">
		<td colspan = "2" align="right">조회수 : ${list.readCount }
			&nbsp;&nbsp;&nbsp;
		관심상품<img src = "../images/heart.png" id = "wishBtn" width = "20" height = "20"/>
			&nbsp;&nbsp;&nbsp;
		<a href="javascript: goodsCartAdd(${list.goodsNum});">장바구니 담기</a>
		</td>
	</tr>
	<tr>
		<td valign = "top" width = "150">
			<c:forTokens items="${list.goodsImage}" delims="`" var = "i" begin = "0" end="0">
			<img src="../goodsView/upload/${i}" width = "150"/>
			</c:forTokens>
		</td>
		<td valign = "top">상품명 : ${list.goodsName }<br/>
			가격: ${list.goodsPrice } 
		</td>
	</tr>
	<tr>
	 	<td colspan = "2">상품 설명: ${fn:replace(list.goodsContent, cn, br) }<br/>
	 		<div align = "center">
			<c:forTokens items="${list.goodsImage}" delims="`" var = "i" begin = "1" end="10">
			<img src="../goodsView/upload/${i}"/><br/>
			</c:forTokens>
			</div>
	 	</td>
	</tr>
    <tr><td colspan="2" align="right">
    		<a href="goodsList.gd">목록보기</a> |
    		<a href="../cart/goodsDelete.gd?goodsNum=${list.goodsNum }">상품 삭제</a> |
    		<a href="goodsModify.gd?goodsNum=${list.goodsNum }">상품 수정</a>
    	</td>
    </tr>
</table>
</body>
</html>