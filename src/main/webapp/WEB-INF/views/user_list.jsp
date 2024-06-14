<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User List</title>
</head>
<body>
	<h1>User List</h1>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Phone</th>
			<th>Name</th>
			<th>Email</th>
			<th>Address</th>
			<th>Grade</th>
			<th>Joined At</th>
		</tr>
		<c:forEach var="user" items="${userList}">
			<tr>
				<td>${user.user_id}</td>
				<td>${user.user_phone}</td>
				<td>${user.user_name}</td>
				<td>${user.user_email}</td>
				<td>${user.user_addr}</td>
				<td>${user.user_grade}</td>
				<td>${user.joined_at}</td>
			</tr>
		</c:forEach>
	</table>
	
	<a href="searchUser.do">Search User</a>

</body>
</html>