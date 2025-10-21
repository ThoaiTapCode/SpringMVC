<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header fragment with Bootstrap CSS and navbar -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title><c:out value="${pageTitle != null ? pageTitle : 'Multilang'}"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <style>
        .language-selector {
            min-width: 150px;
        }
        .language-selector .dropdown-item.active {
            background-color: #0d6efd;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}?lang=${currentLang}">Multilang</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/shop?lang=${currentLang}">
            <i class="bi bi-shop"></i> Cửa hàng
          </a>
        </li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/languages">Languages</a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/categories?lang=${currentLang}">Categories</a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products?lang=${currentLang}">Products</a></li>
      </ul>
      
      <!-- Language Selector Dropdown -->
      <div class="dropdown">
        <button class="btn btn-outline-light dropdown-toggle language-selector" type="button" 
                id="languageDropdown" data-bs-toggle="dropdown" aria-expanded="false">
          <i class="bi bi-globe"></i>
          <c:choose>
            <c:when test="${not empty currentLang}">
              <c:forEach var="lang" items="${availableLanguages}">
                <c:if test="${lang.languageID eq currentLang}">
                  <c:out value="${lang.languageName}"/>
                </c:if>
              </c:forEach>
            </c:when>
            <c:otherwise>English</c:otherwise>
          </c:choose>
        </button>
        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="languageDropdown">
          <c:forEach var="lang" items="${availableLanguages}">
            <li>
              <a class="dropdown-item ${lang.languageID eq currentLang ? 'active' : ''}" 
                 href="javascript:void(0);" 
                 onclick="changeLanguage('${lang.languageID}')">
                <c:out value="${lang.languageName}"/> (${lang.languageID})
              </a>
            </li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>
 </nav>

<div class="container mt-4">

<script>
function changeLanguage(newLang) {
    // Get current URL
    var currentUrl = window.location.href;
    var url = new URL(currentUrl);
    
    // Update or add the 'lang' parameter
    url.searchParams.set('lang', newLang);
    
    // Redirect to the new URL
    window.location.href = url.toString();
}
</script>
