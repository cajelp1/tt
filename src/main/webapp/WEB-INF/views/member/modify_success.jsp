<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
	location.href="detail.do?id=${param.id}";
	window.opener.location.href.reload(true);
</script>
