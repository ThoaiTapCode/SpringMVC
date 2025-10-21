<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<div class="container mt-4">
	<div class="d-flex justify-content-between align-items-center mb-3">
		<h2>Danh sách nghĩa của sản phẩm</h2>
		<a href="${pageContext.request.contextPath}/products?lang=${currentLang}" class="btn btn-secondary">Quay lại</a>
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
				action="${pageContext.request.contextPath}/products/meanings/new" id="addMeaningForm">
				<input type="hidden" name="productId" value="${productId}" />
				
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
					<label class="form-label" for="productName">Tên sản phẩm</label> 
					<input type="text" class="form-control" name="productName" id="productName" required />
				</div>

				<div class="mb-3">
					<label class="form-label" for="productDescription">Mô tả sản phẩm</label> 
					<textarea class="form-control" name="productDescription" id="productDescription" rows="3" required></textarea>
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
						<th>Tên sản phẩm</th>
						<th>Mô tả sản phẩm</th>
						<th>Hành động</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="prod" items="${meanings}">
						<tr class="${prod.languageID eq duplicateLanguage ? 'table-warning' : ''}">
							<td>
								<c:out value="${prod.languageID}" />
								<c:if test="${prod.languageID eq duplicateLanguage}">
									<span class="badge bg-warning text-dark ms-2">
										<i class="bi bi-arrow-left"></i> Sửa tại đây
									</span>
								</c:if>
							</td>
							<td>
								<form method="post" 
									action="${pageContext.request.contextPath}/products/meanings/update"
									class="d-inline">
									<input type="hidden" name="productId" value="${prod.productId}" />
									<input type="hidden" name="languageID" value="${prod.languageID}" />
									<div class="mb-2">
										<input type="text" class="form-control ${prod.languageID eq duplicateLanguage ? 'border-warning' : ''}" name="productName" 
											value="${prod.productName}" required placeholder="Tên sản phẩm" />
									</div>
									<div class="mb-2">
										<textarea class="form-control ${prod.languageID eq duplicateLanguage ? 'border-warning' : ''}" name="productDescription" rows="2" required placeholder="Mô tả">${prod.productDescription}</textarea>
									</div>
									<button class="btn btn-sm btn-warning" type="submit" title="Cập nhật">
										<i class="bi bi-save"></i> Lưu
									</button>
								</form>
							</td>
							<td><c:out value="${prod.productDescription}" /></td>
							<td>
								<a href="${pageContext.request.contextPath}/products/meanings/delete?productId=${prod.productId}&languageId=${prod.languageID}"
									class="btn btn-sm btn-danger"
									onclick="return confirm('Bạn có chắc chắn muốn xóa nghĩa này?')">
									<i class="bi bi-trash"></i> Xóa
								</a>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${empty meanings}">
						<tr>
							<td colspan="4" class="text-center text-muted">Chưa có nghĩa nào</td>
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
