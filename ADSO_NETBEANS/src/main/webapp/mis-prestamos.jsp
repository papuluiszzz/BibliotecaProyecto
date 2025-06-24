<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Préstamos - Sistema de Biblioteca ADSO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
   --info-gradient: linear-gradient(135deg, #17a2b8 0%, #20c997 100%);
   --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
   --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
   --warning-gradient: linear-gradient(135deg, #f8b500 0%, #ffc837 100%);
   --danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ff8e8e 100%);
   --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
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
   background: linear-gradient(135deg, #a8edea 0%, #fed6e3 50%, #d299c2 100%);
   min-height: 100vh;
   line-height: 1.6;
}

/* Modern Navbar */
.modern-navbar {
   background: rgba(255, 255, 255, 0.95);
   backdrop-filter: blur(20px);
   border-bottom: 1px solid rgba(255, 255, 255, 0.2);
   box-shadow: var(--shadow-light);
   position: sticky;
   top: 0;
   z-index: 1000;
}

.navbar-brand {
   font-weight: 700;
   font-size: 1.5rem;
   background: var(--info-gradient);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
   background-clip: text;
}

.navbar-dark .navbar-nav .nav-link {
   color: #2d3436;
   font-weight: 500;
   padding: 0.75rem 1.5rem;
   border-radius: var(--border-radius-sm);
   transition: var(--transition);
   margin: 0 0.25rem;
}

.navbar-dark .navbar-nav .nav-link:hover,
.navbar-dark .navbar-nav .nav-link.active {
   background: var(--info-gradient);
   color: white;
   transform: translateY(-2px);
   box-shadow: var(--shadow-light);
}

.dropdown-menu {
   background: rgba(255, 255, 255, 0.95);
   backdrop-filter: blur(20px);
   border: 1px solid rgba(255, 255, 255, 0.2);
   border-radius: var(--border-radius-sm);
   box-shadow: var(--shadow-medium);
}

.dropdown-item {
   padding: 0.75rem 1.5rem;
   border-radius: var(--border-radius-sm);
   margin: 0.25rem;
   transition: var(--transition);
}

.dropdown-item:hover {
   background: var(--info-gradient);
   color: white;
   transform: translateX(5px);
}

/* Hero Header Section */
.content-header {
   background: var(--info-gradient);
   padding: 4rem 0;
   margin-bottom: 3rem;
   position: relative;
   overflow: hidden;
}

.content-header::before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   bottom: 0;
   background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="a" cx="50%" cy="50%"><stop offset="0%" style="stop-color:rgba(255,255,255,0.2)"/><stop offset="100%" style="stop-color:rgba(255,255,255,0)"/></radialGradient></defs><rect x="100" y="100" width="120" height="80" rx="20" fill="url(%23a)"/><rect x="700" y="150" width="150" height="100" rx="25" fill="url(%23a)"/><rect x="300" y="600" width="100" height="120" rx="15" fill="url(%23a)"/><rect x="600" y="700" width="130" height="90" rx="20" fill="url(%23a)"/></svg>');
   opacity: 0.3;
   animation: floatBooks 25s ease-in-out infinite;
}

@keyframes floatBooks {
   0%, 100% { transform: translateY(0px) rotateZ(0deg); }
   33% { transform: translateY(-20px) rotateZ(5deg); }
   66% { transform: translateY(20px) rotateZ(-5deg); }
}

.header-content {
   position: relative;
   z-index: 2;
   color: white;
}

