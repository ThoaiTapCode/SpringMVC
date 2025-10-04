<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<c:set var="isNew" value="${empty product.productId}" />

<h2>${isNew ? 'Add Product' : 'Edit Product'}</h2>

<form method="post" action="${pageContext.request.contextPath}/products/${isNew ? 'save' : 'update'}">
  <c:if test="${!isNew}">
    <div class="mb-3">
      <label class="form-label">ID</label>
      <input class="form-control" name="productId" value="${product.productId}" readonly />
    </div>
  </c:if>
  <div class="mb-3">
    <label class="form-label">Price</label>
    <input class="form-control" name="price" value="${product.price}" required />
  </div>
  <div class="mb-3">
    <label class="form-label">Weight</label>
    <input class="form-control" name="weight" value="${product.weight}" required />
  </div>
  <div class="mb-3">
    <label class="form-label">Product Category ID</label>
    <input class="form-control" name="productCategoryId" value="${product.productCategoryId}" required />
  </div>
  <button class="btn btn-primary" type="submit">Save</button>
  <a class="btn btn-secondary" href="${pageContext.request.contextPath}/products">Cancel</a>
</form>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
