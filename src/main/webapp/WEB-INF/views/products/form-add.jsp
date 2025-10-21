<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<div class="container mt-4">
	<h2>Thêm Sản Phẩm Mới</h2>

	<!-- Thông báo quan trọng khi thêm mới -->
	<div class="alert alert-info d-flex align-items-center" role="alert">
		<i class="bi bi-info-circle-fill me-2 fs-4"></i>
		<div>
			<strong>Lưu ý quan trọng:</strong>
			<ul class="mb-0 mt-2">
				<li>Khi thêm mới, bạn sẽ tạo thông tin sản phẩm bằng <strong>tiếng Việt</strong> (mặc định) trước.</li>
				<li>Sau khi lưu, vào <strong>"Quản lý nghĩa"</strong> để thêm các ngôn ngữ khác (English, 中文, ...).</li>
				<li>Nhập tên và mô tả sản phẩm bằng tiếng Việt rõ ràng, dễ hiểu.</li>
			</ul>
		</div>
	</div>

	<form method="post" action="${pageContext.request.contextPath}/products/save">
		<!-- Mặc định ngôn ngữ vi -->
		<input type="hidden" name="lang" value="vi" />

		<!-- Thông tin cơ bản -->
		<div class="card mb-3">
			<div class="card-header bg-primary text-white">
				<h5 class="mb-0">Thông tin cơ bản</h5>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-6 mb-3">
						<label class="form-label">
							<i class="bi bi-currency-dollar"></i> Giá (Price) <span class="text-danger">*</span>
						</label>
						<input type="number" class="form-control" name="price" 
							required min="0" step="0.01" placeholder="VD: 100000" />
						<div class="form-text">Nhập giá bán sản phẩm (VNĐ hoặc đơn vị tiền tệ)</div>
					</div>
					<div class="col-md-6 mb-3">
						<label class="form-label">
							<i class="bi bi-box"></i> Trọng lượng (Weight) <span class="text-danger">*</span>
						</label>
						<input type="number" class="form-control" name="weight" 
							required min="0" step="0.01" placeholder="VD: 0.5" />
						<div class="form-text">Nhập trọng lượng (kg)</div>
					</div>
				</div>

				<div class="mb-3">
					<label class="form-label">
						<i class="bi bi-folder"></i> Danh mục <span class="text-danger">*</span>
					</label>
					<select class="form-select" name="productCategoryId" required>
						<option value="">-- Chọn danh mục sản phẩm --</option>
						<c:forEach var="cat" items="${categories}">
							<option value="${cat.productCategoryID}">${cat.categoryName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>

		<!-- Thông tin đa ngôn ngữ (Tiếng Việt) -->
		<div class="card mb-3">
			<div class="card-header bg-success text-white">
				<h5 class="mb-0">
					🇻🇳 Thông tin Tiếng Việt <span class="badge bg-light text-dark">Mặc định</span>
				</h5>
			</div>
			<div class="card-body">
				<div class="mb-3">
					<label class="form-label">
						<i class="bi bi-tag"></i> Tên sản phẩm (Tiếng Việt) <span class="text-danger">*</span>
					</label>
					<input type="text" class="form-control" name="productName" 
						required placeholder="VD: Laptop Dell Inspiron 15, Áo sơ mi nam..." />
					<div class="form-text">
						<i class="bi bi-lightbulb"></i> Nhập tên sản phẩm bằng tiếng Việt rõ ràng, dễ hiểu.
					</div>
				</div>

				<div class="mb-3">
					<label class="form-label">
						<i class="bi bi-file-text"></i> Mô tả sản phẩm (Tiếng Việt) <span class="text-danger">*</span>
					</label>
					<textarea class="form-control" name="productDescription" rows="4" 
						required placeholder="VD: Laptop hiệu năng cao, phù hợp cho công việc văn phòng và học tập..."></textarea>
					<div class="form-text">
						<i class="bi bi-lightbulb"></i> Mô tả chi tiết về sản phẩm để khách hàng dễ hiểu.
					</div>
				</div>

				<div class="alert alert-warning mb-0" role="alert">
					<i class="bi bi-translate"></i>
					<strong>Muốn thêm ngôn ngữ khác?</strong>
					Sau khi lưu sản phẩm, vào trang danh sách và click <strong>"Quản lý nghĩa"</strong> 
					để thêm tên và mô tả bằng English, 中文, và các ngôn ngữ khác.
				</div>
			</div>
		</div>

		<div class="d-flex gap-2">
			<button class="btn btn-primary btn-lg" type="submit">
				<i class="bi bi-save"></i> Tạo sản phẩm
			</button>
			<a class="btn btn-secondary btn-lg" href="${pageContext.request.contextPath}/products?lang=${currentLang}">
				<i class="bi bi-x-circle"></i> Hủy
			</a>
		</div>
	</form>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
