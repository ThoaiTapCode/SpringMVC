<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<div class="d-flex justify-content-between align-items-center mb-3">
  <h2>Products</h2>
  <a class="btn btn-success" href="${pageContext.request.contextPath}/products/new">Add Product</a>
</div>

<table class="table table-hover">
  <thead>
    <tr>
      <th>ID</th>
      <th>Price</th>
      <th>Weight</th>
      <th>Product Name</th>
      <th>Product Description</th>
      <th>Category Name</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="p" items="${products}">
      <tr>
        <td><c:out value="${p.productId}"/></td>
        <td><c:out value="${p.price}"/></td>
        <td><c:out value="${p.weight}"/></td>
        <td><c:out value="${p.productName}"/></td>
        <td><c:out value="${p.description}"/></td>
        <td><c:out value="${p.productCategoryName}"/></td>
        <td>
          <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/products/edit?id=${p.productId}">Edit</a>
          <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/products/delete?id=${p.productId}" onclick="return confirm('Delete?')">Delete</a>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
