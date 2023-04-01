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
<body>
	<div class="body d-flex flex-column mt-5 mb-5">
		<div class="dashboard d-flex mx-auto justify-content-around col-3">
			<h1 class="text-primary" >Edit Expense</h1>
			<a href="/expenses"> Go Back</a>
		</div>
		<div class="form d-flex flex-column mx-auto">
			<form:form action="/expenses/${expense.id}" method="PUT" modelAttribute="expense" class ="p-5 bg-warning">
			    <p>
			        <form:label path="expenseName">Expense Name: </form:label>
			        <form:errors path="expenseName" class="text-danger"/>
			        <form:input path="expenseName"/>
			    </p>
			    <p>
			        <form:label path="vendor">Vendor: </form:label>
			        <form:errors path="vendor" class="text-danger"/>
			        <form:input path="vendor"/>
			    </p>
			    <p>
			        <form:label path="amount">Amount: </form:label>
			        <form:errors path="amount" class="text-danger"/>
			        <form:input type="number" data-type="currency" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" path="amount" step="0.01"/>
			    </p>
			    <p>
			        <form:label path="description">Description: </form:label>
			        <form:errors path="description" class="text-danger"/>     
			        <form:textarea path="description"/>
			        
			    </p>    
			    <input type="submit" value="Submit" class="bg-primary"/>
			</form:form>    
			
		</div>
	</div>
	
</body>
</html>