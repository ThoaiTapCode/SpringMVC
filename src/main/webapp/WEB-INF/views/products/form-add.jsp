<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<h2>Thêm sẩn phẩm</h2>

<form method="post"
	action="${pageContext.request.contextPath}/products/save">
	<input type="hidden" name="lang" value="${param.lang}" />
	<div class="mb-3">
		<label class="form-label">Price</label> <input class="form-control"
			name="price" required />
	</div>
	<div class="mb-3">
		<label class="form-label">Weight</label> <input class="form-control"
			name="weight" required />
	</div>
	<div class="mb-3">
		<label class="form-label">Description</label> <input
			class="form-control" name="productDescription" required />
	</div>
	<div class="mb-3">
		<label class="form-label">Name</label> <input class="form-control"
			name="productName" required />
	</div>
	<select class="form-select mb-3" name="productCategoryId" required>
		<option value="">Danh mục</option>
		<c:forEach var="lang" items="${categories}">
			<option value="${lang.productCategoryID}">${lang.categoryName}</option>
		</c:forEach>
	</select>
	<button class="btn btn-primary" type="submit">Save</button>
	<a class="btn btn-secondary"
		href="${pageContext.request.contextPath}/products">Cancel</a>
</form>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
