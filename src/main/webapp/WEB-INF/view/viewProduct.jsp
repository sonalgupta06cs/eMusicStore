<%@include file="/WEB-INF/view/template/header.jsp"%>
<%@include file="/WEB-INF/view/template/taglib.jsp" %>
<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Products Details</h1>

			<p class="lead">Here is the information for the products!</p>
		</div>

		<div class="container">

			<div class="row">
				<div class="col-md-5">
					<img alt="image" src="#" style="width: 100%; height: 300px" />
				</div>


				<div class="col-md-5">
					<h3>${product.productName}</h3>
					<p>${product.productDescription}</p>
					<p> <strong>Manufacturer</strong> : ${product.productManufacturer}</p>
					<p><strong>Category</strong> : ${product.productCategory}</p>
					<h4>${product.productPrice}</h4>
					<p><strong>Status</strong> : ${product.productStatus}</p>
					<p><strong>Condition</strong> :${product.productCondition}</p>
					<p>${product.unitInStock}</p>
					<p>${product.productFeedback}</p>
					
				</div>

			</div>

		</div>

		<%@include file="/WEB-INF/view/template/footer.jsp"%>