<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Save Travels</title>
</head>
<body class="p-5" >

	<div class="nav d-flex justify-content-around mx-auto col-6">
		<h1 class="text-primary">Expense Details</h1>
		<a href="/expenses">Go Back</a>
	</div>
	
	<div class="details">
		<table class="table mx-auto col-3 bg-warning" style="width: 30rem;">
			     <tbody>
			         <tr>
			    		<td>Expense Name: </td>
			    		<td>${expenses.expenseName}</td>
			    	</tr>
			    	<tr>
			    		<td>Description: </td>
			    		<td>${expenses.description}</td>

			    	</tr>
			    	<tr>
			    		<td>Vendor: </td>
			    		<td>${expenses.vendor}</td>
			    	</tr>
			    	<tr>
			    		<td>Expense Name: </td>
			    		<td>$<c:out value="${expenses.amount}"/></td>
			    	</tr>
			    </tbody>
			</table>
	</div>

</body>
</html>