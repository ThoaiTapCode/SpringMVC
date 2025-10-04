<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
  <div class="container-fluid py-5">
    <h1 class="display-5 fw-bold">Chào mừng đến với Multilang</h1>
    <p class="col-md-8 fs-4">
    	Nơi bạn có thể thêm sản phẩm và danh mục sản phẩm với hỗ trợ đa ngôn ngữ.
    </p>
    <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/products" role="button">Bắt đầu</a>
  </div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