.header-title {
   font-size: 3rem;
   font-weight: 700;
   margin-bottom: 1rem;
   text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

.header-subtitle {
   font-size: 1.25rem;
   font-weight: 300;
   opacity: 0.9;
}

/* Modern Buttons */
.btn {
   border-radius: var(--border-radius-sm);
   padding: 0.875rem 2rem;
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

.btn-light {
   background: rgba(255, 255, 255, 0.9);
   color: #2d3436;
   box-shadow: var(--shadow-light);
}

.btn-light:hover {
   background: white;
   transform: translateY(-3px);
   box-shadow: var(--shadow-medium);
}

.btn-primary {
   background: var(--primary-gradient);
   box-shadow: var(--shadow-light);
}

.btn-primary:hover {
   transform: translateY(-3px);
   box-shadow: var(--shadow-medium);
}

.btn-success {
   background: var(--success-gradient);
   box-shadow: var(--shadow-light);
}

.btn-success:hover {
   transform: translateY(-3px);
   box-shadow: var(--shadow-medium);
}

.btn-outline-primary {
   border: 2px solid #667eea;
   color: #667eea;
   background: transparent;
}

.btn-outline-primary:hover {
   background: var(--primary-gradient);
   border-color: transparent;
   color: white;
   transform: translateY(-2px);
}

.btn-outline-success {
   border: 2px solid #4facfe;
   color: #4facfe;
   background: transparent;
}

.btn-outline-success:hover {
   background: var(--success-gradient);
   border-color: transparent;
   color: white;
   transform: translateY(-2px);
}

/* Modern Stats Cards */
.stats-card {
   background: rgba(255, 255, 255, 0.9);
   backdrop-filter: blur(20px);
   border: 1px solid rgba(255, 255, 255, 0.3);
   border-radius: var(--border-radius);
   box-shadow: var(--shadow-light);
   transition: var(--transition);
   cursor: pointer;
   position: relative;
   overflow: hidden;
}

.stats-card::before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   height: 4px;
   background: var(--info-gradient);
   transform: scaleX(0);
   transition: transform 0.3s ease;
}

.stats-card:hover {
   transform: translateY(-10px) rotateY(3deg);
   box-shadow: var(--shadow-heavy);
   background: rgba(255, 255, 255, 0.95);
}

.stats-card:hover::before {
   transform: scaleX(1);
}

.stats-icon {
   font-size: 3.5rem;
   margin-bottom: 1.5rem;
   filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.1));
}

.stats-number {
   font-size: 3rem;
   font-weight: 700;
   margin-bottom: 0.5rem;
}

.stats-label {
   color: #636e72;
   font-weight: 500;
}

/* Modern Prestamo Cards */
.prestamo-card {
   background: rgba(255, 255, 255, 0.9);
   backdrop-filter: blur(20px);
   border: 1px solid rgba(255, 255, 255, 0.3);
   border-radius: var(--border-radius);
   box-shadow: var(--shadow-light);
   transition: var(--transition);
   margin-bottom: 2rem;
   position: relative;
   overflow: hidden;
}

.prestamo-card::before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   height: 4px;
   background: var(--info-gradient);
   transform: scaleX(0);
   transition: transform 0.3s ease;
}

.prestamo-card:hover {
   transform: translateY(-10px) scale(1.02);
   box-shadow: var(--shadow-heavy);
   background: rgba(255, 255, 255, 0.95);
}

.prestamo-card:hover::before {
   transform: scaleX(1);
}

.book-icon {
   font-size: 4rem;
   background: var(--info-gradient);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
   background-clip: text;
   margin-bottom: 1.5rem;
   filter: drop-shadow(0 4px 8px rgba(23, 162, 184, 0.3));
   animation: bookFloat 3s ease-in-out infinite;
}

@keyframes bookFloat {
   0%, 100% { transform: translateY(0px); }
   50% { transform: translateY(-10px); }
}

/* Modern Cards */
.card {
   background: rgba(255, 255, 255, 0.9);
   backdrop-filter: blur(20px);
   border: 1px solid rgba(255, 255, 255, 0.3);
   border-radius: var(--border-radius);
   box-shadow: var(--shadow-light);
   transition: var(--transition);
}

.card:hover {
   transform: translateY(-5px);
   box-shadow: var(--shadow-medium);
}

.card-header {
   border-radius: var(--border-radius) var(--border-radius) 0 0;
   border-bottom: 1px solid rgba(255, 255, 255, 0.2);
   padding: 1.5rem;
}

.card-header.bg-info {
   background: var(--info-gradient) !important;
}

.card-header.bg-success {
   background: var(--success-gradient) !important;
}

.card-footer {
   border-top: 1px solid rgba(255, 255, 255, 0.2);
   border-radius: 0 0 var(--border-radius) var(--border-radius);
   padding: 1.5rem;
}

/* Modern Badges */
.badge {
   border-radius: 50px;
   padding: 0.75rem 1.5rem;
   font-weight: 600;
   text-transform: uppercase;
   letter-spacing: 0.5px;
   font-size: 0.75rem;
   box-shadow: var(--shadow-light);
}

