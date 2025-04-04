<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); // "/jsp"
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <button>주소</button>
    <script>
 // addressAPIPopup.jsp createUser.jsp
	function address() {
		location.href="<%= contextPath %>/views/common/jins/createUser.jsp";
	}

</script>
</body>
</html>