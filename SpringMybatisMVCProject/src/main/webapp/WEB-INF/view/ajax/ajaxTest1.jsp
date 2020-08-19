<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Test1</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src = "js/jquery.form.js"></script>
<script type="text/javascript">
	function testDivN(n){
		aaa = {	
				type: "post",
				url : "AjaxTest2",
				dataType : "html",
				data: "num="+n,
				success : function(result){
					$("#notice_content").html(result);
				},
				error : function(){
					alert('Error Alert');
					return;
				}
			}
		$.ajax(aaa);
	}
	function testDiv(n){
		//location.href="AjaxTest2?num="+n  동기식
				$.ajax({	//비동기식
					type: "post",
					url : "AjaxTest2",
					dataType : "html",
					data: "num="+n,
					success : function(result){
						$("#notice_content").html(result);
					},//json
					error : function(){
						alert('Error Alert');
						return;
					}
				});
	}
	$(function(){
			$("#btn3").click(function(){			
				$("#frm").ajaxSubmit({
					type : "post",
					url : "AjaxTest2",
					dataType : "html",
					beforeSubmit: function(){
						if($("#n").val()==""){
							alert("put some number between 1 to 3 dear");
							$("#n").focus();
							return false;
						}
					},
					data: "num="+$("#n").val(),
					success : function(result){
						$("#notice_content").html(result);
					},
					error : function(){
						alert('에러라네');
						return;
					}
				});
			});
			$("#btn4").click(function(){
				$("#frm").ajaxSubmit({
					type : "post",
					url : "AjaxTest2",
					dataType : "html",
					success : okTest,
					beforeSubmit : beforeTest, 
					error : ErrorTest 
				});
			});
			$("#btn5").click(function(){
				option = {
						type : "post",
						url : "AjaxTest2",
						dataType : "html",
						success : okTest,
						beforeSubmit : beforeTest, 
						error : ErrorTest 
				}
				$("#frm").ajaxSubmit(option);
			});
			
		});
function beforeTest(){
	if($("#n").val()==""){
		alert("put some number between 1 to 3 dear");
		$("#n").focus();
		return false;
	}else{
		alert("ajax's event before submit to server");
	}
}
function okTest(responseText, statusText, xhr, $form){ //success or fail, 사용한 form
	if(statusText == "success"){
		$("#notice_content").html(responseText);
		$form.css('background', 'lightgray');
	}
}
function ErrorTest(){
	alert('에러라네');
	return;
}
</script>
</head>
<body>
	<form action = "AjaxTest2" id = "frm">
		<input type = "text" id = "n" name = "num">	
	</form>
	<button id = "btn1" onclick="javascript:testDivN(1)">버튼1</button>
	<button id = "btn2" onclick="javascript:testDiv(1)">버튼2</button>
	<button id = "btn3">버튼3</button>
	<button id = "btn4">버튼4</button>
	<button id = "btn5">버튼5</button>
	<div id = "notice_content">
	<!-- span/div 상관없음. ajax로 B페이지 받을 구역 -->
	</div>
</body>
</html>