.badge-activo {
   background: var(--warning-gradient);
   animation: pulseActive 2s infinite;
}

.badge-devuelto {
   background: var(--success-gradient);
}

.badge-vencido {
   background: var(--danger-gradient);
   animation: pulseVencido 1.5s infinite;
}

@keyframes pulseActive {
   0%, 100% { transform: scale(1); }
   50% { transform: scale(1.05); }
}

@keyframes pulseVencido {
   0%, 100% { 
       transform: scale(1);
       box-shadow: 0 0 0 0 rgba(255, 107, 107, 0.4);
   }
   50% { 
       transform: scale(1.1);
       box-shadow: 0 0 0 10px rgba(255, 107, 107, 0);
   }
}

/* Text Vencido */
.text-vencido {
   color: #ff6b6b !important;
   font-weight: bold;
   animation: blinkText 1.5s infinite;
}

@keyframes blinkText {
   0%, 50% { opacity: 1; }
   51%, 100% { opacity: 0.7; }
}

/* Modern Alerts */
.alert {
   border-radius: var(--border-radius-sm);
   border: none;
   padding: 1.25rem 1.5rem;
   margin-bottom: 1.5rem;
   backdrop-filter: blur(10px);
   animation: slideInDown 0.5s ease-out;
}

@keyframes slideInDown {
   from {
       opacity: 0;
       transform: translateY(-20px);
   }
   to {
       opacity: 1;
       transform: translateY(0);
   }
}

.alert-success {
   background: rgba(79, 172, 254, 0.15);
   color: #4facfe;
   border: 1px solid rgba(79, 172, 254, 0.3);
}

.alert-danger {
   background: rgba(255, 107, 107, 0.15);
   color: #ff6b6b;
   border: 1px solid rgba(255, 107, 107, 0.3);
}

.alert-info {
   background: rgba(23, 162, 184, 0.15);
   color: #17a2b8;
   border: 1px solid rgba(23, 162, 184, 0.3);
}

/* Modern Modal */
.modal-content {
   background: rgba(255, 255, 255, 0.95);
   backdrop-filter: blur(20px);
   border: 1px solid rgba(255, 255, 255, 0.3);
   border-radius: var(--border-radius);
   box-shadow: var(--shadow-heavy);
}

.modal-header {
   border-bottom: 1px solid rgba(255, 255, 255, 0.2);
   padding: 1.5rem;
}

.modal-body {
   padding: 2rem;
}

.modal-footer {
   border-top: 1px solid rgba(255, 255, 255, 0.2);
   padding: 1.5rem;
}

/* Empty State */
.empty-state {
   text-align: center;
   padding: 4rem 2rem;
   color: #636e72;
   background: rgba(255, 255, 255, 0.9);
   backdrop-filter: blur(20px);
   border-radius: var(--border-radius);
   margin: 2rem 0;
}

.empty-state i {
   font-size: 6rem;
   margin-bottom: 2rem;
   background: var(--info-gradient);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
   background-clip: text;
   filter: drop-shadow(0 4px 8px rgba(23, 162, 184, 0.3));
}

/* Card Animations */
.prestamo-card {
   opacity: 0;
   transform: translateY(30px);
   animation: fadeInUp 0.6s ease-out forwards;
}

.prestamo-card:nth-child(1) { animation-delay: 0.1s; }
.prestamo-card:nth-child(2) { animation-delay: 0.2s; }
.prestamo-card:nth-child(3) { animation-delay: 0.3s; }
.prestamo-card:nth-child(4) { animation-delay: 0.4s; }
.prestamo-card:nth-child(5) { animation-delay: 0.5s; }
.prestamo-card:nth-child(6) { animation-delay: 0.6s; }

@keyframes fadeInUp {
   to {
       opacity: 1;
       transform: translateY(0);
   }
}

/* Hover Effects for Book Icons */
.book-icon:hover {
   transform: scale(1.2) rotateY(180deg);
   transition: var(--transition);
}

/* Card Title Hover */
.card-title {
   transition: var(--transition);
}

.prestamo-card:hover .card-title {
   color: #17a2b8;
   transform: scale(1.05);
}

/* Button Grid Enhancements */
.d-grid .btn {
   margin-bottom: 0.5rem;
}

