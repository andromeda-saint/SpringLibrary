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
<title>Search</title>
</head>

<body>

	<div class="container">
	
		<div class="page-header">
	    	<h1>Spring MVC & Hibernate Library App</h1>      
	 	</div>
		
		<div class="page-header">
		    	<h4>Search Results</h4>      
		</div>
		 	
		<div class="row" style="padding:5%">
		
			<div id="results" class="col-sm-10">
				
				<!-- JSTL forEach to loop through books(List<Book>) and render them on page -->
				<c:forEach var="book" items="${books}">
					
					<!-- JSTL url link to update mapping and passing parameter of corresponding book ID -->
					<c:url var="updateLink" value="/book/update">
						<c:param name="bookId" value="${book.id}" />
					</c:url>
					
					<!-- JSTL url link to delete mapping and passing parameter of corresponding book ID -->
					<c:url var="deleteLink" value="/book/delete">
						<c:param name="bookId" value="${book.id}" />
					</c:url>
					
					<div class="panel panel-info">
						<!-- Delete button -->
						<a data-toggle="modal" data-target="#deleteModal" class="label label-danger" style="float:right; margin: 2px; margin-top: 12px; margin-right: 7px">Delete</a>
						
						<!-- Update button -->
						<a href="${updateLink}" class="label label-info" style="float:right; margin: 2px; margin-top: 12px; margin-right: 5px">Edit</a>
			    		
			    		<div class="panel-heading"><a data-toggle="collapse" href="#${book.id}">${book.title}</a></div>
			    		
			    		<!-- Delete Modal -->
			    		<div class="modal fade" id="deleteModal" role="dialog">
							<div class="modal-dialog ">
						    	<div class="modal-content">
						    	
							        <div class="modal-header">
							        	<button type="button" class="close" data-dismiss="modal">&times;</button>
							        	<h4 class="modal-title">Delete Book</h4>
							        </div>
							        
							        <div class="modal-body">
							        	<p>Are you sure you want to delete this entry?</p>
								        <div class="media">
											<div class="media-left">
												<img src="https://firstfreerockford.org/wp-content/uploads/2018/08/placeholder-book-cover-default.png" class="img-thumbnail media-object" style="max-width:125px; margin: 6px">
											</div>
							      			<div class="media-body">
												<table class="table table-striped table-condensed">
													<tbody>
														<tr><td>Author: ${book.author}</td></tr>
														<tr><td>Publisher: ${book.publisher}</td></tr>
														<tr><td>Publication Year: ${book.year}</td></tr>
														<tr><td>Pages: ${book.pageCount}</td></tr>
														<tr><td>Genre: ${book.genre}</td></tr>
														<tr><td>ISBN: ${book.isbn}</td></tr>
													</tbody>
												</table>
											</div>
										</div>
							        </div>
							        
							        <div class="modal-footer">
							        	<a href="${deleteLink}" type="button" class="btn btn-danger">Delete</a>
							          	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							    	</div>
						 		
						 		</div>
							</div>
						</div>
			    		
			      		<!-- Book object -->
		      			<div id="${book.id}" class="bg media collapse">
							<div class="media-left">
								<img src="https://firstfreerockford.org/wp-content/uploads/2018/08/placeholder-book-cover-default.png" class="img-thumbnail media-object" style="max-width:125px; margin: 6px">
							</div>
		      				<div class="media-body">
								<table class="table table-striped table-condensed">
									<tbody>
										<tr><td>Author: ${book.author}</td></tr>
										<tr><td>Publisher: ${book.publisher}</td></tr>
										<tr><td>Publication Year: ${book.year}</td></tr>
										<tr><td>Pages: ${book.pageCount}</td></tr>
										<tr><td>Genre: ${book.genre}</td></tr>
										<tr><td>ISBN: ${book.isbn}</td></tr>
									</tbody>
								</table>
							</div>
						</div>
			    	</div>
				
				</c:forEach>		
			</div>
			
			<div class="col-sm-2">
				<!-- Search bar and Add Book button affixed to page -->
				
				<div data-spy="affix" style="padding:inherit">
				
					<!-- Search bar -->
					<form:form action="search" method="POST">
						<div class="input-group">
					    	<input name="searchContents" class="form-control" id="search" placeholder="Search..."/>
					    	<div class="input-group-btn">
					      		<button class="btn btn-default" type="submit">
					        		<i class="glyphicon glyphicon-search"></i>
					      		</button>
					  		</div>
					    </div>
					</form:form>
					
					<a href="${pageContext.request.contextPath}/book/add" class="btn btn-success btn-block btn-sm" style="margin-top: 14px">
						Add Book
						<i class="glyphicon glyphicon-plus"></i>
					</a>
					<a href="${pageContext.request.contextPath}/book/list"  class="btn btn-info btn-block btn-sm">Return to List</a>
				</div>
			</div>
		
		</div>
		
	</div>
	
	<!-- JavaScript to enable active filtering in search form -->
	<script>
	$(document).ready(function(){
	  $("#search").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#results .panel.panel-info").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
	</script>
	
</body>
</html>