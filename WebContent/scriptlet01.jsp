<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	Scanner sc = new Scanner(System.in);
	int i = Integer.parseInt(sc.nextLine());
	
	
	for(; i < 10; i ++){
		out.println("구구단 "+i+"단"+"<br>");
		for(int j = 1; j < 10; j++){
			
			out.println(i+" * "+j+" = "+i*j+"<br>");
			
		}
		out.println("<br>");
		out.println("<br>");
	}
%>
</body>
</html>







