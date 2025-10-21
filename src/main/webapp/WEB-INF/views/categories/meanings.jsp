<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<div class="container mt-4">
	<div class="d-flex justify-content-between align-items-center mb-3">
		<h2>Danh sách nghĩa của danh mục</h2>
		<a href="${pageContext.request.contextPath}/categories?lang=${currentLang}" class="btn btn-secondary">Quay lại</a>
	</div>

	<!-- Thông báo lỗi -->
	<c:if test="${not empty error}">
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
			<i class="bi bi-exclamation-triangle-fill"></i>
			<strong>Lỗi!</strong> ${error}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	</c:if>

	<!-- Thông báo thành công -->
	<c:if test="${not empty success}">
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			<i class="bi bi-check-circle-fill"></i>
			<strong>Thành công!</strong> ${success}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	</c:if>

	<!-- Form thêm nghĩa mới -->
	<div class="card mb-4">
		<div class="card-header bg-primary text-white">
			<h5 class="mb-0">Thêm nghĩa mới</h5>
		</div>
		<div class="card-body">
			<form method="post"
				action="${pageContext.request.contextPath}/categories/meanings/new" id="addMeaningForm">
				<input type="hidden" name="productCategoryID" value="${categoryId}" />
				
				<div class="mb-3">
					<label class="form-label" for="languageID">Ngôn ngữ</label>
					<select class="form-select ${not empty error ? 'is-invalid' : ''}" name="languageID" id="languageID" required>
						<option value="">Chọn ngôn ngữ</option>
						<c:forEach var="lang" items="${languages}">
							<option value="${lang.languageID}">${lang.languageName} (${lang.languageID})</option>
						</c:forEach>
					</select>
					<c:if test="${not empty error}">
						<div class="invalid-feedback d-block">
							Ngôn ngữ "${duplicateLanguage}" đã có nghĩa. Vui lòng chỉnh sửa trong bảng bên dưới.
						</div>
					</c:if>
				</div>

				<div class="mb-3">
					<label class="form-label" for="categoryName">Tên danh mục</label> 
					<input type="text" class="form-control" name="categoryName" id="categoryName" required />
				</div>

				<button class="btn btn-primary" type="submit">
					<i class="bi bi-plus-circle"></i> Thêm nghĩa
				</button>
			</form>
		</div>
	</div>

	<!-- Bảng danh sách nghĩa -->
	<div class="card">
		<div class="card-header bg-info text-white">
			<h5 class="mb-0">Danh sách nghĩa hiện có</h5>
		</div>
		<div class="card-body">
			<table class="table table-bordered table-hover">
				<thead class="table-light">
					<tr>
						<th>Ngôn ngữ</th>
						<th>Tên danh mục</th>
						<th>Hành động</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cat" items="${meanings}">
						<tr class="${cat.languageID eq duplicateLanguage ? 'table-warning' : ''}">
							<td>
								<c:out value="${cat.languageID}" />
								<c:if test="${cat.languageID eq duplicateLanguage}">
									<span class="badge bg-warning text-dark ms-2">
										<i class="bi bi-arrow-left"></i> Sửa tại đây
									</span>
								</c:if>
							</td>
							<td>
								<form method="post" 
									action="${pageContext.request.contextPath}/categories/meanings/update"
									class="d-inline">
									<input type="hidden" name="productCategoryID" value="${cat.productCategoryID}" />
									<input type="hidden" name="languageID" value="${cat.languageID}" />
									<div class="input-group">
										<input type="text" class="form-control ${cat.languageID eq duplicateLanguage ? 'border-warning' : ''}" name="categoryName" 
											value="${cat.categoryName}" required />
										<button class="btn btn-sm btn-warning" type="submit" title="Cập nhật">
											<i class="bi bi-save"></i> Lưu
										</button>
									</div>
								</form>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/categories/meanings/delete?categoryId=${cat.productCategoryID}&languageId=${cat.languageID}"
									class="btn btn-sm btn-danger"
									onclick="return confirm('Bạn có chắc chắn muốn xóa nghĩa này?')">
									<i class="bi bi-trash"></i> Xóa
								</a>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${empty meanings}">
						<tr>
							<td colspan="3" class="text-center text-muted">Chưa có nghĩa nào</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>

<c:if test="${not empty duplicateLanguage}">
<script>
// Tự động scroll đến dòng bị trùng và focus vào input
document.addEventListener('DOMContentLoaded', function() {
    var duplicateRow = document.querySelector('.table-warning');
    if (duplicateRow) {
        duplicateRow.scrollIntoView({ behavior: 'smooth', block: 'center' });
        var input = duplicateRow.querySelector('input[type="text"]');
        if (input) {
            setTimeout(function() {
                input.focus();
                input.select();
            }, 500);
        }
    }
});
</script>
</c:if>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
