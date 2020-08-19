<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Domino</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src = "js/jquery.form.js"></script>
<script type="text/javascript">
$(function(){
	op = "<h2>Third Domino</h2>" +
		"<select> <option value>==select==</option></select>"
	$("#asel").change(function(){
		//location.href = "bDomino?num="+$("#asel").val();
		$.ajax({
			type : "POST",
			url : "bDomino",
			data : "num="+$("#asel").val(),
			datatype: "html",
			success : function(data1){
				$("#bDTO").html(data1);
				$("#cDTO").html(op);
				
			}
		});
	});
	
});
</script>
</head>
<body>
	<h2>First Domino</h2>
		<select id = "asel" name = "aNum">
			<option value = "">==select==</option>
			<c:forEach items = "${Alist}" var = "i">
			<option value = "${i.a1}">${i.a2}</option>
			</c:forEach>
		</select>
<div id = "bDTO">
	<h2>Second Domino</h2>
		<select id = "bsel" name = "bNum">
			<option value = "">==select==</option>
		</select>
</div>
<div id = "cDTO">
	<h2>Third Domino</h2>
		<select id = "csel" name = "cNum">
			<option value = "">==select==</option>
		</select>
</div>
</body>
</html>