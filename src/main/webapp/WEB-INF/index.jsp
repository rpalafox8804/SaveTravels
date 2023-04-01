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
	<div class="body">
		<div class="dashboard d-flex flex-column mx-auto">
			<h1 class="text-primary mx-auto">Save Travels</h1>
			<table class="table table-bordered border-dark table-striped p-3 col-10 mx-auto" style="width: 65rem;">
			    <thead class="thead-dark bg-warning text-dark">
			        <tr>
			            <th>Expense</th>
			            <th>Vendor</th>
			            <th>Amount</th>
			            <th>Actions</th>
			        </tr>
			    </thead>
			    <tbody>
			         <!-- loop over all the books to show the details as in the wireframe! -->
			         <c:forEach var="expense" items="${expenses}">
			         <tr>
			    		<td><a href="/expenses/delete/${expense.id}"><c:out value="${expense.expenseName}"/></a></td>
			    		<td><c:out value="${expense.vendor}"/></td>
			    		<td>$<c:out value="${expense.amount}"/></td>
			    		<td class="d-flex mx-auto justify-content-around"><a href="/expenses/edit/<c:out value="${expense.id}"/>">edit</a> 
			    		<form action="/expenses/delete/${expense.id}" method="POST">
			    		    <input type="hidden" name="_method" value="delete">
    						<input type="submit" value="Delete" class="bg-danger">
						</form></td>
			         </tr>
			    		
					</c:forEach>
			    </tbody>
			</table>
		</div>
		<div class="form d-flex flex-column mx-auto">
			<h1 class="text-primary p-3 mx-auto">Add an expense:</h1>
			
			<form:form action="/expenses" method="POST" modelAttribute="expense" class="p-3 mx-auto">
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
			    <input type="submit" value="Submit" class="bg-warning"/>
			</form:form>    
			
		</div>
	</div>
	
</body>
</html>