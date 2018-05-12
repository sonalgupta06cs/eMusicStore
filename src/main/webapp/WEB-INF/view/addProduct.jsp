<%@include file="/WEB-INF/view/template/header.jsp"%>
<%@include file="/WEB-INF/view/template/taglib.jsp"%>
<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Add Products</h1>

			<p class="lead">Fill the below information to add a new product!</p>
		</div>

		<form:form action="${pageContext.request.contextPath}/admin/productInventory/addProduct" method="post" commandName="product" enctype="multipart/form-data">
			
			<div class="form-group">
				<label for="name">Name</label>                <form:input path="productName" id="name" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="category">Category</label>
				<label for="checkbox-inline"><form:radiobutton path="productCategory" id="category" value="instrument"/>Instrument</label>
				<label for="checkbox-inline"><form:radiobutton path="productCategory" id="category" value="record"/>Record</label>
				<label for="checkbox-inline"><form:radiobutton path="productCategory" id="category" value="accessory"/>ACCESSORY</label>
				 
			</div>
			
			<div class="form-group">
				<label for="description">Desc</label> <form:textarea path="productDescription" id="productDescription" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="price">Price</label> <form:input path="productPrice" id="productPrice" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="condition">Condition</label>
				<label for="checkbox-inline"><form:radiobutton path="productCondition" id="condition" value="new"/>New</label>
				<label for="checkbox-inline"><form:radiobutton path="productCondition" id="condition" value="used"/>Used</label>	 
			</div>
			
			<div class="form-group">
				<label for="status">Status</label>
				<label for="checkbox-inline"><form:radiobutton path="productStatus" id="status" value="active"/>Active</label>
				<label for="checkbox-inline"><form:radiobutton path="productStatus" id="status" value="inactive"/>Inactive</label>	 
			</div>
			
			<div class="form-group">
				<label for="unitInStock">unitInStock</label> <form:input path="unitInStock" id="unitInStock" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="manufacturer">Manufacturer</label> <form:input path="productManufacturer" id="productManufacturer" class="form-control" />
			</div>

			<div class="form-group">
				<label for="productFeedback">Feedback</label> <form:textarea path="productFeedback" id="productFeedback" class="form-control" />
			</div>
			
			<div class="form-group">
				<label class="control-label" for="productImage">Upload Picture</label>
				<form:input id="productImage" path="productImage" type="file" class="form:input-large"/>
			</div>
			
			
			<br><br>
			
			<input type="submit" value="Submit" class="btn btn-primary"> 
			
			<a href="<c:url value="/admin/productInventory" />" class="btn btn-warning">Cancel</a>
			
		</form:form>

        <br/>
		<%@include file="/WEB-INF/view/template/footer.jsp"%>