.d-grid .btn:last-child {
   margin-bottom: 0;
}

/* Info Cards with Gradient Borders */
.card-header.bg-info {
   position: relative;
}

.card-header.bg-info::before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   bottom: 0;
   background: var(--info-gradient);
   border-radius: var(--border-radius) var(--border-radius) 0 0;
}

.card-header.bg-success::before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   bottom: 0;
   background: var(--success-gradient);
   border-radius: var(--border-radius) var(--border-radius) 0 0;
}

/* Responsive Design */
@media (max-width: 768px) {
   .header-title {
       font-size: 2rem;
   }
   
   .prestamo-card:hover {
       transform: translateY(-5px) scale(1.01);
   }
   
   .book-icon {
       font-size: 3rem;
   }
   
   .stats-card:hover {
       transform: translateY(-5px);
   }
   
   .btn-group {
       flex-direction: column;
       gap: 0.5rem;
   }
}

/* Additional Enhancements */
.prestamo-card .card-body {
   position: relative;
   z-index: 2;
}

/* Tooltip Enhancements */
[title] {
   cursor: help;
}

/* Loading States */
.btn.loading {
   pointer-events: none;
   position: relative;
}

.btn.loading::after {
   content: '';
   position: absolute;
   width: 16px;
   height: 16px;
   border: 2px solid rgba(255,255,255,.3);
   border-radius: 50%;
   border-top-color: #fff;
   animation: spin 1s ease-in-out infinite;
   right: 1rem;
   top: 50%;
   transform: translateY(-50%);
}

@keyframes spin {
   to { transform: translateY(-50%) rotate(360deg); }
}

/* Enhanced Card Shadows */
.prestamo-card:hover {
   box-shadow: 
       0 20px 40px rgba(23, 162, 184, 0.2),
       0 10px 20px rgba(0, 0, 0, 0.1),
       inset 0 0 0 1px rgba(255, 255, 255, 0.3);
}

