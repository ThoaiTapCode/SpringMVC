<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<div class="container mt-4">
	<div class="d-flex justify-content-between align-items-center mb-3">
		<h2>Danh sách nghĩa của sản phẩm</h2>
		<a href="${pageContext.request.contextPath}/products?lang=en" class="btn btn-secondary">Quay lại</a>
	</div>

	<!-- Form thêm nghĩa mới -->
	<div class="card mb-4">
		<div class="card-header bg-primary text-white">
			<h5 class="mb-0">Thêm nghĩa mới</h5>
		</div>
		<div class="card-body">
			<form method="post"
				action="${pageContext.request.contextPath}/products/meanings/new">
				<input type="hidden" name="productId" value="${productId}" />
				
				<div class="mb-3">
					<label class="form-label" for="languageID">Ngôn ngữ</label>
					<select class="form-select" name="languageID" required>
						<option value="">Chọn ngôn ngữ</option>
						<c:forEach var="lang" items="${languages}">
							<option value="${lang.languageID}">${lang.languageName}</option>
						</c:forEach>
					</select>
				</div>

				<div class="mb-3">
					<label class="form-label" for="productName">Tên sản phẩm</label> 
					<input type="text" class="form-control" name="productName" required />
				</div>

				<div class="mb-3">
					<label class="form-label" for="productDescription">Mô tả sản phẩm</label> 
					<textarea class="form-control" name="productDescription" rows="3" required></textarea>
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
						<tr>
							<td><c:out value="${prod.languageID}" /></td>
							<td>
								<form method="post" 
									action="${pageContext.request.contextPath}/products/meanings/update"
									class="d-inline">
									<input type="hidden" name="productId" value="${prod.productId}" />
									<input type="hidden" name="languageID" value="${prod.languageID}" />
									<div class="mb-2">
										<input type="text" class="form-control" name="productName" 
											value="${prod.productName}" required />
									</div>
									<div class="mb-2">
										<textarea class="form-control" name="productDescription" rows="2" required>${prod.productDescription}</textarea>
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

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
