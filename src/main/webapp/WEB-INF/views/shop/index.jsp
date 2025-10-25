<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Cửa hàng - Multilang Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <style>
        :root {
            --primary-color: #2563eb;
            --secondary-color: #7c3aed;
            --accent-color: #f59e0b;
            --dark-color: #1e293b;
            --light-color: #f8fafc;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        
        /* Top Bar */
        .top-bar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
            padding: 1rem 0;
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .language-selector-shop {
            border: 2px solid var(--primary-color);
            border-radius: 30px;
            padding: 0.5rem 1.5rem;
            background: white;
            color: var(--primary-color);
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .language-selector-shop:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(37, 99, 235, 0.3);
        }
        
        /* Hero Section */
        .hero-section {
            background: white;
            border-radius: 20px;
            padding: 3rem 2rem;
            margin: 2rem 0;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            text-align: center;
        }
        
        .hero-section h1 {
            font-size: 3rem;
            font-weight: 800;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 1rem;
        }
        
        /* Category Filter */
        .category-filter {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        
        .category-btn {
            border: 2px solid #e2e8f0;
            border-radius: 30px;
            padding: 0.6rem 1.5rem;
            margin: 0.3rem;
            background: white;
            color: var(--dark-color);
            font-weight: 600;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .category-btn:hover {
            border-color: var(--primary-color);
            color: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(37, 99, 235, 0.2);
        }
        
        .category-btn.active {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-color: var(--primary-color);
            color: white;
            box-shadow: 0 5px 15px rgba(37, 99, 235, 0.4);
        }
        
        /* Product Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }
        
        /* Product Card */
        .product-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
        }
        
        .product-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
        }
        
        .product-image {
            width: 100%;
            height: 250px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 4rem;
            color: white;
            position: relative;
            overflow: hidden;
        }
        
        .product-image::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            top: -50%;
            left: -50%;
            animation: shimmer 3s infinite;
        }
        
        @keyframes shimmer {
            0%, 100% { transform: rotate(0deg); }
            50% { transform: rotate(180deg); }
        }
        
        .product-badge {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: var(--accent-color);
            color: white;
            padding: 0.4rem 1rem;
            border-radius: 20px;
            font-weight: 700;
            font-size: 0.8rem;
            box-shadow: 0 3px 10px rgba(0,0,0,0.2);
        }
        
        .product-body {
            padding: 1.5rem;
        }
        
        .product-category {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 0.3rem 1rem;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
            margin-bottom: 0.8rem;
        }
        
        .product-title {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--dark-color);
            margin-bottom: 0.8rem;
            min-height: 3rem;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        
        .product-description {
            color: #64748b;
            font-size: 0.9rem;
            margin-bottom: 1rem;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
            min-height: 4rem;
        }
        
        .product-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 1rem;
            border-top: 2px solid #f1f5f9;
        }
        
        .product-price {
            font-size: 1.8rem;
            font-weight: 800;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .product-meta {
            display: flex;
            gap: 1rem;
            color: #94a3b8;
            font-size: 0.85rem;
        }
        
        .product-meta span {
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }
        
        /* Empty State */
        .empty-state {
            background: white;
            border-radius: 20px;
            padding: 4rem 2rem;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        
        .empty-state i {
            font-size: 5rem;
            color: #cbd5e1;
            margin-bottom: 1rem;
        }
        
        .empty-state h3 {
            color: var(--dark-color);
            margin-bottom: 0.5rem;
        }
        
        .empty-state p {
            color: #64748b;
        }
        
        /* Footer */
        .shop-footer {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            margin-top: 3rem;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        
        /* Animations */
        .fade-in {
            animation: fadeIn 0.6s ease-in;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .hero-section h1 {
                font-size: 2rem;
            }
            
            .products-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 1.5rem;
            }
            
            .product-title {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Top Navigation Bar -->
    <div class="top-bar">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <div class="logo">
                    <i class="bi bi-shop"></i> Multilang Shop
                </div>
                <div class="d-flex align-items-center gap-3">
                    <!-- Language Selector -->
                    <div class="dropdown">
                        <button class="btn language-selector-shop dropdown-toggle" type="button" 
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
                                <c:otherwise>Tiếng Việt</c:otherwise>
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
                    
                    <!-- Admin Link -->
                    <a href="${pageContext.request.contextPath}/products?lang=${currentLang}" 
                       class="btn btn-outline-primary rounded-pill">
                        <i class="bi bi-gear"></i> Quản trị
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Main Content -->
    <div class="container mt-4">
        <!-- Hero Section -->
        <div class="hero-section fade-in">
            <h1><i class="bi bi-basket"></i> Khám phá Sản phẩm</h1>
            <p class="lead text-muted">Chọn sản phẩm yêu thích của bạn từ các danh mục đa dạng</p>
                <!-- Search Form -->
                <form class="d-flex justify-content-center mt-3" method="get" action="${pageContext.request.contextPath}/shop">
                    <input type="hidden" name="lang" value="${currentLang}" />
                    <c:if test="${not empty selectedCategoryId}">
                        <input type="hidden" name="categoryId" value="${selectedCategoryId}" />
                    </c:if>
                    <div class="input-group" style="max-width:720px; width:100%;">
                        <input type="search" name="q" class="form-control form-control-lg" placeholder="Tìm kiếm sản phẩm, mô tả..." value="${fn:escapeXml(q)}" aria-label="Tìm kiếm" />
                        <button class="btn btn-primary btn-lg" type="submit">
                            <i class="bi bi-search"></i> Tìm
                        </button>
                    </div>
                </form>
        </div>
        
        <!-- Category Filter -->
        <div class="category-filter fade-in">
            <h5 class="mb-3"><i class="bi bi-filter-circle"></i> Lọc theo danh mục</h5>
            <div class="text-center">
                <a href="${pageContext.request.contextPath}/shop?lang=${currentLang}" 
                   class="category-btn ${empty selectedCategoryId ? 'active' : ''}">
                    <i class="bi bi-grid"></i> Tất cả
                </a>
                <c:forEach var="cat" items="${categories}">
                    <a href="${pageContext.request.contextPath}/shop?lang=${currentLang}&categoryId=${cat.productCategoryID}" 
                       class="category-btn ${selectedCategoryId == cat.productCategoryID ? 'active' : ''}">
                        <i class="bi bi-tag"></i> ${cat.categoryName}
                    </a>
                </c:forEach>
            </div>
        </div>
        
        <!-- Products Grid -->
        <c:choose>
            <c:when test="${not empty products}">
                <div class="products-grid">
                    <c:forEach var="product" items="${products}">
                        <div class="product-card fade-in">
                            <div class="product-image">
                                <i class="bi bi-box-seam"></i>
                                <span class="product-badge">
                                    <i class="bi bi-star-fill"></i> NEW
                                </span>
                            </div>
                            <div class="product-body">
                                <span class="product-category">
                                    ${product.productCategoryName}
                                </span>
                                <h3 class="product-title">${product.productName}</h3>
                                <p class="product-description">${product.description}</p>
                                <div class="product-meta">
                                    <span>
                                        <i class="bi bi-weight"></i> ${product.weight} kg
                                    </span>
                                    <span>
                                        <i class="bi bi-hash"></i> ID: ${product.productId}
                                    </span>
                                </div>
                                <div class="product-footer">
                                    <div class="product-price">
                                        <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0"/>₫
                                    </div>
                                    <button class="btn btn-primary rounded-pill">
                                        <i class="bi bi-cart-plus"></i> Thêm
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-state fade-in">
                    <i class="bi bi-inbox"></i>
                    <h3>Không có sản phẩm</h3>
                    <p>Hiện tại chưa có sản phẩm nào trong danh mục này.</p>
                    <a href="${pageContext.request.contextPath}/shop?lang=${currentLang}" 
                       class="btn btn-primary rounded-pill mt-3">
                        <i class="bi bi-arrow-left"></i> Xem tất cả sản phẩm
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
        
        <!-- Footer -->
        <div class="shop-footer fade-in">
            <p class="mb-0 text-muted">
                <i class="bi bi-heart-fill text-danger"></i> 
                Multilang Shop - Hệ thống quản lý sản phẩm đa ngôn ngữ
            </p>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function changeLanguage(newLang) {
            var currentUrl = window.location.href;
            var url = new URL(currentUrl);
            url.searchParams.set('lang', newLang);
            window.location.href = url.toString();
        }
        
        // Add animation on scroll
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = 1;
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        });
        
        document.querySelectorAll('.product-card').forEach((card) => {
            card.style.opacity = 0;
            card.style.transform = 'translateY(20px)';
            card.style.transition = 'all 0.6s ease';
            observer.observe(card);
        });
    </script>
</body>
</html>
