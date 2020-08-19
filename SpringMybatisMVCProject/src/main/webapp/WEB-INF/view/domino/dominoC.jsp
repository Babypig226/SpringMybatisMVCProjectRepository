<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file = "../include/include.jsp" %>

		<h2>Third Domino</h2>
		<select id = "csel" name = "cNum">
			<option value = "">==select==</option>
			<c:forEach items="${Clist}" var = "cDTO">
			<option value = "${cDTO.c1}">${cDTO.c2}</option>
			</c:forEach>
		</select>
