<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<div class="d-flex justify-content-between align-items-center mb-3">
  <h2>Ngôn ngữ</h2>
  <a class="btn btn-success" href="${pageContext.request.contextPath}/languages/new">Thêm ngôn ngữ</a>
</div>

<table class="table table-striped">
  <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="lang" items="${languages}">
      <tr>
        <td><c:out value="${lang.languageID}"/></td>
        <td><c:out value="${lang.languageName}"/></td>
        <td>
          <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/languages/edit?id=${lang.languageID}">Sửa</a>
          <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/languages/delete?id=${lang.languageID}" onclick="return confirm('Delete?')">Xóa</a>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
