<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<c:set var="isNew" value="${category.productCategoryId == 0}" />

<h2>${isNew ? 'Thêm Category' : 'Chỉnh sửa Category'}</h2>

<form method="post"
	action="${pageContext.request.contextPath}/categories/${isNew ? 'save' : 'update'}">
	<div class="mb-3 form-check">
		<input type="checkbox" class="form-check-input" id="canBeShipped"
			name="canBeShipped" ${category.canBeShipped ? 'checked' : ''} /> <label
			class="form-check-label" for="canBeShipped">Can be shipped</label>
	</div>
	<select class="form-select mb-3" name="languageId" required>
		<option value="">Chọn ngôn ngữ</option>
		<c:forEach var="lang" items="${languages}">
			<option value="${lang.languageID}"
				${category.languageId == lang.languageID ? 'selected' : ''}>${lang.languageName}</option>
		</c:forEach>
	</select>
	<div class="mb-3">
		<label class="form-label" for="categoryName">Nghĩa</label> <input
			type="text" class="form-control" name="categoryName"
			value="${category.categoryName}" required />
	</div>
	<button class="btn btn-primary" type="submit">Lưu</button>
	<a class="btn btn-secondary"
		href="${pageContext.request.contextPath}/categories">Cancel</a>
</form>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
