<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<c:set var="isNew" value="${category.productCategoryId == 0}" />

<div class="container mt-4">
	<h2>${isNew ? 'Thêm Category Mới' : 'Chỉnh sửa Category'}</h2>

	<!-- Thông báo quan trọng khi thêm mới -->
	<c:if test="${isNew}">
		<div class="alert alert-info d-flex align-items-center" role="alert">
			<i class="bi bi-info-circle-fill me-2 fs-4"></i>
			<div>
				<strong>Lưu ý quan trọng:</strong>
				<ul class="mb-0 mt-2">
					<li>Khi thêm mới, bạn sẽ tạo nghĩa <strong>tiếng Việt</strong> (mặc định) trước.</li>
					<li>Sau khi lưu, vào <strong>"Quản lý nghĩa"</strong> để thêm các ngôn ngữ khác (English, 中文, ...).</li>
					<li>Đảm bảo nhập đúng tên tiếng Việt để dễ quản lý sau này.</li>
				</ul>
			</div>
		</div>
	</c:if>

	<form method="post"
		action="${pageContext.request.contextPath}/categories/${isNew ? 'save' : 'update'}">
		
		<c:if test="${!isNew}">
			<input type="hidden" name="productCategoryId" value="${category.productCategoryId}" />
		</c:if>

		<div class="mb-3 form-check">
			<input type="checkbox" class="form-check-input" id="canBeShipped"
				name="canBeShipped" ${category.canBeShipped ? 'checked' : ''} /> 
			<label class="form-check-label" for="canBeShipped">Có thể vận chuyển (Can be shipped)</label>
		</div>

		<div class="mb-3">
			<label class="form-label" for="languageId">Ngôn ngữ</label>
			<c:choose>
				<c:when test="${isNew}">
					<!-- Khi thêm mới: mặc định vi và không cho đổi -->
					<input type="hidden" name="languageId" value="vi" />
					<input type="text" class="form-control" value="🇻🇳 Tiếng Việt (vi)" disabled readonly />
					<div class="form-text">
						<i class="bi bi-lock-fill"></i> Ngôn ngữ mặc định khi tạo mới. 
						Sau khi lưu, bạn có thể thêm các ngôn ngữ khác trong "Quản lý nghĩa".
					</div>
				</c:when>
				<c:otherwise>
					<!-- Khi chỉnh sửa: cho phép đổi ngôn ngữ -->
					<select class="form-select" name="languageId" required>
						<option value="">Chọn ngôn ngữ</option>
						<c:forEach var="lang" items="${languages}">
							<option value="${lang.languageID}"
								${category.languageId == lang.languageID ? 'selected' : ''}>
								${lang.languageName} (${lang.languageID})
							</option>
						</c:forEach>
					</select>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="mb-3">
			<label class="form-label" for="categoryName">
				${isNew ? 'Tên danh mục (Tiếng Việt)' : 'Tên danh mục'}
			</label> 
			<input type="text" class="form-control" name="categoryName"
				value="${category.categoryName}" required 
				placeholder="${isNew ? 'VD: Điện tử, Quần áo, Thực phẩm...' : ''}" />
			<c:if test="${isNew}">
				<div class="form-text">
					<i class="bi bi-lightbulb"></i> Nhập tên tiếng Việt rõ ràng, dễ hiểu.
				</div>
			</c:if>
		</div>

		<div class="d-flex gap-2">
			<button class="btn btn-primary" type="submit">
				<i class="bi bi-save"></i> ${isNew ? 'Tạo mới' : 'Cập nhật'}
			</button>
			<a class="btn btn-secondary" href="${pageContext.request.contextPath}/categories?lang=${currentLang}">
				<i class="bi bi-x-circle"></i> Hủy
			</a>
		</div>
	</form>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
