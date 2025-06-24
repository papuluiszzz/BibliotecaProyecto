<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Libros - Sistema de Biblioteca ADSO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css" rel="stylesheet">
   <style>
    :root {
        --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        --danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ff8e8e 100%);
        --warning-gradient: linear-gradient(135deg, #f8b500 0%, #ffc837 100%);
        --shadow-light: 0 8px 20px rgba(0, 0, 0, 0.08);
        --border-radius: 16px;
        --transition: all 0.3s ease;
    }

    body {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        font-family: 'Segoe UI', sans-serif;
    }

    .navbar-brand {
        font-weight: 700;
        font-size: 1.5rem;
        background: var(--primary-gradient);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }

    .content-header {
        background: var(--primary-gradient);
        padding: 3rem 1rem;
        color: white;
        margin-bottom: 2.5rem;
        border-radius: var(--border-radius);
        position: relative;
        overflow: hidden;
        box-shadow: var(--shadow-light);
    }

    .stats-card {
        background: white;
        border-radius: var(--border-radius);
        box-shadow: var(--shadow-light);
        transition: var(--transition);
        padding: 1.5rem;
        text-align: center;
    }

    .stats-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 12px 28px rgba(0, 0, 0, 0.12);
    }

    .stats-card i {
        font-size: 2rem;
        margin-bottom: 0.5rem;
        display: block;
    }

    .table-responsive {
        border-radius: var(--border-radius);
        overflow: hidden;
        box-shadow: var(--shadow-light);
    }

    .table thead {
        background-color: rgba(102, 126, 234, 0.1);
    }

    .table th {
        font-weight: 600;
        border: none;
        padding: 1rem;
    }

    .table td {
        border: none;
        padding: 1rem;
        vertical-align: middle;
    }

    .table tbody tr:hover {
        background-color: rgba(102, 126, 234, 0.05);
        transform: scale(1.01);
        transition: var(--transition);
    }

    .btn-action {
        margin: 0 0.25rem;
        padding: 0.5rem;
        border-radius: 50%;
        font-size: 0.85rem;
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

    .badge-disponible {
        background: var(--success-gradient);
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 50px;
        font-size: 0.75rem;
        font-weight: bold;
        box-shadow: 0 4px 12px rgba(79, 172, 254, 0.4);
    }

    .badge-no-disponible {
        background: var(--danger-gradient);
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 50px;
        font-size: 0.75rem;
        font-weight: bold;
        box-shadow: 0 4px 12px rgba(255, 107, 107, 0.4);
    }

    .search-section {
        background: white;
        border-radius: var(--border-radius);
        padding: 2rem;
        box-shadow: var(--shadow-light);
        margin-bottom: 2rem;
    }

    .card-header {
        background: var(--success-gradient);
        color: white;
        padding: 1.5rem;
        border-radius: var(--border-radius) var(--border-radius) 0 0;
    }

    .alert {
        border-radius: var(--border-radius);
        padding: 1.25rem 1.5rem;
        border: none;
        animation: fadeIn 0.5s ease;
    }

    .alert-success {
        background-color: rgba(79, 172, 254, 0.1);
        color: #4facfe;
        border-left: 5px solid #4facfe;
    }

    .alert-danger {
        background-color: rgba(255, 107, 107, 0.1);
        color: #ff6b6b;
        border-left: 5px solid #ff6b6b;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
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
                        <a class="nav-link active" href="${pageContext.request.contextPath}/libros">
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
                        <i class="fas fa-book me-3"></i>Gestión de Libros
                    </h1>
                    <p class="mb-0 mt-2">Administre el catálogo de libros de la biblioteca</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <a href="${pageContext.request.contextPath}/libro-nuevo" class="btn btn-light btn-lg">
                        <i class="fas fa-plus me-2"></i>Nuevo Libro
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- Estadísticas -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card stats-card text-center">
                    <div class="card-body">
                        <i class="fas fa-book fa-2x text-primary mb-3"></i>
                        <h3 class="card-title">${totalLibros}</h3>
                        <p class="card-text text-muted">Total de Libros</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card stats-card text-center">
                    <div class="card-body">
                        <i class="fas fa-check-circle fa-2x text-success mb-3"></i>
                        <h3 class="card-title">
                            <c:set var="disponibles" value="0"/>
                            <c:forEach var="libro" items="${libros}">
                                <c:if test="${libro.disponible}">
                                    <c:set var="disponibles" value="${disponibles + 1}"/>
                                </c:if>
                            </c:forEach>
                            ${disponibles}
                        </h3>
                        <p class="card-text text-muted">Libros Disponibles</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card stats-card text-center">
                    <div class="card-body">
                        <i class="fas fa-tags fa-2x text-info mb-3"></i>
                        <h3 class="card-title">${categorias.size()}</h3>
                        <p class="card-text text-muted">Categorías</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sección de búsqueda -->
        <div class="search-section">
            <h5 class="mb-3">
                <i class="fas fa-search me-2"></i>Buscar Libros
            </h5>
            <form method="get" action="${pageContext.request.contextPath}/libros-buscar">
                <div class="row">
                    <div class="col-md-4">
                        <input type="text" class="form-control" name="termino" 
                               placeholder="Término de búsqueda..." 
                               value="${terminoBusqueda}">
                    </div>
                    <div class="col-md-3">
                        <select class="form-select" name="tipo">
                            <option value="general" ${tipoBusqueda == 'general' ? 'selected' : ''}>Búsqueda General</option>
                            <option value="titulo" ${tipoBusqueda == 'titulo' ? 'selected' : ''}>Por Título</option>
                            <option value="autor" ${tipoBusqueda == 'autor' ? 'selected' : ''}>Por Autor</option>
                            <option value="categoria" ${tipoBusqueda == 'categoria' ? 'selected' : ''}>Por Categoría</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-search me-2"></i>Buscar
                        </button>
                        <a href="${pageContext.request.contextPath}/libros" class="btn btn-outline-secondary">
                            <i class="fas fa-times me-2"></i>Limpiar
                        </a>
                    </div>
                </div>
            </form>
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

        <!-- Tabla de libros -->
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">
                    <i class="fas fa-list me-2"></i>Catálogo de Libros
                    <span class="badge bg-light text-dark ms-2">${libros.size()} registros</span>
                </h5>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0" id="librosTable">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Título</th>
                                <th>Autor</th>
                                <th>Editorial</th>
                                <th>Año</th>
                                <th>Categoría</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="libro" items="${libros}">
                                <tr>
                                    <td><strong>#${libro.id}</strong></td>
                                    <td>
                                        <strong>${libro.titulo}</strong>
                                    </td>
                                    <td>${libro.autor}</td>
                                    <td>${libro.editorial}</td>
                                    <td>${libro.anio}</td>
                                    <td>
                                        <span class="badge bg-info">${libro.categoria}</span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${libro.disponible}">
                                                <span class="badge badge-disponible">
                                                    <i class="fas fa-check me-1"></i>Disponible
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-no-disponible">
                                                    <i class="fas fa-times me-1"></i>Prestado
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="${pageContext.request.contextPath}/libro-editar?id=${libro.id}" 
                                               class="btn btn-sm btn-outline-primary btn-action" 
                                               title="Editar libro">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <button type="button" 
                                                    class="btn btn-sm btn-outline-danger btn-action" 
                                                    onclick="confirmarEliminacion(${libro.id}, '${libro.titulo}')"
                                                    title="Eliminar libro">
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

        <c:if test="${empty libros}">
            <div class="text-center mt-4">
                <i class="fas fa-book fa-3x text-muted mb-3"></i>
                <h4 class="text-muted">No hay libros registrados</h4>
                <p class="text-muted">Comience agregando el primer libro al catálogo</p>
                <a href="${pageContext.request.contextPath}/libro-nuevo" class="btn btn-primary">
                    <i class="fas fa-plus me-2"></i>Agregar Primer Libro
                </a>
            </div>
        </c:if>
    </div>

    <!-- Modal de confirmación -->
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
                    <p>¿Está seguro de que desea eliminar el libro <strong id="libroTitulo"></strong>?</p>
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
            $('#librosTable').DataTable({
                language: {
                    url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
                },
                pageLength: 10,
                order: [[1, 'asc']], // Ordenar por título
                columnDefs: [
                    { orderable: false, targets: [7] } // Deshabilitar orden en columna de acciones
                ]
            });
        });

        // Función para confirmar eliminación
        function confirmarEliminacion(id, titulo) {
            document.getElementById('libroTitulo').textContent = titulo;
            document.getElementById('eliminarLink').href = 
                '${pageContext.request.contextPath}/libro-eliminar?id=' + id;
            
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