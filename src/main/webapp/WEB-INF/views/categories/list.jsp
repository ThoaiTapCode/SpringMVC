<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<div class="d-flex justify-content-between align-items-center mb-3">
  <h2>Danh mục sản phẩm</h2>
  <a class="btn btn-success" href="${pageContext.request.contextPath}/categories/new">Add Category</a>
</div>

<table class="table table-bordered">
  <thead>
    <tr>
      <th>ID</th>
      <th>Can Be Shipped</th>
      <th>Tên</th>
      <th>Hành động</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="cat" items="${categories}">
      <tr>
        <td><c:out value="${cat.productCategoryId}"/></td>
        <td><c:out value="${cat.canBeShipped}"/></td>
        <td><c:out value="${cat.categoryName}"/></td>
        <td>
          <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/categories/edit?id=${cat.productCategoryId}">Sửa</a>
          <a class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/categories/meanings/list?id=${cat.productCategoryId}">Thêm nghĩa</a>
          <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/categories/delete?id=${cat.productCategoryId}" onclick="return confirm('Delete?')">Xóa</a>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
