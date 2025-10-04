<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">Multilang</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/languages">Languages</a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/categories">Categories</a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products">Products</a></li>
      </ul>
    </div>
  </div>
 </nav>

<div class="container mt-4">
