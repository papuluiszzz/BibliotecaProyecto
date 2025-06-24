<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Administrador - Sistema de Biblioteca ADSO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --warning-gradient: linear-gradient(135deg, #f8b500 0%, #ffc837 100%);
            --danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ff8e8e 100%);
            --info-gradient: linear-gradient(135deg, #74b9ff 0%, #0984e3 100%);
            --dark-gradient: linear-gradient(135deg, #2d3436 0%, #636e72 100%);
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

        /* Hero Section with 3D Effect */
        .hero-section {
            background: var(--primary-gradient);
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
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="a" cx="50%" cy="50%"><stop offset="0%" style="stop-color:rgba(255,255,255,0.15)"/><stop offset="100%" style="stop-color:rgba(255,255,255,0)"/></radialGradient></defs><circle cx="100" cy="100" r="80" fill="url(%23a)"/><circle cx="900" cy="200" r="120" fill="url(%23a)"/><circle cx="300" cy="700" r="100" fill="url(%23a)"/><circle cx="700" cy="800" r="90" fill="url(%23a)"/></svg>');
            opacity: 0.4;
            animation: float 20s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            33% { transform: translateY(-15px) rotate(120deg); }
            66% { transform: translateY(15px) rotate(240deg); }
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
            font-size: 1.25rem;
            font-weight: 300;
            opacity: 0.9;
        }

        /* Welcome Card */
        .welcome-card {
            background: var(--success-gradient);
            border-radius: var(--border-radius);
            padding: 2.5rem;
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
            animation: rotate 25s linear infinite;
        }

        @keyframes rotate {
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
            transform: translateY(-10px) rotateY(5deg);
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
            margin-bottom: 1rem;
        }

        .stats-change {
            font-size: 0.875rem;
            font-weight: 600;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
        }

        /* Quick Action Cards */
        .quick-action-card {
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

        .quick-action-card::before {
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

        .quick-action-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: var(--shadow-medium);
        }

        .quick-action-card:hover::before {
            transform: translateX(100%);
        }

        .action-icon {
            font-size: 4rem;
            margin-bottom: 1.5rem;
            filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.1));
        }

        .action-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .action-description {
            color: #636e72;
            margin-bottom: 1.5rem;
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

        .btn-success {
            background: var(--success-gradient);
            box-shadow: var(--shadow-light);
        }

        .btn-warning {
            background: var(--warning-gradient);
            box-shadow: var(--shadow-light);
        }

        .btn-info {
            background: var(--info-gradient);
            box-shadow: var(--shadow-light);
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

        .btn-outline-warning {
            border: 2px solid #f8b500;
            color: #f8b500;
            background: transparent;
        }

        .btn-outline-warning:hover {
            background: var(--warning-gradient);
            border-color: transparent;
            color: white;
            transform: translateY(-2px);
        }

        .btn-outline-info {
            border: 2px solid #74b9ff;
            color: #74b9ff;
            background: transparent;
        }

        .btn-outline-info:hover {
            background: var(--info-gradient);
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

        .card-header.bg-warning {
            background: var(--warning-gradient) !important;
        }

        .card-header.bg-info {
            background: var(--info-gradient) !important;
        }

        /* List Groups */
        .list-group-item {
            background: rgba(255, 255, 255, 0.5);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--border-radius-sm);
            margin-bottom: 0.5rem;
            padding: 1.25rem;
            transition: var(--transition);
        }

        .list-group-item:hover {
            background: rgba(255, 255, 255, 0.8);
            transform: translateX(5px);
            box-shadow: var(--shadow-light);
        }

        /* Alerts */
        .alert {
            border-radius: var(--border-radius-sm);
            border: none;
            padding: 1.25rem;
            margin-bottom: 1rem;
            backdrop-filter: blur(10px);
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
            
            .quick-action-card:hover {
                transform: translateY(-5px) scale(1.01);
            }
            
            .welcome-card {
                padding: 2rem;
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

        /* Pulse Animation for Important Elements */
        .pulse {
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }
    </style>
</head>
<body>
    <!-- Modern Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark modern-navbar">
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
                        <a class="nav-link active" href="${pageContext.request.contextPath}/admin-dashboard">
                            <i class="fas fa-tachometer-alt me-1"></i>Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/libros">
                            <i class="fas fa-book me-1"></i>Libros
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/usuarios">
                            <i class="fas fa-users me-1"></i>Usuarios
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/prestamos">
                            <i class="fas fa-exchange-alt me-1"></i>Préstamos
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-user-shield me-1"></i>${sessionScope.nombreUsuario}
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
        <div class="container hero-content">
            <div class="row align-items-center">
                <div class="col-md-8 fade-in-up">
                    <h1 class="hero-title">
                        <i class="fas fa-tachometer-alt me-3"></i>
                        Panel de Control
                    </h1>
                    <p class="hero-subtitle">
                        Bienvenido ${sessionScope.nombreUsuario}, gestione su biblioteca digital
                    </p>
                </div>
                <div class="col-md-4 text-center scale-in">
                    <i class="fas fa-user-shield" style="font-size: 8rem; opacity: 0.3;"></i>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- Welcome Card -->
        <div class="welcome-card fade-in-up">
            <div class="row align-items-center welcome-content">
                <div class="col-md-8">
                    <h4><i class="fas fa-chart-line me-2"></i>Estado del Sistema</h4>
                    <p class="mb-0 fs-5">
                        Sistema funcionando correctamente. Última actualización: 
                        <strong><span id="currentDate"></span></strong>
                    </p>
                </div>
                <div class="col-md-4 text-center">
                    <i class="fas fa-check-circle pulse" style="font-size: 4rem;"></i>
                </div>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="row mb-5 g-4">
            <div class="col-md-3">
                <div class="stats-card card text-center h-100" onclick="location.href='${pageContext.request.contextPath}/libros'">
                    <div class="card-body p-4">
                        <i class="fas fa-book stats-icon" style="color: #667eea;"></i>
                        <div class="stats-number">${totalUsuarios > 0 ? '25' : '3'}</div>
                        <div class="stats-label">Total Libros</div>
                        <div class="stats-change" style="background: rgba(76, 175, 80, 0.1); color: #4caf50;">
                            <i class="fas fa-arrow-up me-1"></i>+5 este mes
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card card text-center h-100" onclick="location.href='${pageContext.request.contextPath}/usuarios'">
                    <div class="card-body p-4">
                        <i class="fas fa-users stats-icon" style="color: #4facfe;"></i>
                        <div class="stats-number">${totalUsuarios}</div>
                        <div class="stats-label">Usuarios</div>
                        <div class="stats-change" style="background: rgba(33, 150, 243, 0.1); color: #2196f3;">
                            <i class="fas fa-user-plus me-1"></i>2 nuevos
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card card text-center h-100" onclick="location.href='${pageContext.request.contextPath}/prestamos'">
                    <div class="card-body p-4">
                        <i class="fas fa-exchange-alt stats-icon" style="color: #f8b500;"></i>
                        <div class="stats-number">12</div>
                        <div class="stats-label">Préstamos Activos</div>
                        <div class="stats-change" style="background: rgba(255, 193, 7, 0.1); color: #ffc107;">
                            <i class="fas fa-clock me-1"></i>3 por vencer
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card card text-center h-100" onclick="location.href='${pageContext.request.contextPath}/prestamos-vencidos'">
                    <div class="card-body p-4">
                        <i class="fas fa-exclamation-triangle stats-icon" style="color: #ff6b6b;"></i>
                        <div class="stats-number">2</div>
                        <div class="stats-label">Vencidos</div>
                        <div class="stats-change" style="background: rgba(244, 67, 54, 0.1); color: #f44336;">
                            <i class="fas fa-bell me-1"></i>Requiere atención
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions Section -->
        <h2 class="section-header fade-in-up">
            <i class="fas fa-bolt"></i>Acciones Rápidas
        </h2>
        
        <div class="row mb-5 g-4">
            <div class="col-md-3">
                <div class="quick-action-card card text-center h-100">
                    <div class="card-body p-4">
                        <div class="action-icon" style="color: #667eea;">
                            <i class="fas fa-plus-circle"></i>
                        </div>
                        <h5 class="action-title">Nuevo Libro</h5>
                        <p class="action-description">Agregar libro al catálogo</p>
                        <a href="${pageContext.request.contextPath}/libro-nuevo" class="btn btn-primary">
                            <i class="fas fa-plus me-2"></i>Crear
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="quick-action-card card text-center h-100">
                    <div class="card-body p-4">
                        <div class="action-icon" style="color: #4facfe;">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <h5 class="action-title">Nuevo Usuario</h5>
                        <p class="action-description">Registrar nuevo usuario</p>
                        <a href="${pageContext.request.contextPath}/usuario-nuevo" class="btn btn-success">
                            <i class="fas fa-user-plus me-2"></i>Crear
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="quick-action-card card text-center h-100">
                    <div class="card-body p-4">
                        <div class="action-icon" style="color: #f8b500;">
                            <i class="fas fa-handshake"></i>
                        </div>
                        <h5 class="action-title">Nuevo Préstamo</h5>
                        <p class="action-description">Registrar préstamo de libro</p>
                        <a href="${pageContext.request.contextPath}/prestamo-nuevo" class="btn btn-warning">
                            <i class="fas fa-handshake me-2"></i>Crear
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="quick-action-card card text-center h-100">
                    <div class="card-body p-4">
                        <div class="action-icon" style="color: #74b9ff;">
                            <i class="fas fa-file-excel"></i>
                        </div>
                        <h5 class="action-title">Reporte Excel</h5>
                        <p class="action-description">Generar reporte de inventario</p>
                        <a href="${pageContext.request.contextPath}/generar-excel" class="btn btn-info">
                            <i class="fas fa-download me-2"></i>Generar
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Information Panels -->
        <div class="row g-4">
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0">
                            <i class="fas fa-clock me-2"></i>Actividad Reciente
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="list-group list-group-flush">
                            <div class="list-group-item d-flex align-items-center">
                                <i class="fas fa-book me-3" style="color: #667eea; font-size: 1.5rem;"></i>
                                <div>
                                    <strong>Nuevo libro agregado</strong><br>
                                    <small class="text-muted">"Cien Años de Soledad" - Hace 2 horas</small>
                                </div>
                            </div>
                            <div class="list-group-item d-flex align-items-center">
                                <i class="fas fa-user-plus me-3" style="color: #4facfe; font-size: 1.5rem;"></i>
                                <div>
                                    <strong>Usuario registrado</strong><br>
                                    <small class="text-muted">Carlos Pérez - Hace 4 horas</small>
                                </div>
                            </div>
                            <div class="list-group-item d-flex align-items-center">
                                <i class="fas fa-handshake me-3" style="color: #f8b500; font-size: 1.5rem;"></i>
                                <div>
                                    <strong>Préstamo realizado</strong><br>
                                    <small class="text-muted">"El Principito" - Hace 6 horas</small>
                                </div>
                            </div>
                            <div class="list-group-item d-flex align-items-center">
                                <i class="fas fa-undo me-3" style="color: #74b9ff; font-size: 1.5rem;"></i>
                                <div>
                                    <strong>Libro devuelto</strong><br>
                                    <small class="text-muted">"Java Programming" - Ayer</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-center" style="background: rgba(255, 255, 255, 0.5); border-top: 1px solid rgba(255, 255, 255, 0.2);">
                        <a href="${pageContext.request.contextPath}/prestamos" class="btn btn-outline-primary">
                            <i class="fas fa-eye me-2"></i>Ver todos los préstamos
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header bg-warning text-white">
                        <h5 class="mb-0">
                            <i class="fas fa-exclamation-triangle me-2"></i>Alertas y Notificaciones
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-warning">
                            <i class="fas fa-clock me-2"></i>
                            <strong>2 préstamos vencidos</strong><br>
                            Requieren atención inmediata.
                            <a href="${pageContext.request.contextPath}/prestamos-vencidos" class="alert-link" style="text-decoration: underline;">Ver detalles</a>
                        </div>
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle me-2"></i>
                            <strong>3 préstamos por vencer</strong><br>
                            Vencen en los próximos 3 días.
                        </div>
                        <div class="alert alert-success">
                            <i class="fas fa-check-circle me-2"></i>
                            <strong>Sistema funcionando correctamente</strong><br>
                            Todas las funciones operativas.
                        </div>
                    </div>
                </div>

                <!-- Quick Navigation Panel -->
                <div class="card mt-4">
                    <div class="card-header bg-info text-white">
                        <h5 class="mb-0">
                            <i class="fas fa-compass me-2"></i>Navegación Rápida
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-6">
                                <a href="${pageContext.request.contextPath}/libros" class="btn btn-outline-primary w-100">
                                    <i class="fas fa-book me-2"></i>Libros
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="${pageContext.request.contextPath}/usuarios" class="btn btn-outline-success w-100">
                                    <i class="fas fa-users me-2"></i>Usuarios
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="${pageContext.request.contextPath}/prestamos" class="btn btn-outline-warning w-100">
                                    <i class="fas fa-exchange-alt me-2"></i>Préstamos
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="${pageContext.request.contextPath}/consulta-publica" class="btn btn-outline-info w-100">
                                    <i class="fas fa-eye me-2"></i>Vista Pública
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Additional Stats Section -->
        <div class="row mt-5 mb-4 g-4">
            <div class="col-12">
                <h2 class="section-header fade-in-up">
                    <i class="fas fa-chart-bar"></i>Estadísticas Detalladas
                </h2>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="card text-center h-100">
                    <div class="card-body p-4">
                        <i class="fas fa-calendar-week mb-3" style="font-size: 3rem; color: #667eea;"></i>
                        <h4>Esta Semana</h4>
                        <p class="text-muted mb-3">Actividad semanal</p>
                        <div class="row">
                            <div class="col-6">
                                <strong class="d-block" style="font-size: 1.5rem; color: #4facfe;">8</strong>
                                <small class="text-muted">Préstamos</small>
                            </div>
                            <div class="col-6">
                                <strong class="d-block" style="font-size: 1.5rem; color: #4facfe;">5</strong>
                                <small class="text-muted">Devoluciones</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="card text-center h-100">
                    <div class="card-body p-4">
                        <i class="fas fa-calendar-month mb-3" style="font-size: 3rem; color: #f8b500;"></i>
                        <h4>Este Mes</h4>
                        <p class="text-muted mb-3">Resumen mensual</p>
                        <div class="row">
                            <div class="col-6">
                                <strong class="d-block" style="font-size: 1.5rem; color: #f8b500;">32</strong>
                                <small class="text-muted">Préstamos</small>
                            </div>
                            <div class="col-6">
                                <strong class="d-block" style="font-size: 1.5rem; color: #f8b500;">28</strong>
                                <small class="text-muted">Devoluciones</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="card text-center h-100">
                    <div class="card-body p-4">
                        <i class="fas fa-trophy mb-3" style="font-size: 3rem; color: #ff6b6b;"></i>
                        <h4>Top Categoría</h4>
                        <p class="text-muted mb-3">Más solicitada</p>
                        <div class="text-center">
                            <strong class="d-block" style="font-size: 1.25rem; color: #ff6b6b;">Programación</strong>
                            <small class="text-muted">15 préstamos este mes</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Update current date and time
        function updateDateTime() {
            const now = new Date();
            const dateOptions = { 
                year: 'numeric', 
                month: 'long', 
                day: 'numeric',
                weekday: 'long'
            };
            const timeOptions = {
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            };
            
            const dateStr = now.toLocaleDateString('es-CO', dateOptions);
            const timeStr = now.toLocaleTimeString('es-CO', timeOptions);
            
            document.getElementById('currentDate').textContent = `${dateStr} - ${timeStr}`;
            document.title = `Admin Dashboard - ${timeStr}`;
        }
        
        // Update every second
        setInterval(updateDateTime, 1000);
        updateDateTime(); // Initial call

        // Enhanced entrance animations
        document.addEventListener('DOMContentLoaded', function() {
            // Animate stats cards
            const statsCards = document.querySelectorAll('.stats-card');
            statsCards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px) scale(0.9)';
                card.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
                
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0) scale(1)';
                }, index * 150);
            });

            // Animate quick action cards
            const actionCards = document.querySelectorAll('.quick-action-card');
            actionCards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px) rotateX(15deg)';
                card.style.transition = 'all 0.7s cubic-bezier(0.4, 0, 0.2, 1)';
                
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0) rotateX(0deg)';
                }, 600 + (index * 100));
            });

            // Animate other cards
            const otherCards = document.querySelectorAll('.card:not(.stats-card):not(.quick-action-card)');
            otherCards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                card.style.transition = 'all 0.5s ease-out';
                
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, 1000 + (index * 200));
            });

            // Add ripple effect to clickable cards
            document.querySelectorAll('.stats-card, .quick-action-card').forEach(card => {
                card.addEventListener('click', function(e) {
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
                        z-index: 1000;
                    `;
                    
                    this.style.position = 'relative';
                    this.style.overflow = 'hidden';
                    this.appendChild(ripple);
                    
                    setTimeout(() => ripple.remove(), 600);
                });
            });

            // Counter animation for stats
            const animateCounter = (element, start, end, duration) => {
                const startTimestamp = performance.now();
                
                const step = (timestamp) => {
                    const elapsed = timestamp - startTimestamp;
                    const progress = Math.min(elapsed / duration, 1);
                    const current = Math.floor(progress * (end - start) + start);
                    
                    element.textContent = current;
                    
                    if (progress < 1) {
                        requestAnimationFrame(step);
                    }
                };
                
                requestAnimationFrame(step);
            };

            // Start counter animations after cards are visible
            setTimeout(() => {
                document.querySelectorAll('.stats-number').forEach((counter, index) => {
                    const targetText = counter.textContent;
                    const target = parseInt(targetText) || 0;
                    counter.textContent = '0';
                    
                    setTimeout(() => {
                        animateCounter(counter, 0, target, 1500);
                    }, index * 200);
                });
            }, 800);

            // Parallax effect for hero section
            let ticking = false;
            
            function updateParallax() {
                const scrolled = window.pageYOffset;
                const heroSection = document.querySelector('.hero-section');
                
                if (heroSection) {
                    const speed = scrolled * 0.5;
                    heroSection.style.transform = `translateY(${speed}px)`;
                }
                
                ticking = false;
            }
            
            function requestTick() {
                if (!ticking) {
                    requestAnimationFrame(updateParallax);
                    ticking = true;
                }
            }
            
            window.addEventListener('scroll', requestTick);

            // Enhanced hover effects
            document.querySelectorAll('.btn').forEach(button => {
                button.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-2px) scale(1.05)';
                });
                
                button.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0) scale(1)';
                });
            });

            // Add loading states to action buttons
            document.querySelectorAll('.quick-action-card .btn').forEach(button => {
                button.addEventListener('click', function(e) {
                    if (!this.href) return;
                    
                    const originalText = this.innerHTML;
                    this.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Cargando...';
                    this.style.pointerEvents = 'none';
                    
                    // Reset after 2 seconds if still on page
                    setTimeout(() => {
                        this.innerHTML = originalText;
                        this.style.pointerEvents = 'auto';
                    }, 2000);
                });
            });
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
            
            .loading-spinner {
                display: inline-block;
                width: 16px;
                height: 16px;
                border: 2px solid rgba(255,255,255,.3);
                border-radius: 50%;
                border-top-color: #fff;
                animation: spin 1s ease-in-out infinite;
            }
            
            @keyframes spin {
                to { transform: rotate(360deg); }
            }
        `;
        document.head.appendChild(style);

        // Advanced notification system (placeholder for future enhancements)
        function showNotification(message, type = 'info', duration = 5000) {
            const notification = document.createElement('div');
            notification.className = `alert alert-${type} position-fixed`;
            notification.style.cssText = `
                top: 20px;
                right: 20px;
                z-index: 9999;
                min-width: 300px;
                box-shadow: var(--shadow-medium);
                transform: translateX(100%);
                transition: transform 0.3s ease;
            `;
            notification.innerHTML = `
                <i class="fas fa-info-circle me-2"></i>
                ${message}
                <button type="button" class="btn-close float-end" onclick="this.parentElement.remove()"></button>
            `;
            
            document.body.appendChild(notification);
            
            // Animate in
            setTimeout(() => {
                notification.style.transform = 'translateX(0)';
            }, 100);
            
            // Auto remove
            setTimeout(() => {
                notification.style.transform = 'translateX(100%)';
                setTimeout(() => notification.remove(), 300);
            }, duration);
        }

        // Example usage (can be triggered by server events)
        // showNotification('¡Nuevo usuario registrado!', 'success');
    </script>
</body>
</html>