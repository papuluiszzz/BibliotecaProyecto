<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta Pública - Biblioteca ADSO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --dark-gradient: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            --glass-bg: rgba(255, 255, 255, 0.1);
            --glass-border: rgba(255, 255, 255, 0.2);
            --shadow-light: 0 8px 32px rgba(0, 0, 0, 0.1);
            --shadow-medium: 0 16px 48px rgba(0, 0, 0, 0.15);
            --shadow-heavy: 0 24px 64px rgba(0, 0, 0, 0.2);
            --border-radius: 24px;
            --border-radius-sm: 16px;
            --transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            line-height: 1.6;
        }

        /* Glassmorphism Effects */
        .glass {
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid var(--glass-border);
        }

        /* Modern Navbar */
        .modern-navbar {
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--glass-border);
            padding: 1rem 0;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .nav-link {
            font-weight: 500;
            color: #2c3e50 !important;
            padding: 0.5rem 1.5rem !important;
            border-radius: var(--border-radius-sm);
            transition: var(--transition);
        }

        .nav-link:hover {
            background: var(--primary-gradient);
            color: white !important;
            transform: translateY(-2px);
        }

        /* Hero Section with 3D Effect */
        .hero-section {
            background: var(--primary-gradient);
            padding: 8rem 0 6rem;
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="a" cx="50%" cy="50%"><stop offset="0%" style="stop-color:rgba(255,255,255,0.1)"/><stop offset="100%" style="stop-color:rgba(255,255,255,0)"/></radialGradient></defs><circle cx="200" cy="200" r="150" fill="url(%23a)"/><circle cx="800" cy="300" r="100" fill="url(%23a)"/><circle cx="400" cy="700" r="200" fill="url(%23a)"/></svg>');
            opacity: 0.3;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero-title {
            font-size: 4rem;
            font-weight: 700;
            margin-bottom: 2rem;
            text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }

        .hero-subtitle {
            font-size: 1.5rem;
            font-weight: 300;
            opacity: 0.9;
        }

        /* Floating Search Card */
        .search-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: var(--border-radius);
            padding: 3rem;
            box-shadow: var(--shadow-heavy);
            margin-top: -5rem;
            position: relative;
            z-index: 10;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        /* Modern Form Controls */
        .form-control, .form-select {
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: var(--border-radius-sm);
            padding: 1rem 1.5rem;
            font-weight: 500;
            transition: var(--transition);
            background: rgba(255, 255, 255, 0.8);
        }

        .form-control:focus, .form-select:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.25rem rgba(102, 126, 234, 0.15);
            background: white;
            transform: translateY(-2px);
        }

        /* Modern Buttons */
        .btn {
            border-radius: var(--border-radius-sm);
            padding: 1rem 2rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: var(--transition);
            border: none;
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn-primary {
            background: var(--primary-gradient);
            box-shadow: var(--shadow-light);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-medium);
        }

        /* Stats Banner with Neon Effect */
        .stats-banner {
            background: var(--success-gradient);
            border-radius: var(--border-radius);
            padding: 3rem;
            margin: 3rem 0;
            position: relative;
            overflow: hidden;
        }

        .stats-banner::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: rotate 20s linear infinite;
        }

        @keyframes rotate {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .stat-item {
            text-align: center;
            position: relative;
            z-index: 2;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }

        /* Modern Book Cards */
        .book-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(20px);
            border-radius: var(--border-radius);
            border: 1px solid rgba(255, 255, 255, 0.3);
            box-shadow: var(--shadow-light);
            transition: var(--transition);
            margin-bottom: 2rem;
            overflow: hidden;
            position: relative;
        }

        .book-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--primary-gradient);
        }

        .book-card:hover {
            transform: translateY(-10px) rotateY(5deg);
            box-shadow: var(--shadow-heavy);
            background: rgba(255, 255, 255, 0.95);
        }

        .book-icon {
            font-size: 4rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 1.5rem;
            filter: drop-shadow(0 4px 8px rgba(102, 126, 234, 0.3));
        }

        /* Modern Badges */
        .badge {
            border-radius: 50px;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .badge-disponible {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            box-shadow: 0 4px 15px rgba(79, 172, 254, 0.4);
        }

        .badge-no-disponible {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            box-shadow: 0 4px 15px rgba(245, 87, 108, 0.4);
        }

        /* Category Filter with Pills */
        .category-filter {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(20px);
            border-radius: var(--border-radius);
            padding: 2rem;
            box-shadow: var(--shadow-light);
            border: 1px solid rgba(255, 255, 255, 0.3);
            margin-bottom: 2rem;
        }

        .category-pill {
            background: rgba(102, 126, 234, 0.1);
            color: #667eea;
            border: 2px solid rgba(102, 126, 234, 0.2);
            border-radius: 50px;
            padding: 0.75rem 1.5rem;
            margin: 0.25rem;
            transition: var(--transition);
            text-decoration: none;
            display: inline-block;
        }

        .category-pill:hover, .category-pill.active {
            background: var(--primary-gradient);
            color: white;
            transform: translateY(-2px);
            box-shadow: var(--shadow-light);
        }

        /* Login Prompt with Glow */
        .login-prompt {
            background: var(--secondary-gradient);
            border-radius: var(--border-radius);
            padding: 3rem;
            text-align: center;
            margin: 3rem 0;
            position: relative;
            overflow: hidden;
        }

        .login-prompt::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: var(--secondary-gradient);
            border-radius: var(--border-radius);
            z-index: -1;
            filter: blur(20px);
            opacity: 0.7;
        }

        /* Info Cards with Hover Effects */
        .info-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(20px);
            border-radius: var(--border-radius);
            border: 1px solid rgba(255, 255, 255, 0.3);
            box-shadow: var(--shadow-light);
            transition: var(--transition);
            height: 100%;
        }

        .info-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-medium);
        }

        .info-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.1));
        }

        /* Modern Footer */
        .modern-footer {
            background: var(--dark-gradient);
            margin-top: 5rem;
            padding: 3rem 0;
            position: relative;
        }

        .modern-footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
        }

        /* Animations */
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

        .fade-in-up {
            animation: fadeInUp 0.8s ease-out;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .search-card {
                margin-top: -3rem;
                padding: 2rem;
            }
            
            .book-card:hover {
                transform: translateY(-5px);
            }
        }

        /* Loading Animation */
        .loading {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 3px solid rgba(255,255,255,.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <!-- Modern Navbar -->
    <nav class="navbar navbar-expand-lg modern-navbar">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/consulta-publica">
                <i class="fas fa-book-open me-2"></i>
                Biblioteca ADSO
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/login">
                    <i class="fas fa-sign-in-alt me-2"></i>Iniciar Sesión
                </a>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container hero-content text-center text-white">
            <h1 class="hero-title fade-in-up">
                <i class="fas fa-search me-3"></i>
                Catálogo Digital
            </h1>
            <p class="hero-subtitle fade-in-up">
                Descubre nuestro universo de conocimiento
            </p>
            <p class="mt-4 fade-in-up">
                <i class="fas fa-info-circle me-2"></i>
                Acceso libre y gratuito a nuestro catálogo
            </p>
        </div>
    </div>

    <div class="container">
        <!-- Floating Search Card -->
        <div class="search-card fade-in-up">
            <h4 class="mb-4 text-center fw-bold">
                <i class="fas fa-search me-2" style="color: #667eea;"></i>
                Explorar Biblioteca
            </h4>
            
            <form method="post" action="${pageContext.request.contextPath}/consulta-publica">
                <div class="row g-4">
                    <div class="col-md-5">
                        <div class="form-floating">
                            <input type="text" class="form-control" 
                                   id="termino" name="termino" 
                                   placeholder="Título, autor o categoría..." 
                                   value="${terminoBusqueda}">
                            <label for="termino">¿Qué estás buscando?</label>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-floating">
                            <select class="form-select" name="tipo" id="tipo">
                                <option value="general" ${tipoBusqueda == 'general' ? 'selected' : ''}>Todo</option>
                                <option value="titulo" ${tipoBusqueda == 'titulo' ? 'selected' : ''}>Título</option>
                                <option value="autor" ${tipoBusqueda == 'autor' ? 'selected' : ''}>Autor</option>
                                <option value="categoria" ${tipoBusqueda == 'categoria' ? 'selected' : ''}>Categoría</option>
                            </select>
                            <label for="tipo">Buscar en</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="d-grid gap-2 d-md-flex h-100">
                            <button type="submit" class="btn btn-primary flex-grow-1">
                                <i class="fas fa-search me-2"></i>Buscar
                            </button>
                            <a href="${pageContext.request.contextPath}/consulta-publica" 
                               class="btn btn-outline-secondary">
                                <i class="fas fa-refresh"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- Stats Banner -->
        <div class="stats-banner text-white">
            <div class="row text-center">
                <div class="col-md-4 stat-item">
                    <div class="stat-number"><i class="fas fa-book me-2"></i>${totalLibros}</div>
                    <p class="mb-0 fs-5">Libros en el catálogo</p>
                </div>
                <div class="col-md-4 stat-item">
                    <div class="stat-number">
                        <i class="fas fa-check-circle me-2"></i>
                        <c:set var="disponibles" value="0"/>
                        <c:forEach var="libro" items="${libros}">
                            <c:if test="${libro.disponible}">
                                <c:set var="disponibles" value="${disponibles + 1}"/>
                            </c:if>
                        </c:forEach>
                        ${disponibles}
                    </div>
                    <p class="mb-0 fs-5">Disponibles ahora</p>
                </div>
                <div class="col-md-4 stat-item">
                    <div class="stat-number"><i class="fas fa-tags me-2"></i>${categorias.size()}</div>
                    <p class="mb-0 fs-5">Categorías únicas</p>
                </div>
            </div>
        </div>

        <!-- Category Filter -->
        <c:if test="${not empty categorias}">
            <div class="category-filter">
                <h6 class="mb-3 fw-bold">
                    <i class="fas fa-filter me-2"></i>Filtrar por categoría
                </h6>
                <div class="d-flex flex-wrap">
                    <a href="${pageContext.request.contextPath}/consulta-publica" 
                       class="category-pill ${empty tipoBusqueda || tipoBusqueda != 'categoria' ? 'active' : ''}">
                        Todas
                    </a>
                    <c:forEach var="categoria" items="${categorias}">
                        <form method="post" action="${pageContext.request.contextPath}/consulta-publica" 
                              style="display: inline;">
                            <input type="hidden" name="termino" value="${categoria}">
                            <input type="hidden" name="tipo" value="categoria">
                            <button type="submit" 
                                    class="category-pill ${terminoBusqueda == categoria ? 'active' : ''}">
                                ${categoria}
                            </button>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </c:if>

        <!-- Login Prompt -->
        <div class="login-prompt text-white">
            <h5><i class="fas fa-user-plus me-2"></i>¿Necesitas un libro?</h5>
            <p class="mb-3 fs-5">Únete a nuestra comunidad digital</p>
            <a href="${pageContext.request.contextPath}/login" class="btn btn-light btn-lg">
                <i class="fas fa-sign-in-alt me-2"></i>Acceder Ahora
            </a>
        </div>

        <!-- Search Results -->
        <c:if test="${not empty terminoBusqueda}">
            <div class="alert alert-info border-0" style="background: rgba(13, 202, 240, 0.1); border-radius: 16px;">
                <i class="fas fa-info-circle me-2"></i>
                <strong>${libros.size()}</strong> resultados para 
                "<strong>${terminoBusqueda}</strong>"
            </div>
        </c:if>

        <!-- Book Grid -->
        <div class="row">
            <c:forEach var="libro" items="${libros}">
                <div class="col-md-6 col-lg-4">
                    <div class="book-card card h-100 border-0">
                        <div class="card-body text-center p-4">
                            <div class="book-icon">
                                <i class="fas fa-book"></i>
                            </div>
                            <h5 class="card-title fw-bold mb-3">${libro.titulo}</h5>
                            <div class="card-text text-muted mb-4">
                                <p class="mb-2"><i class="fas fa-user me-2"></i><strong>${libro.autor}</strong></p>
                                <p class="mb-2"><i class="fas fa-building me-2"></i>${libro.editorial}</p>
                                <p class="mb-0"><i class="fas fa-calendar me-2"></i>${libro.anio}</p>
                            </div>
                            <div class="mb-3">
                                <span class="badge bg-primary">${libro.categoria}</span>
                            </div>
                            <div class="mb-3">
                                <c:choose>
                                    <c:when test="${libro.disponible}">
                                        <span class="badge badge-disponible">
                                            <i class="fas fa-check me-1"></i>Disponible
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge badge-no-disponible">
                                            <i class="fas fa-times me-1"></i>No Disponible
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <c:if test="${libro.disponible}">
                                <div class="d-grid">
                                    <a href="${pageContext.request.contextPath}/login" 
                                       class="btn btn-primary">
                                        <i class="fas fa-hand-holding me-2"></i>
                                        Solicitar
                                    </a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Empty State -->
        <c:if test="${empty libros}">
            <div class="text-center py-5">
                <i class="fas fa-book fa-4x text-muted mb-4" style="opacity: 0.3;"></i>
                <h4 class="text-muted fw-bold">No encontramos resultados</h4>
                <c:choose>
                    <c:when test="${not empty terminoBusqueda}">
                        <p class="text-muted mb-4">
                            Intenta con términos diferentes o explora todas las categorías
                        </p>
                        <a href="${pageContext.request.contextPath}/consulta-publica" 
                           class="btn btn-primary">
                            <i class="fas fa-eye me-2"></i>Ver Todo el Catálogo
                        </a>
                    </c:when>
                    <c:otherwise>
                        <p class="text-muted">
                            El catálogo se está actualizando
                        </p>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>

        <!-- Info Cards -->
        <div class="row mt-5 g-4">
            <div class="col-md-4">
                <div class="info-card card border-0 text-center p-4">
                    <div class="card-body">
                        <i class="fas fa-clock info-icon" style="color: #667eea;"></i>
                        <h5 class="fw-bold">Horarios</h5>
                        <p class="card-text text-muted">
                            Lun - Vie: 8:00 AM - 6:00 PM<br>
                            Sábados: 9:00 AM - 2:00 PM
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="info-card card border-0 text-center p-4">
                    <div class="card-body">
                        <i class="fas fa-calendar-alt info-icon" style="color: #4facfe;"></i>
                        <h5 class="fw-bold">Préstamos</h5>
                        <p class="card-text text-muted">
                            Generales: 15 días<br>
                            Referencia: 7 días
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="info-card card border-0 text-center p-4">
                    <div class="card-body">
                        <i class="fas fa-phone info-icon" style="color: #f5576c;"></i>
                        <h5 class="fw-bold">Contacto</h5>
                        <p class="card-text text-muted">
                            (123) 456-7890<br>
                            biblioteca@adso.edu.co
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modern Footer -->
    <footer class="modern-footer text-white">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h5 class="fw-bold">
                        <i class="fas fa-book-open me-2"></i>
                        Sistema de Biblioteca ADSO
                    </h5>
                    <p class="mb-0 text-white-50">Tecnología en Análisis y Desarrollo de Software</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <a href="${pageContext.request.contextPath}/login" 
                       class="btn btn-outline-light">
                        <i class="fas fa-sign-in-alt me-2"></i>Portal de Usuarios
                    </a>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Enhanced loading and animations
        document.addEventListener('DOMContentLoaded', function() {
            // Auto-focus search input
            const searchInput = document.getElementById('termino');
            if (searchInput) {
                searchInput.focus();
            }

            // Intersection Observer for animations
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };

            const observer = new IntersectionObserver(function(entries) {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                    }
                });
            }, observerOptions);

            // Apply animations to book cards
            document.querySelectorAll('.book-card').forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px)';
                card.style.transition = `opacity 0.6s ease ${index * 0.1}s, transform 0.6s ease ${index * 0.1}s`;
                observer.observe(card);
            });

            // Enhanced form submission with loading state
            const searchForm = document.querySelector('form');
            if (searchForm) {
                searchForm.addEventListener('submit', function() {
                    const submitBtn = this.querySelector('button[type="submit"]');
                    const originalText = submitBtn.innerHTML;
                    submitBtn.innerHTML = '<div class="loading"></div> Buscando...';
                    submitBtn.disabled = true;
                    
                    // Reset after 3 seconds if form doesn't submit
                    setTimeout(() => {
                        submitBtn.innerHTML = originalText;
                        submitBtn.disabled = false;
                    }, 3000);
                });
            }

            // Smooth scrolling for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    const target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        target.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });
                    }
                });
            });

            // Enhanced hover effects for cards
            document.querySelectorAll('.book-card, .info-card').forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-10px) scale(1.02)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0) scale(1)';
                });
            });

            // Parallax effect for hero section
            window.addEventListener('scroll', function() {
                const scrolled = window.pageYOffset;
                const hero = document.querySelector('.hero-section');
                if (hero) {
                    hero.style.transform = `translateY(${scrolled * 0.5}px)`;
                }
            });

            // Dynamic category pill interactions
            document.querySelectorAll('.category-pill').forEach(pill => {
                pill.addEventListener('click', function(e) {
                    // Add loading effect to category buttons
                    if (this.tagName === 'BUTTON') {
                        const originalText = this.textContent;
                        this.innerHTML = '<div class="loading"></div>';
                        this.disabled = true;
                        
                        setTimeout(() => {
                            this.textContent = originalText;
                            this.disabled = false;
                        }, 1000);
                    }
                });
            });

            // Search input enhancements
            if (searchInput) {
                let searchTimeout;
                searchInput.addEventListener('input', function() {
                    clearTimeout(searchTimeout);
                    const value = this.value;
                    
                    // Add visual feedback for typing
                    this.style.borderColor = value.length > 0 ? '#667eea' : '';
                    
                    // Auto-suggest simulation (placeholder for future enhancement)
                    searchTimeout = setTimeout(() => {
                        if (value.length > 2) {
                            // Could implement real-time search suggestions here
                            console.log('Searching for:', value);
                        }
                    }, 500);
                });
            }

            // Add ripple effect to buttons
            document.querySelectorAll('.btn').forEach(button => {
                button.addEventListener('click', function(e) {
                    const ripple = document.createElement('span');
                    const rect = this.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;
                    
                    ripple.style.cssText = `
                        position: absolute;
                        width: ${size}px;
                        height: ${size}px;
                        left: ${x}px;
                        top: ${y}px;
                        background: rgba(255, 255, 255, 0.4);
                        border-radius: 50%;
                        transform: scale(0);
                        animation: ripple 0.6s linear;
                        pointer-events: none;
                    `;
                    
                    this.style.position = 'relative';
                    this.style.overflow = 'hidden';
                    this.appendChild(ripple);
                    
                    setTimeout(() => ripple.remove(), 600);
                });
            });

            // Enhanced stats counter animation
            const statsObserver = new IntersectionObserver(function(entries) {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const statNumbers = entry.target.querySelectorAll('.stat-number');
                        statNumbers.forEach(stat => {
                            const text = stat.textContent;
                            const number = text.match(/\d+/);
                            if (number) {
                                animateCounter(stat, 0, parseInt(number[0]), 1500);
                            }
                        });
                        statsObserver.unobserve(entry.target);
                    }
                });
            });

            const statsBanner = document.querySelector('.stats-banner');
            if (statsBanner) {
                statsObserver.observe(statsBanner);
            }

            function animateCounter(element, start, end, duration) {
                const startTimestamp = performance.now();
                const originalText = element.textContent;
                const iconMatch = originalText.match(/<i[^>]*><\/i>/);
                const icon = iconMatch ? iconMatch[0] : '';
                
                function step(timestamp) {
                    const elapsed = timestamp - startTimestamp;
                    const progress = Math.min(elapsed / duration, 1);
                    const current = Math.floor(progress * (end - start) + start);
                    
                    // Preserve the icon and update only the number
                    const updatedText = originalText.replace(/\d+/, current);
                    element.innerHTML = updatedText;
                    
                    if (progress < 1) {
                        requestAnimationFrame(step);
                    }
                }
                
                requestAnimationFrame(step);
            }
        });

        // Add CSS for ripple animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }
            
            .fade-in-scale {
                animation: fadeInScale 0.8s ease-out;
            }
            
            @keyframes fadeInScale {
                from {
                    opacity: 0;
                    transform: scale(0.8);
                }
                to {
                    opacity: 1;
                    transform: scale(1);
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>