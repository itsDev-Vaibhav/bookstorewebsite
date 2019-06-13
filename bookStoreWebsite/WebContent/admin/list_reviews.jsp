<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Reviews</title>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2>Review Management</h2>
	</div>
	<div align="center">
		<h4 class="message"> ${message} </h4>
	</div>
	<div align="center">
		<table border="1" cellpadding="5">
			<tr>
				<th>Indexes</th>
				<th>Review ID</th>
				<th>Book</th>
				<th>Rating</th>
				<th>Headline</th>
				<th>Customer</th>
				<th>Review on</th>
				<th>Comment</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="reviews" items="${listAllreview}" varStatus="status">
				<tr>
					<td>${status.index}</td>
					<td>${reviews.reviewId}</td>
					<td>${reviews.book.title}</td>
					<td>${reviews.rating}</td>
					<td>${reviews.headline}</td>
					<td>${reviews.customer.firstName}</td>
					<td>${reviews.comment}</td>
					<td>${reviews.reviewTime}</td>
					<td><a href="edit_review?id=${reviews.reviewId}"> Edit</a> 
					<a href="javascript:void(0);" class="deleteLink" id="${reviews.reviewId}"> Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<jsp:directive.include file="footer.jsp" />
<script >
$(document).ready(function(){
	$(".deleteLink").each(function(){
			$(this).on("click", function(){
				id = $(this).attr("id");
				if(confirm('Are you sure you want to delete the Review with id '+id + '?')) {
					window.location = 'delete_review?id=' +id;
				}
			});
		});
	});

	</script>
</body>
</html>