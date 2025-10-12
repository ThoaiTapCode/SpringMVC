<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<div class="d-flex justify-content-between align-items-center mb-3">
	<h2>Danh sách nghĩa của danh mục</h2>
</div>

<form method="post"
	action="${pageContext.request.contextPath}/categories/meanings/new">
	<input type="hidden" name="productCategoryID" value="${categoryId}" />
	<select
		class="form-select mb-3" name="languageID" required>
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

	<button class="btn btn-primary mb-3" type="submit">Thêm nghĩa
		mới</button>
</form>

<table class="table table-bordered">
	<thead>
		<tr>
			<th>Language</th>
			<th>Tên danh mục</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="cat" items="${meanings}">
			<tr>
				<td><c:out value="${cat.languageID}" /></td>
				<td><c:out value="${cat.categoryName}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
