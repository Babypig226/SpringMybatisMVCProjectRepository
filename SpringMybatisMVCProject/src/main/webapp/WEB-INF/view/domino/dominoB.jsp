<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file = "../include/include.jsp" %>
 <script src = "http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src = "js/jquery.form.js"></script>
<script type="text/javascript">
$(function(){
	$("#bsel").change(function(){
		//location.href = "cDomino?num="+$("#bsel").val()+"&a1=1";
		$.ajax({
			type : "POST",
			url : "cDomino",
			data : {"a1":  $("#asel").val(), "num" : $("#bsel").val()},
			datatype: "html",
			success : function(data1){
				$("#cDTO").html(data1);
			}
		});
	});
});
</script>
		<h2>Second Domino</h2>
		<select id = "bsel" name = "bNum">
			<option value = "">==select==</option>
			<c:forEach items="${Blist}" var = "bDTO">
			<option value = "${bDTO.b1}">${bDTO.b2}</option>
			</c:forEach>
		</select>

