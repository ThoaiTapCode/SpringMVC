<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Multilang Shop - Hệ thống quản lý đa ngôn ngữ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 0;
        }
        
        .landing-container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .hero-card {
            background: white;
            border-radius: 30px;
            padding: 4rem 3rem;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            text-align: center;
            animation: fadeInUp 0.8s ease;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .hero-logo {
            font-size: 5rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 1rem;
            animation: bounce 2s infinite;
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        
        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 1rem;
        }
        
        .hero-subtitle {
            font-size: 1.3rem;
            color: #64748b;
            margin-bottom: 3rem;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin: 3rem 0;
        }
        
        .feature-card {
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            border-radius: 20px;
            padding: 2rem;
            text-align: center;
            transition: all 0.3s;
            border: 2px solid transparent;
        }
        
        .feature-card:hover {
            transform: translateY(-5px);
            border-color: #667eea;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.3);
        }
        
        .feature-icon {
            font-size: 3rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 1rem;
        }
        
        .feature-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 0.5rem;
        }
        
        .feature-desc {
            color: #64748b;
            font-size: 0.95rem;
        }
        
        .cta-buttons {
            display: flex;
            gap: 1.5rem;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        .btn-hero {
            padding: 1rem 3rem;
            font-size: 1.2rem;
            font-weight: 700;
            border-radius: 50px;
            transition: all 0.3s;
            border: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-primary-hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);
        }
        
        .btn-primary-hero:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(102, 126, 234, 0.6);
            color: white;
        }
        
        .btn-outline-hero {
            background: white;
            color: #667eea;
            border: 3px solid #667eea;
        }
        
        .btn-outline-hero:hover {
            background: #667eea;
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);
        }
        
        .stats-row {
            display: flex;
            justify-content: center;
            gap: 3rem;
            margin-top: 3rem;
            padding-top: 3rem;
            border-top: 2px solid #e2e8f0;
        }
        
        .stat-item {
            text-align: center;
        }
        
        .stat-number {
            font-size: 2.5rem;
            font-weight: 800;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .stat-label {
            color: #64748b;
            font-weight: 600;
        }
        
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-card {
                padding: 3rem 2rem;
            }
            
            .cta-buttons {
                flex-direction: column;
            }
            
            .btn-hero {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="landing-container">
        <div class="hero-card">
            <div class="hero-logo">
                <i class="bi bi-shop-window"></i>
            </div>
            <h1 class="hero-title">Multilang Shop</h1>
            <p class="hero-subtitle">
                Hệ thống quản lý sản phẩm & danh mục đa ngôn ngữ hiện đại. 
                Hỗ trợ nhiều ngôn ngữ, giao diện thân thiện, dễ sử dụng.
            </p>
            
            <div class="cta-buttons">
                <a href="${pageContext.request.contextPath}/shop?lang=vi" 
                   class="btn btn-primary-hero btn-hero">
                    <i class="bi bi-basket"></i> Xem Cửa hàng
                </a>
                <a href="${pageContext.request.contextPath}/products?lang=vi" 
                   class="btn btn-outline-hero btn-hero">
                    <i class="bi bi-gear"></i> Quản trị Hệ thống
                </a>
            </div>
            
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-translate"></i>
                    </div>
                    <h3 class="feature-title">Đa ngôn ngữ</h3>
                    <p class="feature-desc">Hỗ trợ nhiều ngôn ngữ cho sản phẩm và danh mục</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-speedometer2"></i>
                    </div>
                    <h3 class="feature-title">Hiệu năng cao</h3>
                    <p class="feature-desc">Tải nhanh, trải nghiệm mượt mà</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-palette"></i>
                    </div>
                    <h3 class="feature-title">Giao diện đẹp</h3>
                    <p class="feature-desc">Thiết kế hiện đại, thân thiện người dùng</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-shield-check"></i>
                    </div>
                    <h3 class="feature-title">An toàn</h3>
                    <p class="feature-desc">Bảo mật dữ liệu tốt, validation chặt chẽ</p>
                </div>
            </div>
            
            <div class="stats-row">
                <div class="stat-item">
                    <div class="stat-number">
                        <i class="bi bi-globe"></i> 5+
                    </div>
                    <div class="stat-label">Ngôn ngữ</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">
                        <i class="bi bi-box-seam"></i> ∞
                    </div>
                    <div class="stat-label">Sản phẩm</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">
                        <i class="bi bi-tags"></i> ∞
                    </div>
                    <div class="stat-label">Danh mục</div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
