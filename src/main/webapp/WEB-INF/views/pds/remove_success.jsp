<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
	alert("게시글이 삭제됐습니다.");
	opener.parent.searchList_go(${pageMaker.cri.page}, "<%= request.getContextPath()%>/pds/list.do" );
	window.close();
</script>

