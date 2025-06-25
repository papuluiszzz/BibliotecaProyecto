<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Dashboard - Sistema de Biblioteca ADSO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
   --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
   --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
   --warning-gradient: linear-gradient(135deg, #f8b500 0%, #ffc837 100%);
   --info-gradient: linear-gradient(135deg, #74b9ff 0%, #0984e3 100%);
   --danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ff8e8e 100%);
   --hero-gradient: linear-gradient(135deg, #28a745 0%, #20c997 100%);
   --welcome-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
   background: linear-gradient(135deg, #74b9ff 0%, #0984e3 30%, #a29bfe 70%, #6c5ce7 100%);
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
   background: var(--primary-gradient);
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
   background: var(--primary-gradient);
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
   background: var(--primary-gradient);
   color: white;
   transform: translateX(5px);
}

/* Hero Section */
.hero-section {
   background: var(--hero-gradient);
   padding: 4rem 0;
   margin-bottom: 3rem;
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
   background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="a" cx="50%" cy="50%"><stop offset="0%" style="stop-color:rgba(255,255,255,0.2)"/><stop offset="100%" style="stop-color:rgba(255,255,255,0)"/></radialGradient></defs><circle cx="200" cy="200" r="150" fill="url(%23a)"/><circle cx="800" cy="300" r="100" fill="url(%23a)"/><circle cx="400" cy="700" r="200" fill="url(%23a)"/><circle cx="700" cy="150" r="120" fill="url(%23a)"/></svg>');
   opacity: 0.4;
   animation: heroFloat 30s ease-in-out infinite;
}

@keyframes heroFloat {
   0%, 100% { transform: translateY(0px) rotate(0deg); }
   33% { transform: translateY(-20px) rotate(120deg); }
   66% { transform: translateY(20px) rotate(240deg); }
}

.hero-content {
   position: relative;
   z-index: 2;
   color: white;
}

.hero-title {
   font-size: 3.5rem;
   font-weight: 700;
   margin-bottom: 1.5rem;
   text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

.hero-subtitle {
   font-size: 1.4rem;
   font-weight: 300;
   opacity: 0.9;
}

.hero-icon {
   font-size: 8rem;
   opacity: 0.3;
   animation: floatIcon 6s ease-in-out infinite;
}

@keyframes floatIcon {
   0%, 100% { transform: translateY(0px); }
   50% { transform: translateY(-20px); }
}

/* Welcome Card */
.welcome-card {
   background: var(--welcome-gradient);
   border-radius: var(--border-radius);
   padding: 3rem;
   margin-bottom: 3rem;
   color: white;
   box-shadow: var(--shadow-medium);
   position: relative;
   overflow: hidden;
}

.welcome-card::before {
   content: '';
   position: absolute;
   top: -50%;
   right: -50%;
   width: 100%;
   height: 100%;
   background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
   animation: rotateWelcome 20s linear infinite;
}

@keyframes rotateWelcome {
   0% { transform: rotate(0deg); }
   100% { transform: rotate(360deg); }
}

.welcome-content {
   position: relative;
   z-index: 2;
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
   height: 100%;
}

.stats-card::before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   height: 4px;
   background: var(--primary-gradient);
   transform: scaleX(0);
   transition: transform 0.3s ease;
}

.stats-card:hover {
   transform: translateY(-10px) rotateY(5deg) scale(1.02);
   box-shadow: var(--shadow-heavy);
   background: rgba(255, 255, 255, 0.95);
}

.stats-card:hover::before {
   transform: scaleX(1);
}

.stats-icon {
   font-size: 4rem;
   margin-bottom: 1.5rem;
   filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.1));
   animation: statsIconPulse 3s ease-in-out infinite;
}

@keyframes statsIconPulse {
   0%, 100% { transform: scale(1); }
   50% { transform: scale(1.1); }
}

.stats-number {
   font-size: 3.5rem;
   font-weight: 700;
   margin-bottom: 0.5rem;
   background: var(--primary-gradient);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
   background-clip: text;
}

.stats-label {
   color: #636e72;
   font-weight: 500;
   margin-bottom: 1rem;
}

.stats-hint {
   font-size: 0.875rem;
   font-weight: 600;
   padding: 0.5rem 1rem;
   border-radius: 50px;
   display: inline-block;
}

/* Action Cards */
.action-card {
   background: rgba(255, 255, 255, 0.9);
   backdrop-filter: blur(20px);
   border: 1px solid rgba(255, 255, 255, 0.3);
   border-radius: var(--border-radius);
   box-shadow: var(--shadow-light);
   transition: var(--transition);
   height: 100%;
   position: relative;
   overflow: hidden;
}