/* Gradient Text Effects */
.card-title {
   background: linear-gradient(45deg, #2d3436, #636e72);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
   background-clip: text;
}

.prestamo-card:hover .card-title {
   background: var(--info-gradient);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
   background-clip: text;
}
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-book-open me-2"></i>
                Sistema de Biblioteca ADSO
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/user-dashboard">
                            <i class="fas fa-tachometer-alt me-1"></i>Mi Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/mis-prestamos">
                            <i class="fas fa-book-reader me-1"></i>Mis Préstamos
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/libros-buscar">
                            <i class="fas fa-search me-1"></i>Buscar Libros
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/consulta-publica">
                            <i class="fas fa-globe me-1"></i>Catálogo Público
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-user me-1"></i>${sessionScope.nombreUsuario}
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/perfil">
                                <i class="fas fa-user-edit me-2"></i>Mi Perfil
                            </a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
                                <i class="fas fa-sign-out-alt me-2"></i>Cerrar Sesión
                            </a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header -->
    <div class="content-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 class="mb-0">
                        <i class="fas fa-book-reader me-3"></i>Mis Préstamos
                    </h1>
                    <p class="mb-0 mt-2">Revisa el estado de tus libros prestados</p>
                </div>
                <div class="col-md-4 text-md-end">
                    <a href="${pageContext.request.contextPath}/prestamo-nuevo" class="btn btn-light btn-lg">
                        <i class="fas fa-plus me-2"></i>Solicitar Préstamo
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- Estadísticas del usuario -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card stats-card text-center">
                    <div class="card-body">
                        <i class="fas fa-exchange-alt fa-2x text-primary mb-3"></i>
                        <h3 class="card-title">${prestamos.size()}</h3>
                        <p class="card-text text-muted">Total Préstamos</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card stats-card text-center">
                    <div class="card-body">
                        <i class="fas fa-clock fa-2x text-warning mb-3"></i>
                        <h3 class="card-title">
                            <c:set var="activos" value="0"/>
                            <c:forEach var="prestamo" items="${prestamos}">
                                <c:if test="${not prestamo.devuelto}">
                                    <c:set var="activos" value="${activos + 1}"/>
                                </c:if>
                            </c:forEach>
                            ${activos}
                        </h3>
                        <p class="card-text text-muted">Activos</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card stats-card text-center">
                    <div class="card-body">
                        <i class="fas fa-check-circle fa-2x text-success mb-3"></i>
                        <h3 class="card-title">
                            <c:set var="devueltos" value="0"/>
                            <c:forEach var="prestamo" items="${prestamos}">
                                <c:if test="${prestamo.devuelto}">
                                    <c:set var="devueltos" value="${devueltos + 1}"/>
                                </c:if>
                            </c:forEach>
                            ${devueltos}
                        </h3>
                        <p class="card-text text-muted">Devueltos</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Mensajes -->
        <c:if test="${not empty mensaje}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fas fa-check-circle me-2"></i>
                ${mensaje}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fas fa-exclamation-triangle me-2"></i>
                ${error}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <!-- Lista de préstamos en formato de cards -->
        <div class="row">
            <c:forEach var="prestamo" items="${prestamos}">
                <div class="col-md-6 col-lg-4">
                    <div class="prestamo-card card h-100">
                        <div class="card-body text-center">
                            <div class="book-icon">
                                <i class="fas fa-book"></i>
                            </div>
                            <h5 class="card-title">${prestamo.tituloLibro}</h5>
                            <p class="card-text">
                                <strong>Autor:</strong> ${prestamo.autorLibro}<br>
                                <strong>ID Préstamo:</strong> #${prestamo.id}
                            </p>
                            <div class="mb-3">
                                <strong>Fecha Préstamo:</strong><br>
                                <fmt:formatDate value="${prestamo.fechaPrestamo}" pattern="dd/MM/yyyy"/>
                            </div>
                            <div class="mb-3">
                                <strong>Fecha Devolución:</strong><br>
                                <c:choose>
                                    <c:when test="${prestamo.devuelto}">
                                        <fmt:formatDate value="${prestamo.fechaDevolucion}" pattern="dd/MM/yyyy"/>
                                    </c:when>
                                    <c:otherwise>
                                        <jsp:useBean id="hoy" class="java.util.Date"/>
                                        <c:choose>
                                            <c:when test="${prestamo.fechaDevolucion.before(hoy)}">
                                                <span class="text-vencido">
                                                    <fmt:formatDate value="${prestamo.fechaDevolucion}" pattern="dd/MM/yyyy"/>
                                                    <br><small>¡VENCIDO!</small>
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatDate value="${prestamo.fechaDevolucion}" pattern="dd/MM/yyyy"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="mb-3">
                                <c:choose>
                                    <c:when test="${prestamo.devuelto}">
                                        <span class="badge badge-devuelto fs-6">
                                            <i class="fas fa-check me-1"></i>Devuelto
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <jsp:useBean id="hoy2" class="java.util.Date"/>
                                        <c:choose>
                                            <c:when test="${prestamo.fechaDevolucion.before(hoy2)}">
                                                <span class="badge badge-vencido fs-6">
                                                    <i class="fas fa-exclamation-triangle me-1"></i>Vencido
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-activo fs-6">
                                                    <i class="fas fa-clock me-1"></i>Activo
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="card-footer bg-transparent">
                            <div class="d-grid gap-2">
                                <a href="${pageContext.request.contextPath}/generar-pdf?id=${prestamo.id}" 
                                   class="btn btn-outline-primary" target="_blank">
                                    <i class="fas fa-file-pdf me-2"></i>Generar Comprobante
                                </a>
                                <c:if test="${not prestamo.devuelto}">
                                    <button type="button" 
                                            class="btn btn-outline-success" 
                                            onclick="confirmarDevolucion(${prestamo.id}, '${prestamo.tituloLibro}')">
                                        <i class="fas fa-undo me-2"></i>Marcar como Devuelto
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Mensaje cuando no hay préstamos -->
        <c:if test="${empty prestamos}">
            <div class="text-center py-5">
                <i class="fas fa-book-reader fa-4x text-muted mb-4"></i>
                <h4 class="text-muted">No tienes préstamos registrados</h4>
                <p class="text-muted">
                    Explora nuestro catálogo y solicita tu primer libro
                </p>
                <div class="d-flex gap-3 justify-content-center">
                    <a href="${pageContext.request.contextPath}/libros-buscar" 
                       class="btn btn-primary">
                        <i class="fas fa-search me-2"></i>Buscar Libros
                    </a>
                    <a href="${pageContext.request.contextPath}/consulta-publica" 
                       class="btn btn-outline-primary">
                        <i class="fas fa-eye me-2"></i>Ver Catálogo Público
                    </a>
                </div>
            </div>
        </c:if>

        <!-- Información adicional -->
        <c:if test="${not empty prestamos}">
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-info text-white">
                            <h5 class="mb-0">
                                <i class="fas fa-info-circle me-2"></i>Información Importante
                            </h5>
                        </div>
                        <div class="card-body">
                            <p><i class="fas fa-clock me-2 text-primary"></i><strong>Tiempo de préstamo:</strong> 15 días para libros generales</p>
                            <p><i class="fas fa-calendar-alt me-2 text-success"></i><strong>Renovaciones:</strong> Disponibles si no hay reservas</p>
                            <p><i class="fas fa-exclamation-triangle me-2 text-warning"></i><strong>Multas:</strong> $1,000 por día de retraso</p>
                            <p class="mb-0"><i class="fas fa-phone me-2 text-info"></i><strong>Contacto:</strong> biblioteca@adso.edu.co</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-success text-white">
                            <h5 class="mb-0">
                                <i class="fas fa-lightbulb me-2"></i>Consejos
                            </h5>
                        </div>
                        <div class="card-body">
                            <p><i class="fas fa-bookmark me-2 text-primary"></i>Marca tus libros favoritos para encontrarlos fácilmente</p>
                            <p><i class="fas fa-bell me-2 text-warning"></i>Revisa regularmente las fechas de vencimiento</p>
                            <p><i class="fas fa-star me-2 text-success"></i>Explora diferentes categorías para descubrir nuevos temas</p>
                            <p class="mb-0"><i class="fas fa-heart me-2 text-danger"></i>Cuida los libros para que otros también puedan disfrutarlos</p>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>

    <!-- Modal de confirmación de devolución -->
    <div class="modal fade" id="devolucionModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        <i class="fas fa-undo text-success me-2"></i>
                        Confirmar Devolución
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>¿Confirma que ha devuelto el libro <strong id="libroDevolucion"></strong>?</p>
                    <p class="text-info">
                        <i class="fas fa-info-circle me-2"></i>
                        Asegúrese de haber entregado físicamente el libro en la biblioteca.
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="fas fa-times me-2"></i>Cancelar
                    </button>
                    <a id="devolucionLink" href="#" class="btn btn-success">
                        <i class="fas fa-undo me-2"></i>Confirmar Devolución
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Función para confirmar devolución
        function confirmarDevolucion(id, titulo) {
            document.getElementById('libroDevolucion').textContent = titulo;
            document.getElementById('devolucionLink').href = 
                '${pageContext.request.contextPath}/prestamo-devolver?id=' + id;
            
            new bootstrap.Modal(document.getElementById('devolucionModal')).show();
        }

        // Auto-ocultar alertas después de 5 segundos
        document.addEventListener('DOMContentLoaded', function() {
            setTimeout(function() {
                const alerts = document.querySelectorAll('.alert-dismissible');
                alerts.forEach(function(alert) {
                    const bsAlert = new bootstrap.Alert(alert);
                    bsAlert.close();
                });
            }, 5000);

            // Animación de entrada para las cards
            const cards = document.querySelectorAll('.prestamo-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                card.style.transition = 'all 0.5s ease';
                
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100);
            });
        });

        // Calcular días restantes para vencimiento
        function calcularDiasRestantes() {
            const elementos = document.querySelectorAll('[data-fecha-vencimiento]');
            elementos.forEach(elemento => {
                const fechaVencimiento = new Date(elemento.getAttribute('data-fecha-vencimiento'));
                const hoy = new Date();
                const diferencia = Math.ceil((fechaVencimiento - hoy) / (1000 * 60 * 60 * 24));
                
                if (diferencia > 0) {
                    elemento.innerHTML += `<br><small class="text-info">(${diferencia} días restantes)</small>`;
                } else if (diferencia === 0) {
                    elemento.innerHTML += `<br><small class="text-warning">(Vence hoy)</small>`;
                }
            });
        }

        // Ejecutar al cargar la página
        document.addEventListener('DOMContentLoaded', calcularDiasRestantes);
    </script>
</body>
</html>