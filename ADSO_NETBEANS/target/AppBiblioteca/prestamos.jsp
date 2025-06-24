<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Préstamos - Sistema de Biblioteca ADSO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css" rel="stylesheet">
   <style>
   :root {
   --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
   --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
   --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
   --warning-gradient: linear-gradient(135deg, #f8b500 0%, #ffc837 100%);
   --danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ff8e8e 100%);
   --info-gradient: linear-gradient(135deg, #74b9ff 0%, #0984e3 100%);
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

/* Hero Header Section */
.content-header {
   background: var(--success-gradient);
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
   background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="a" cx="50%" cy="50%"><stop offset="0%" style="stop-color:rgba(255,255,255,0.15)"/><stop offset="100%" style="stop-color:rgba(255,255,255,0)"/></radialGradient></defs><circle cx="150" cy="150" r="100" fill="url(%23a)"/><circle cx="850" cy="250" r="120" fill="url(%23a)"/><circle cx="300" cy="750" r="90" fill="url(%23a)"/><circle cx="750" cy="600" r="110" fill="url(%23a)"/></svg>');
   opacity: 0.4;
   animation: float 25s ease-in-out infinite;
}

@keyframes float {
   0%, 100% { transform: translateY(0px) rotate(0deg); }
   33% { transform: translateY(-15px) rotate(120deg); }
   66% { transform: translateY(15px) rotate(240deg); }
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

.btn-warning {
   background: var(--warning-gradient);
   box-shadow: var(--shadow-light);
}

.btn-warning:hover {
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

.btn-secondary {
   background: #6c757d;
   box-shadow: var(--shadow-light);
}

.btn-secondary:hover {
   transform: translateY(-3px);
   box-shadow: var(--shadow-medium);
}

.btn-danger {
   background: var(--danger-gradient);
   box-shadow: var(--shadow-light);
}

.btn-danger:hover {
   transform: translateY(-3px);
   box-shadow: var(--shadow-medium);
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

.card-header.bg-success {
   background: var(--success-gradient) !important;
}

/* Modern Table */
.table-responsive {
   border-radius: var(--border-radius-sm);
   overflow: hidden;
   box-shadow: var(--shadow-light);
}

.table {
   background: rgba(255, 255, 255, 0.95);
   backdrop-filter: blur(10px);
}

.table-light th {
   background: rgba(102, 126, 234, 0.1);
   color: #2d3436;
   font-weight: 600;
   border: none;
   padding: 1.25rem;
}

.table tbody tr {
   transition: var(--transition);
}

.table tbody tr:hover {
   background: rgba(102, 126, 234, 0.05);
   transform: scale(1.01);
}

.table tbody td {
   padding: 1.25rem;
   border: none;
   border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

/* Modern Badges */
.badge {
   border-radius: 50px;
   padding: 0.75rem 1.5rem;
   font-weight: 600;
   text-transform: uppercase;
   letter-spacing: 0.5px;
   font-size: 0.75rem;
}

.badge-activo {
   background: var(--warning-gradient);
   box-shadow: 0 4px 15px rgba(248, 181, 0, 0.4);
}

.badge-devuelto {
   background: var(--success-gradient);
   box-shadow: 0 4px 15px rgba(79, 172, 254, 0.4);
}

.badge-vencido {
   background: var(--danger-gradient);
   box-shadow: 0 4px 15px rgba(255, 107, 107, 0.4);
   animation: pulse 2s infinite;
}

@keyframes pulse {
   0%, 100% { transform: scale(1); }
   50% { transform: scale(1.05); }
}

.text-vencido {
   color: #ff6b6b !important;
   font-weight: bold;
   animation: blink 1.5s infinite;
}

@keyframes blink {
   0%, 50% { opacity: 1; }
   51%, 100% { opacity: 0.7; }
}

/* Action Buttons */
.btn-action {
   margin: 0 0.25rem;
   padding: 0.5rem;
   border-radius: 50%;
   font-size: 0.875rem;
   width: 40px;
   height: 40px;
   display: inline-flex;
   align-items: center;
   justify-content: center;
   transition: var(--transition);
}

.btn-action:hover {
   transform: translateY(-2px) scale(1.1);
   box-shadow: var(--shadow-light);
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
}

.btn-outline-danger {
   border: 2px solid #ff6b6b;
   color: #ff6b6b;
   background: transparent;
}

.btn-outline-danger:hover {
   background: var(--danger-gradient);
   border-color: transparent;
   color: white;
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

/* Modern Modals */
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
}

.empty-state i {
   font-size: 5rem;
   margin-bottom: 2rem;
   opacity: 0.3;
}

/* DataTables Customization */
.dataTables_wrapper {
   padding: 1.5rem;
}

.dataTables_filter input {
   border-radius: var(--border-radius-sm);
   border: 2px solid rgba(0, 0, 0, 0.1);
   padding: 0.75rem 1rem;
   transition: var(--transition);
}

.dataTables_filter input:focus {
   border-color: #667eea;
   box-shadow: 0 0 0 0.25rem rgba(102, 126, 234, 0.15);
}

.dataTables_length select {
   border-radius: var(--border-radius-sm);
   border: 2px solid rgba(0, 0, 0, 0.1);
   padding: 0.5rem;
}

.page-link {
   border-radius: var(--border-radius-sm);
   margin: 0 0.25rem;
   border: none;
   padding: 0.75rem 1rem;
   color: #667eea;
   transition: var(--transition);
}

.page-link:hover {
   background: var(--primary-gradient);
   color: white;
   transform: translateY(-2px);
}

.page-item.active .page-link {
   background: var(--primary-gradient);
   border-color: transparent;
}

/* Responsive Design */
@media (max-width: 768px) {
   .header-title {
       font-size: 2rem;
   }
   
   .stats-card:hover {
       transform: translateY(-5px);
   }
   
   .btn-group {
       flex-direction: column;
       gap: 0.5rem;
   }
   
   .table-responsive {
       font-size: 0.875rem;
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

@keyframes ripple {
   to {
       transform: scale(4);
       opacity: 0;
   }
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
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin-dashboard">
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
                        <a class="nav-link active" href="${pageContext.request.contextPath}/prestamos">
                            <i class="fas fa-exchange-alt me-1"></i>Préstamos
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
                <div class="col-md-6">
                    <h1 class="mb-0">
                        <i class="fas fa-exchange-alt me-3"></i>Gestión de Préstamos
                    </h1>
                    <p class="mb-0 mt-2">Administre los préstamos y devoluciones de libros</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <div class="btn-group">
                        <a href="${pageContext.request.contextPath}/prestamo-nuevo" class="btn btn-light btn-lg">
                            <i class="fas fa-plus me-2"></i>Nuevo Préstamo
                        </a>
                        <a href="${pageContext.request.contextPath}/prestamos-vencidos" class="btn btn-warning btn-lg">
                            <i class="fas fa-exclamation-triangle me-2"></i>Vencidos
                        </a>
                        <a href="${pageContext.request.contextPath}/generar-excel" class="btn btn-success btn-lg">
                            <i class="fas fa-file-excel me-2"></i>Excel
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- Estadísticas -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card stats-card text-center">
                    <div class="card-body">
                        <i class="fas fa-exchange-alt fa-2x text-primary mb-3"></i>
                        <h3 class="card-title">${totalPrestamos}</h3>
                        <p class="card-text text-muted">Total Préstamos</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card stats-card text-center">
                    <div class="card-body">
                        <i class="fas fa-clock fa-2x text-warning mb-3"></i>
                        <h3 class="card-title">${prestamosActivos}</h3>
                        <p class="card-text text-muted">Activos</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card stats-card text-center">
                    <div class="card-body">
                        <i class="fas fa-check-circle fa-2x text-success mb-3"></i>
                        <h3 class="card-title">${prestamosDevueltos}</h3>
                        <p class="card-text text-muted">Devueltos</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card stats-card text-center">
                    <div class="card-body">
                        <i class="fas fa-exclamation-triangle fa-2x text-danger mb-3"></i>
                        <h3 class="card-title">${prestamosVencidos}</h3>
                        <p class="card-text text-muted">Vencidos</p>
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

        <!-- Tabla de préstamos -->
        <div class="card">
            <div class="card-header bg-success text-white">
                <h5 class="mb-0">
                    <i class="fas fa-list me-2"></i>Lista de Préstamos
                    <span class="badge bg-light text-dark ms-2">${prestamos.size()} registros</span>
                </h5>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0" id="prestamosTable">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Usuario</th>
                                <th>Libro</th>
                                <th>Autor</th>
                                <th>Fecha Préstamo</th>
                                <th>Fecha Devolución</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="prestamo" items="${prestamos}">
                                <tr>
                                    <td><strong>#${prestamo.id}</strong></td>
                                    <td>
                                        <i class="fas fa-user me-2 text-muted"></i>
                                        ${prestamo.nombreUsuario}
                                    </td>
                                    <td>
                                        <strong>${prestamo.tituloLibro}</strong>
                                    </td>
                                    <td>${prestamo.autorLibro}</td>
                                    <td>
                                        <fmt:formatDate value="${prestamo.fechaPrestamo}" pattern="dd/MM/yyyy"/>
                                    </td>
                                    <td>
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
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${prestamo.devuelto}">
                                                <span class="badge badge-devuelto">
                                                    <i class="fas fa-check me-1"></i>Devuelto
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <jsp:useBean id="hoy2" class="java.util.Date"/>
                                                <c:choose>
                                                    <c:when test="${prestamo.fechaDevolucion.before(hoy2)}">
                                                        <span class="badge badge-vencido">
                                                            <i class="fas fa-exclamation-triangle me-1"></i>Vencido
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-activo">
                                                            <i class="fas fa-clock me-1"></i>Activo
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <c:if test="${not prestamo.devuelto}">
                                                <button type="button" 
                                                        class="btn btn-sm btn-outline-success btn-action" 
                                                        onclick="confirmarDevolucion(${prestamo.id}, '${prestamo.tituloLibro}')"
                                                        title="Marcar como devuelto">
                                                    <i class="fas fa-undo"></i>
                                                </button>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/generar-pdf?id=${prestamo.id}" 
                                               class="btn btn-sm btn-outline-primary btn-action" 
                                               title="Generar comprobante PDF" target="_blank">
                                                <i class="fas fa-file-pdf"></i>
                                            </a>
                                            <button type="button" 
                                                    class="btn btn-sm btn-outline-danger btn-action" 
                                                    onclick="confirmarEliminacion(${prestamo.id}, '${prestamo.tituloLibro}')"
                                                    title="Eliminar préstamo">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <c:if test="${empty prestamos}">
            <div class="text-center mt-4">
                <i class="fas fa-exchange-alt fa-3x text-muted mb-3"></i>
                <h4 class="text-muted">No hay préstamos registrados</h4>
                <p class="text-muted">Comience registrando el primer préstamo</p>
                <a href="${pageContext.request.contextPath}/prestamo-nuevo" class="btn btn-success">
                    <i class="fas fa-plus me-2"></i>Registrar Primer Préstamo
                </a>
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
                    <p>¿Confirma la devolución del libro <strong id="libroDevolucion"></strong>?</p>
                    <p class="text-info">
                        <i class="fas fa-info-circle me-2"></i>
                        El libro quedará disponible para nuevos préstamos.
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

    <!-- Modal de confirmación de eliminación -->
    <div class="modal fade" id="confirmModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        <i class="fas fa-exclamation-triangle text-warning me-2"></i>
                        Confirmar Eliminación
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>¿Está seguro de que desea eliminar el préstamo del libro <strong id="libroTitulo"></strong>?</p>
                    <p class="text-danger">
                        <i class="fas fa-warning me-2"></i>
                        Esta acción no se puede deshacer.
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="fas fa-times me-2"></i>Cancelar
                    </button>
                    <a id="eliminarLink" href="#" class="btn btn-danger">
                        <i class="fas fa-trash me-2"></i>Eliminar
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>

    <script>
        // Inicializar DataTable
        $(document).ready(function() {
            $('#prestamosTable').DataTable({
                language: {
                    url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
                },
                pageLength: 10,
                order: [[4, 'desc']], // Ordenar por fecha de préstamo descendente
                columnDefs: [
                    { orderable: false, targets: [7] } // Deshabilitar orden en columna de acciones
                ]
            });
        });

        // Función para confirmar devolución
        function confirmarDevolucion(id, titulo) {
            document.getElementById('libroDevolucion').textContent = titulo;
            document.getElementById('devolucionLink').href = 
                '${pageContext.request.contextPath}/prestamo-devolver?id=' + id;
            
            new bootstrap.Modal(document.getElementById('devolucionModal')).show();
        }

        // Función para confirmar eliminación
        function confirmarEliminacion(id, titulo) {
            document.getElementById('libroTitulo').textContent = titulo;
            document.getElementById('eliminarLink').href = 
                '${pageContext.request.contextPath}/prestamo-eliminar?id=' + id;
            
            new bootstrap.Modal(document.getElementById('confirmModal')).show();
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
        });
    </script>
</body>
</html>