.action-card::before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   height: 100%;
   background: linear-gradient(135deg, transparent 0%, rgba(255,255,255,0.1) 50%, transparent 100%);
   transform: translateX(-100%);
   transition: transform 0.6s ease;
}

.action-card:hover {
   transform: translateY(-8px) scale(1.03);
   box-shadow: var(--shadow-medium);
}

.action-card:hover::before {
   transform: translateX(100%);
}

.action-icon {
   font-size: 4rem;
   margin-bottom: 1.5rem;
   filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.1));
   animation: actionIconRotate 8s linear infinite;
}

@keyframes actionIconRotate {
   0% { transform: rotateY(0deg); }
   25% { transform: rotateY(180deg); }
   50% { transform: rotateY(180deg); }
   75% { transform: rotateY(360deg); }
   100% { transform: rotateY(360deg); }
}

.action-title {
   font-size: 1.25rem;
   font-weight: 600;
   margin-bottom: 1rem;
   color: #2d3436;
}

.action-description {
   color: #636e72;
   margin-bottom: 1.5rem;
   font-size: 0.95rem;
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

.btn-warning {
   background: var(--warning-gradient);
   box-shadow: var(--shadow-light);
}

.btn-warning:hover {
   transform: translateY(-3px);
   box-shadow: var(--shadow-medium);
}

.btn-info {
   background: var(--info-gradient);
   box-shadow: var(--shadow-light);
}

.btn-info:hover {
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

.card-header.bg-primary {
   background: var(--primary-gradient) !important;
}

.card-header.bg-success {
   background: var(--success-gradient) !important;
}

.card-header.bg-info {
   background: var(--info-gradient) !important;
}

.card-footer {
   border-top: 1px solid rgba(255, 255, 255, 0.2);
   border-radius: 0 0 var(--border-radius) var(--border-radius);
   padding: 1.5rem;
}

/* Book Preview */
.book-preview {
   max-height: 400px;
   overflow-y: auto;
   scrollbar-width: thin;
   scrollbar-color: rgba(102, 126, 234, 0.3) transparent;
}

.book-preview::-webkit-scrollbar {
   width: 6px;
}

.book-preview::-webkit-scrollbar-track {
   background: rgba(0, 0, 0, 0.05);
   border-radius: 10px;
}

.book-preview::-webkit-scrollbar-thumb {
   background: var(--primary-gradient);
   border-radius: 10px;
}

/* Book Items */
.book-item {
   border-radius: var(--border-radius-sm);
   margin-bottom: 1rem;
   padding: 1.5rem;
   background: rgba(255, 255, 255, 0.6);
   backdrop-filter: blur(10px);
   border: 1px solid rgba(255, 255, 255, 0.3);
   transition: var(--transition);
   position: relative;
   overflow: hidden;
}

.book-item::before {
   content: '';
   position: absolute;
   left: 0;
   top: 0;
   bottom: 0;
   width: 4px;
   background: var(--primary-gradient);
   transform: scaleY(0);
   transition: transform 0.3s ease;
}

.book-item:hover {
   background: rgba(255, 255, 255, 0.8);
   transform: translateX(10px);
   box-shadow: var(--shadow-light);
}

.book-item:hover::before {
   transform: scaleY(1);
}

.book-title {
   font-size: 1.1rem;
   font-weight: 600;
   margin-bottom: 0.5rem;
   color: #2d3436;
}

.book-author {
   color: #636e72;
   margin-bottom: 0.5rem;
   font-style: italic;
}

.book-meta {
   font-size: 0.875rem;
   color: #74b9ff;
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

.badge-disponible {
   background: var(--success-gradient);
   animation: pulseAvailable 2s infinite;
}

.badge-prestado {
   background: var(--warning-gradient);
   color: #2d3436;
}

.badge-vencido {
   background: var(--danger-gradient);
   animation: pulseOverdue 1.5s infinite;
}

@keyframes pulseAvailable {
   0%, 100% { transform: scale(1); }
   50% { transform: scale(1.05); }
}

@keyframes pulseOverdue {
   0%, 100% { 
       transform: scale(1);
       box-shadow: 0 0 0 0 rgba(255, 107, 107, 0.4);
   }
   50% { 
       transform: scale(1.1);
       box-shadow: 0 0 0 10px rgba(255, 107, 107, 0);
   }
}

/* Modern Alerts */
.alert {
   border-radius: var(--border-radius-sm);
   border: none;
   padding: 1.25rem 1.5rem;
   margin-bottom: 1rem;
   backdrop-filter: blur(10px);
   position: relative;
   overflow: hidden;
}

.alert::before {
   content: '';
   position: absolute;
   left: 0;
   top: 0;
   bottom: 0;
   width: 4px;
   background: currentColor;
   opacity: 0.6;
}

.alert-warning {
   background: rgba(248, 181, 0, 0.15);
   color: #f8b500;
   border: 1px solid rgba(248, 181, 0, 0.3);
}

.alert-info {
   background: rgba(116, 185, 255, 0.15);
   color: #74b9ff;
   border: 1px solid rgba(116, 185, 255, 0.3);
}

.alert-success {
   background: rgba(79, 172, 254, 0.15);
   color: #4facfe;
   border: 1px solid rgba(79, 172, 254, 0.3);
}

/* Section Headers */
.section-header {
   font-size: 1.5rem;
   font-weight: 600;
   margin-bottom: 2rem;
   color: #2d3436;
   display: flex;
   align-items: center;
}

.section-header i {
   margin-right: 0.75rem;
   color: #667eea;
}

/* Responsive Design */
@media (max-width: 768px) {
   .hero-title {
       font-size: 2.5rem;
   }
   
   .stats-card:hover {
       transform: translateY(-5px);
   }
   
   .action-card:hover {
       transform: translateY(-5px) scale(1.01);
   }
   
   .book-item:hover {
       transform: translateX(5px);
   }
   
   .action-icon {
       font-size: 3rem;
   }
   
   .stats-icon {
       font-size: 3rem;
   }
   
   .hero-icon {
       font-size: 5rem;
   }
}

/* Animations */
.fade-in-up {
   animation: fadeInUp 0.8s ease-out;
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

.scale-in {
   animation: scaleIn 0.6s ease-out;
}

@keyframes scaleIn {
   from {
       opacity: 0;
       transform: scale(0.9);
   }
   to {
       opacity: 1;
       transform: scale(1);
   }
}

/* Card Entrance Animations */
.stats-card, .action-card {
   opacity: 0;
   transform: translateY(30px);
   animation: cardEntrance 0.6s ease-out forwards;
}

.stats-card:nth-child(1) { animation-delay: 0.1s; }
.stats-card:nth-child(2) { animation-delay: 0.2s; }
.stats-card:nth-child(3) { animation-delay: 0.3s; }

.action-card:nth-child(1) { animation-delay: 0.4s; }
.action-card:nth-child(2) { animation-delay: 0.5s; }
.action-card:nth-child(3) { animation-delay: 0.6s; }
.action-card:nth-child(4) { animation-delay: 0.7s; }

@keyframes cardEntrance {
   to {
       opacity: 1;
       transform: translateY(0);
   }
}

/* Book Item Animations */
.book-item {
   opacity: 0;
   transform: translateX(-20px);
   animation: slideInLeft 0.5s ease-out forwards;
}

.book-item:nth-child(1) { animation-delay: 0.8s; }
.book-item:nth-child(2) { animation-delay: 0.9s; }
.book-item:nth-child(3) { animation-delay: 1.0s; }

@keyframes slideInLeft {
   to {
       opacity: 1;
       transform: translateX(0);
   }
}

/* Enhanced Hover Effects */
.stats-card:hover .stats-number {
   animation: numberGlow 0.5s ease-out;
}

@keyframes numberGl
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
                        <a class="nav-link active" href="${pageContext.request.contextPath}/user-dashboard">
                            <i class="fas fa-tachometer-alt me-1"></i>Mi Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/mis-prestamos">
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

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 class="display-5 fw-bold mb-3">
                        <i class="fas fa-user-circle me-3"></i>
                        ¡Bienvenido, ${sessionScope.nombreUsuario}!
                    </h1>
                    <p class="lead mb-0">
                        Gestiona tus préstamos y explora nuestro catálogo de libros
                    </p>
                </div>
                <div class="col-md-4 text-center">
                    <i class="fas fa-book-reader fa-5x opacity-25"></i>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- Tarjeta de bienvenida -->
        <div class="welcome-card">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h4><i class="fas fa-sparkles me-2"></i>¿Qué quieres hacer hoy?</h4>
                    <p class="mb-0">
                        Explora nuestro catálogo, revisa tus préstamos actuales o solicita nuevos libros.
                        <br><strong>Fecha actual:</strong> <span id="fechaActual"></span>
                    </p>
                </div>
                <div class="col-md-4 text-center">
                    <i class="fas fa-calendar-alt fa-3x"></i>
                </div>
            </div>
        </div>

        <!-- Estadísticas del usuario -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="stats-card card text-center" onclick="location.href='${pageContext.request.contextPath}/mis-prestamos'">
                    <div class="card-body">
                        <i class="fas fa-book-open fa-3x text-primary mb-3"></i>
                        <h3 class="card-title">${misPrestamosActivos > 0 ? misPrestamosActivos : '0'}</h3>
                        <p class="card-text text-muted">Préstamos Activos</p>
                        <small class="text-info">
                            <i class="fas fa-clock me-1"></i>Haz clic para ver detalles
                        </small>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stats-card card text-center" onclick="location.href='${pageContext.request.contextPath}/mis-prestamos'">
                    <div class="card-body">
                        <i class="fas fa-history fa-3x text-success mb-3"></i>
                        <h3 class="card-title">8</h3>
                        <p class="card-text text-muted">Libros Devueltos</p>
                        <small class="text-success">
                            <i class="fas fa-check me-1"></i>Historial completo
                        </small>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stats-card card text-center" onclick="location.href='${pageContext.request.contextPath}/libros-buscar'">
                    <div class="card-body">
                        <i class="fas fa-star fa-3x text-warning mb-3"></i>
                        <h3 class="card-title">${librosDisponibles > 0 ? librosDisponibles : '0'}</h3>
                        <p class="card-text text-muted">Libros Disponibles</p>
                        <small class="text-warning">
                            <i class="fas fa-plus me-1"></i>Disponibles para préstamo
                        </small>
                    </div>
                </div>
            </div>
        </div>

        <!-- Acciones rápidas -->
        <div class="row mb-4">
            <div class="col-md-12">
                <h4 class="mb-3">
                    <i class="fas fa-bolt me-2 text-warning"></i>
                    Acciones Rápidas
                </h4>
            </div>
            <div class="col-md-3">
                <div class="action-card card text-center">
                    <div class="card-body">
                        <div class="action-icon text-primary">
                            <i class="fas fa-search"></i>
                        </div>
                        <h5>Buscar Libros</h5>
                        <p class="card-text">Encuentra tu próximo libro favorito</p>
                        <a href="${pageContext.request.contextPath}/libros-buscar" class="btn btn-primary">
                            <i class="fas fa-search me-2"></i>Buscar
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="action-card card text-center">
                    <div class="card-body">
                        <div class="action-icon text-success">
                            <i class="fas fa-book-reader"></i>
                        </div>
                        <h5>Mis Préstamos</h5>
                        <p class="card-text">Revisa tus libros actuales</p>
                        <a href="${pageContext.request.contextPath}/mis-prestamos" class="btn btn-success">
                            <i class="fas fa-list me-2"></i>Ver Todos
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="action-card card text-center">
                    <div class="card-body">
                        <div class="action-icon text-warning">
                            <i class="fas fa-handshake"></i>
                        </div>
                        <h5>Solicitar Préstamo</h5>
                        <p class="card-text">Pide un libro prestado</p>
                        <a href="${pageContext.request.contextPath}/prestamo-nuevo" class="btn btn-warning">
                            <i class="fas fa-plus me-2"></i>Solicitar
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="action-card card text-center">
                    <div class="card-body">
                        <div class="action-icon text-info">
                            <i class="fas fa-user-edit"></i>
                        </div>
                        <h5>Mi Perfil</h5>
                        <p class="card-text">Actualiza tu información</p>
                        <a href="${pageContext.request.contextPath}/perfil" class="btn btn-info">
                            <i class="fas fa-edit me-2"></i>Editar
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Información del usuario -->
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0">
                            <i class="fas fa-clock me-2"></i>Mis Préstamos Activos
                        </h5>
                    </div>
                    <div class="card-body book-preview">
                        <!-- Ejemplo de préstamos activos -->
                        <div class="book-item">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h6 class="mb-1">Cien Años de Soledad</h6>
                                    <p class="mb-1 text-muted">Gabriel García Márquez</p>
                                    <small>Prestado: 10/06/2025 | Vence: 25/06/2025</small>
                                </div>
                                <span class="badge badge-prestado">
                                    <i class="fas fa-clock me-1"></i>Activo
                                </span>
                            </div>
                        </div>
                        <div class="book-item">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h6 class="mb-1">El Principito</h6>
                                    <p class="mb-1 text-muted">Antoine de Saint-Exupéry</p>
                                    <small>Prestado: 05/06/2025 | Vence: 20/06/2025</small>
                                </div>
                                <span class="badge badge-vencido">
                                    <i class="fas fa-exclamation-triangle me-1"></i>Por vencer
                                </span>
                            </div>
                        </div>
                        <div class="book-item">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h6 class="mb-1">Java: A Beginner's Guide</h6>
                                    <p class="mb-1 text-muted">Herbert Schildt</p>
                                    <small>Prestado: 15/06/2025 | Vence: 30/06/2025</small>
                                </div>
                                <span class="badge badge-prestado">
                                    <i class="fas fa-clock me-1"></i>Activo
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-center">
                        <a href="${pageContext.request.contextPath}/mis-prestamos" class="btn btn-outline-primary">
                            <i class="fas fa-eye me-2"></i>Ver todos mis préstamos
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-success text-white">
                        <h5 class="mb-0">
                            <i class="fas fa-star me-2"></i>Libros Recomendados
                        </h5>
                    </div>
                    <div class="card-body book-preview">
                        <!-- Ejemplo de libros recomendados -->
                        <div class="book-item">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h6 class="mb-1">Clean Code</h6>
                                    <p class="mb-1 text-muted">Robert C. Martin</p>
                                    <small>Categoría: Tecnología</small>
                                </div>
                                <span class="badge badge-disponible">
                                    <i class="fas fa-check me-1"></i>Disponible
                                </span>
                            </div>
                        </div>
                        <div class="book-item">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h6 class="mb-1">Rayuela</h6>
                                    <p class="mb-1 text-muted">Julio Cortázar</p>
                                    <small>Categoría: Literatura</small>
                                </div>
                                <span class="badge badge-disponible">
                                    <i class="fas fa-check me-1"></i>Disponible
                                </span>
                            </div>
                        </div>
                        <div class="book-item">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h6 class="mb-1">Algoritmos y Programación</h6>
                                    <p class="mb-1 text-muted">Varios Autores</p>
                                    <small>Categoría: Tecnología</small>
                                </div>
                                <span class="badge badge-disponible">
                                    <i class="fas fa-check me-1"></i>Disponible
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-center">
                        <a href="${pageContext.request.contextPath}/libros-buscar" class="btn btn-outline-success">
                            <i class="fas fa-search me-2"></i>Explorar catálogo completo
                        </a>
                    </div>
                </div>

                <!-- Panel de información -->
                <div class="card mt-3">
                    <div class="card-header bg-info text-white">
                        <h5 class="mb-0">
                            <i class="fas fa-info-circle me-2"></i>Información Importante
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-warning">
                            <i class="fas fa-bell me-2"></i>
                            <strong>Recordatorio:</strong> Revisa tus préstamos regularmente.
                        </div>
                        <div class="alert alert-info">
                            <i class="fas fa-clock me-2"></i>
                            <strong>Horarios:</strong> Lun-Vie: 8:00-18:00, Sáb: 9:00-14:00
                        </div>
                        <div class="alert alert-success">
                            <i class="fas fa-gift me-2"></i>
                            <strong>¡Nuevos libros!</strong> Se agregaron nuevos títulos al catálogo.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Mostrar fecha actual
        function actualizarFecha() {
            const ahora = new Date();
            const opciones = { 
                weekday: 'long', 
                year: 'numeric', 
                month: 'long', 
                day: 'numeric' 
            };
            const fechaFormateada = ahora.toLocaleDateString('es-CO', opciones);
            document.getElementById('fechaActual').textContent = fechaFormateada;
        }
        
        // Actualizar cada minuto
        actualizarFecha();
        setInterval(actualizarFecha, 60000);

        // Animación de entrada para las cards
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.stats-card, .action-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                card.style.transition = 'all 0.5s ease';
                
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100);
            });

            // Animación para book-items
            const bookItems = document.querySelectorAll('.book-item');
            bookItems.forEach((item, index) => {
                item.style.opacity = '0';
                item.style.transform = 'translateX(-20px)';
                item.style.transition = 'all 0.5s ease';
                
                setTimeout(() => {
                    item.style.opacity = '1';
                    item.style.transform = 'translateX(0)';
                }, 500 + (index * 100));
            });
        });

        // Hover effect para stats cards
        document.querySelectorAll('.stats-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.cursor = 'pointer';
            });
        });

        // Saludo dinámico basado en la hora
        document.addEventListener('DOMContentLoaded', function() {
            const hora = new Date().getHours();
            let saludo = '';
            
            if (hora < 12) {
                saludo = '🌅 ¡Buenos días!';
            } else if (hora < 18) {
                saludo = '☀️ ¡Buenas tardes!';
            } else {
                saludo = '🌙 ¡Buenas noches!';
            }
            
            // Agregar saludo si existe un elemento para ello
            const welcomeCard = document.querySelector('.welcome-card h4');
            if (welcomeCard) {
                welcomeCard.innerHTML = `<i class="fas fa-sparkles me-2"></i>${saludo} ¿Qué quieres hacer hoy?`;
            }
        });
    </script>
</body>
</html>