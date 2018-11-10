<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Add Book</title>
</head>
<body>
	<div class="container">
	
		<div class="page-header"> <!-- creates space at top of page -->
		 	<h1></h1>      
		</div>
		
		
		<div class="col-md-1"></div>
		
		<div class="col-md-5 well">
		
			<!-- Add Book Form -->
			<form:form action="save" method="POST" modelAttribute="book" id="form" class="form-horizontal">
			
				<!-- Hidden form path for ID to use when using form to update book object -->
				<form:hidden path="id"/> 
				<fieldset>
				
				<!-- Form Name -->
				<legend>Add Book</legend>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="title">Title: </label>  
				  <div class="col-md-7">
				  <form:input id="title" path="title" type="text" placeholder="Title" class="form-control input-md"/>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="author">Author: </label>  
				  <div class="col-md-5">
				  <form:input id="author" path="author" type="text" placeholder="Author" class="form-control input-md"/>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="publisher">Publisher: </label>  
				  <div class="col-md-7">
				  <form:input id="publisher" path="publisher" type="text" placeholder="Publisher" class="form-control input-md"/>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="year">Publication Year:</label>  
				  <div class="col-md-3">
				  <form:input id="year" path="year" type="text" placeholder="Year" class="form-control input-md"/>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="isbn">ISBN: </label>  
				  <div class="col-md-5">
				  <form:input id="isbn" path="isbn" type="text" placeholder="ISBN" class="form-control input-md"/>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="pageCount">Page Count: </label>  
				  <div class="col-md-3">
				  <form:input id="pageCount" path="pageCount" type="text" placeholder="Pages" class="form-control input-md"/>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="genre">Genre:</label>  
				  <div class="col-md-4">
				  <form:input id="genre" path="genre" type="text" placeholder="Genre" class="form-control input-md"/>
				  </div>
				</div>
				
				</fieldset>
			</form:form>
		</div>

		<div class="col-md-4">
			
			<!-- Bootstrap Panel for adding book cover, save button, and return button -->
			<div class="panel panel-info">
				<div class="panel-heading">Add Book Cover</div>
			 	<div class="panel-body"><img src="https://firstfreerockford.org/wp-content/uploads/2018/08/placeholder-book-cover-default.png" class="img-thumbnail" style="max-width:50%;"></div>
				<div class="panel-footer"><input id="filebutton" name="filebutton" class="input-file" type="file"></div>
			</div>
			
			<!-- Uses form attribute to save Add-Book-Form using id #form  -->
			<button type="submit" form="form" class="btn btn-success btn-block" >Save</button>
			
			<a href="${pageContext.request.contextPath}/book/list"  class="btn btn-info btn-block btn-sm">Return to List</a>
		</div>
	
	</div>

</body>
</html>