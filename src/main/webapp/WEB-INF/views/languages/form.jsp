<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<c:set var="isNew" value="${empty language.languageID}" />

<h2>${isNew ? 'Add Language' : 'Edit Language'}</h2>

<form method="post" action="${pageContext.request.contextPath}/languages/${isNew ? 'save' : 'update'}">
  <div class="mb-3">
    <label class="form-label">Language ID</label>
    <input class="form-control" name="languageID" value="${language.languageID}" ${isNew ? '' : 'readonly'} required />
  </div>
  <div class="mb-3">
    <label class="form-label">Language Name</label>
    <input class="form-control" name="languageName" value="${language.languageName}" required />
  </div>
  <button class="btn btn-primary" type="submit">Save</button>
  <a class="btn btn-secondary" href="${pageContext.request.contextPath}/languages">Cancel</a>
</form>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
