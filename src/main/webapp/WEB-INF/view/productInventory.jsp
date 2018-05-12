<%@include file="/WEB-INF/view/template/header.jsp"%>
<%@include file="/WEB-INF/view/template/taglib.jsp" %>
<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Products Inventory Page</h1>

			<p class="lead">This is the Products Inventory Page!!</p>
		</div>

		<table class="table table-striped table-hover">
			<thead>
				<tr class="bg-success">
					<th>Photo Thumb</th>
					<th>Product Name</th>
					<th>Category</th>
					<th>Condition</th>
					<th>Price</th>
					<th></th>
				</tr>
			</thead>
			<c:forEach var="product" items="${products}">
				<tr>
					<td><img src="#" alt="image" /></td>
					<td>${product.productName}</td>
					<td>${product.productCategory}</td>
					<td>${product.productCondition}</td>
					<td>${product.productPrice} USD</td>
					<td><a href="<spring:url value="/productList/viewProduct/${product.productId}"/>">
							<span class="glyphicon glyphicon-info-sign"></span></a>
						<a href="<spring:url value="/admin/productInventory/deleteProduct/${product.productId}"/>">
							<span class="glyphicon glyphicon-remove"></span></a>	
					</td>
							
				</tr>
			</c:forEach>
		</table>
		
		<a href="<spring:url value="/admin/productInventory/addProduct" />  " class="btn btn-primary"> Add Product </a>
		
		<br><br>

		<%@include file="/WEB-INF/view/template/footer.jsp"%>