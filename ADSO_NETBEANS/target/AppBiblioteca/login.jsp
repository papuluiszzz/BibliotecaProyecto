<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Sistema de Biblioteca ADSO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --warning-gradient: linear-gradient(135deg, #f8b500 0%, #ffc837 100%);
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        /* Animated Background Elements */
        body::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 1px, transparent 1px);
            background-size: 50px 50px;
            animation: float 20s ease-in-out infinite;
            z-index: 1;
        }

        body::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="a" cx="50%" cy="50%"><stop offset="0%" style="stop-color:rgba(255,255,255,0.1)"/><stop offset="100%" style="stop-color:rgba(255,255,255,0)"/></radialGradient></defs><circle cx="100" cy="100" r="80" fill="url(%23a)"/><circle cx="900" cy="200" r="120" fill="url(%23a)"/><circle cx="200" cy="800" r="100" fill="url(%23a)"/><circle cx="800" cy="700" r="90" fill="url(%23a)"/></svg>');
            opacity: 0.4;
            z-index: 1;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            33% { transform: translateY(-20px) rotate(120deg); }
            66% { transform: translateY(20px) rotate(240deg); }
        }

        .login-container {
            max-width: 480px;
            margin: 0 auto;
            position: relative;
            z-index: 10;
            padding: 2rem;
        }

        /* Glassmorphism Login Card */
        .login-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(30px);
            -webkit-backdrop-filter: blur(30px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-heavy);
            padding: 3rem;
            position: relative;
            overflow: hidden;
        }

        .login-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--success-gradient);
            border-radius: var(--border-radius) var(--border-radius) 0 0;
        }

        .login-card::after {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: rotate 30s linear infinite;
            pointer-events: none;
        }

        @keyframes rotate {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .login-header {
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
            z-index: 2;
        }

        .login-icon {
            width: 80px;
            height: 80px;
            background: var(--success-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            box-shadow: var(--shadow-medium);
            animation: pulse 2s ease-in-out infinite;
        }

        .login-icon i {
            font-size: 2.5rem;
            color: white;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .login-title {
            color: white;
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            text-shadow: 0 2px 20px rgba(0, 0, 0, 0.3);
        }

        .login-subtitle {
            color: rgba(255, 255, 255, 0.8);
            font-weight: 300;
            font-size: 1.1rem;
        }

        /* Modern Form Styling */
        .form-floating {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--border-radius-sm);
            padding: 1.25rem 1.5rem;
            font-weight: 500;
            color: white;
            transition: var(--transition);
            position: relative;
            z-index: 2;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.15);
            border-color: rgba(255, 255, 255, 0.4);
            box-shadow: 0 0 0 0.25rem rgba(255, 255, 255, 0.1);
            color: white;
            transform: translateY(-2px);
        }

        .form-label {
            color: rgba(255, 255, 255, 0.9);
            font-weight: 600;
            margin-bottom: 0.75rem;
            display: flex;
            align-items: center;
        }

        .form-label i {
            margin-right: 0.5rem;
            width: 20px;
        }

        /* CAPTCHA Styling */
        .captcha-container {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1rem;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--border-radius-sm);
            padding: 1rem;
        }

        .captcha-image {
            border-radius: var(--border-radius-sm);
            cursor: pointer;
            transition: var(--transition);
            box-shadow: var(--shadow-light);
        }

        .captcha-image:hover {
            transform: scale(1.05);
            box-shadow: var(--shadow-medium);
        }

        .btn-refresh {
            background: rgba(255, 255, 255, 0.2);
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: white;
            border-radius: 50%;
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: var(--transition);
            backdrop-filter: blur(10px);
        }

        .btn-refresh:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: rotate(180deg) scale(1.1);
            box-shadow: var(--shadow-light);
        }

        /* Modern Alert */
        .alert {
            background: rgba(220, 53, 69, 0.1);
            backdrop-filter: blur(10px);
            border: 2px solid rgba(220, 53, 69, 0.3);
            border-radius: var(--border-radius-sm);
            color: #fff;
            padding: 1rem 1.5rem;
            margin-bottom: 1.5rem;
        }

        .alert-danger {
            background: rgba(220, 53, 69, 0.15);
            border-color: rgba(220, 53, 69, 0.4);
        }

        /* Modern Button */
        .btn-login {
            background: var(--success-gradient);
            border: none;
            border-radius: var(--border-radius-sm);
            padding: 1.25rem 2rem;
            font-weight: 700;
            font-size: 1.1rem;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            color: white;
            width: 100%;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            box-shadow: var(--shadow-medium);
        }

        .btn-login::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s;
        }

        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-heavy);
        }

        .btn-login:hover::before {
            left: 100%;
        }

        .btn-login:active {
            transform: translateY(-1px);
        }

        /* Loading State */
        .btn-login.loading {
            pointer-events: none;
        }

        .btn-login.loading::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
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

        /* Public Link */
        .public-link {
            text-align: center;
            margin-top: 2rem;
            position: relative;
            z-index: 2;
        }

        .public-link a {
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            font-weight: 500;
            padding: 0.75rem 1.5rem;
            border-radius: 50px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
        }

        .public-link a:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
            color: white;
            box-shadow: var(--shadow-light);
        }

        /* Small Text */
        .form-text {
            color: rgba(255, 255, 255, 0.7) !important;
            font-size: 0.875rem;
            margin-top: 0.5rem;
        }

        /* Responsive Design */
        @media (max-width: 576px) {
            .login-container {
                padding: 1rem;
            }
            
            .login-card {
                padding: 2rem 1.5rem;
            }
            
            .login-title {
                font-size: 1.5rem;
            }
            
            .captcha-container {
                flex-direction: column;
                gap: 0.75rem;
            }
        }

        /* Enhanced Animations */
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
                transform: scale(0.8);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <div class="login-card scale-in">
                <div class="login-header fade-in-up">
                    <div class="login-icon">
                        <i class="fas fa-book-open"></i>
                    </div>
                    <h2 class="login-title">Biblioteca ADSO</h2>
                    <p class="login-subtitle">Accede a tu portal académico</p>
                </div>

                <!-- Mostrar mensajes de error -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger fade-in-up" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        ${error}
                    </div>
                </c:if>

                <!-- Formulario de login -->
                <form method="post" action="${pageContext.request.contextPath}/login" class="fade-in-up">
                    <div class="form-floating">
                        <label for="correo" class="form-label">
                            <i class="fas fa-envelope"></i>Correo Electrónico
                        </label>
                        <input type="email" class="form-control" id="correo" name="correo" 
                               value="${correoAnterior}" required 
                               placeholder="nombre@ejemplo.com">
                    </div>

                    <div class="form-floating">
                        <label for="contrasena" class="form-label">
                            <i class="fas fa-lock"></i>Contraseña
                        </label>
                        <input type="password" class="form-control" id="contrasena" name="contrasena" 
                               required placeholder="Ingrese su contraseña">
                    </div>

                    <!-- CAPTCHA -->
                    <div class="form-floating">
                        <label for="captcha" class="form-label">
                            <i class="fas fa-shield-alt"></i>Código de Verificación
                        </label>
                        <div class="captcha-container">
                            <img id="captchaImage" src="${captchaImagen}" alt="CAPTCHA" 
                                 class="captcha-image" title="Clic para nuevo código">
                            <button type="button" class="btn-refresh" onclick="regenerarCaptcha()" 
                                    title="Generar nuevo código">
                                <i class="fas fa-sync-alt"></i>
                            </button>
                        </div>
                        <input type="text" class="form-control" id="captcha" name="captcha" 
                               required placeholder="Código de 6 caracteres" 
                               autocomplete="off" maxlength="6">
                        <small class="form-text">
                            <i class="fas fa-info-circle me-1"></i>
                            Ingrese exactamente los caracteres mostrados
                        </small>
                    </div>

                    <button type="submit" class="btn btn-primary btn-login" id="loginBtn">
                        <i class="fas fa-sign-in-alt me-2"></i>Iniciar Sesión
                    </button>
                </form>

                <!-- Enlaces adicionales -->
                <div class="public-link fade-in-up">
                    <a href="${pageContext.request.contextPath}/consulta-publica">
                        <i class="fas fa-search me-2"></i>Explorar Catálogo Público
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Función para regenerar CAPTCHA con animación
        function regenerarCaptcha() {
            const refreshBtn = document.querySelector('.btn-refresh');
            const captchaImg = document.getElementById('captchaImage');
            const captchaInput = document.getElementById('captcha');
            
            // Añadir estado de carga
            refreshBtn.style.transform = 'rotate(360deg) scale(1.1)';
            refreshBtn.style.pointerEvents = 'none';
            
            fetch('${pageContext.request.contextPath}/captcha')
                .then(response => response.json())
                .then(data => {
                    // Animación de fade out/in
                    captchaImg.style.opacity = '0';
                    setTimeout(() => {
                        captchaImg.src = data.imagen;
                        captchaImg.style.opacity = '1';
                        captchaInput.value = '';
                        captchaInput.focus();
                        
                        // Restaurar botón
                        refreshBtn.style.transform = 'rotate(0deg) scale(1)';
                        refreshBtn.style.pointerEvents = 'auto';
                    }, 300);
                })
                .catch(error => {
                    console.error('Error al regenerar CAPTCHA:', error);
                    showErrorMessage('Error al generar nuevo código');
                    refreshBtn.style.transform = 'rotate(0deg) scale(1)';
                    refreshBtn.style.pointerEvents = 'auto';
                });
        }

        // Función para mostrar mensajes de error
        function showErrorMessage(message) {
            const existingAlert = document.querySelector('.alert');
            if (existingAlert) {
                existingAlert.remove();
            }
            
            const alert = document.createElement('div');
            alert.className = 'alert alert-danger fade-in-up';
            alert.innerHTML = `<i class="fas fa-exclamation-triangle me-2"></i>${message}`;
            
            const form = document.querySelector('form');
            form.parentNode.insertBefore(alert, form);
            
            // Auto-remove después de 5 segundos
            setTimeout(() => {
                alert.style.opacity = '0';
                setTimeout(() => alert.remove(), 300);
            }, 5000);
        }

        // Event listeners mejorados
        document.addEventListener('DOMContentLoaded', function() {
            // Auto-focus en email
            const emailInput = document.getElementById('correo');
            if (emailInput) {
                emailInput.focus();
            }

            // Regenerar CAPTCHA al hacer clic en la imagen
            document.getElementById('captchaImage').addEventListener('click', regenerarCaptcha);

            // Efecto de ripple en botones
            document.querySelectorAll('.btn-login, .btn-refresh').forEach(button => {
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

            // Validación en tiempo real del CAPTCHA
            const captchaInput = document.getElementById('captcha');
            captchaInput.addEventListener('input', function() {
                const value = this.value.trim();
                if (value.length === 6) {
                    this.style.borderColor = 'rgba(76, 175, 80, 0.6)';
                } else {
                    this.style.borderColor = 'rgba(255, 255, 255, 0.2)';
                }
            });

            // Efecto de escritura en inputs
            document.querySelectorAll('.form-control').forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'scale(1.02)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'scale(1)';
                });
            });
        });

        // Validación mejorada del formulario
        document.querySelector('form').addEventListener('submit', function(e) {
            const correo = document.getElementById('correo').value.trim();
            const contrasena = document.getElementById('contrasena').value.trim();
            const captcha = document.getElementById('captcha').value.trim();
            const loginBtn = document.getElementById('loginBtn');

            // Validaciones
            if (!correo || !contrasena || !captcha) {
                e.preventDefault();
                showErrorMessage('Por favor, complete todos los campos');
                return false;
            }

            if (captcha.length !== 6) {
                e.preventDefault();
                showErrorMessage('El código de verificación debe tener 6 caracteres');
                document.getElementById('captcha').focus();
                return false;
            }

            // Añadir estado de carga al botón
            loginBtn.classList.add('loading');
            loginBtn.innerHTML = 'Verificando... <div class="loading-spinner"></div>';
            loginBtn.disabled = true;

            // Si hay error, restaurar botón después de 3 segundos
            setTimeout(() => {
                if (loginBtn.classList.contains('loading')) {
                    loginBtn.classList.remove('loading');
                    loginBtn.innerHTML = '<i class="fas fa-sign-in-alt me-2"></i>Iniciar Sesión';
                    loginBtn.disabled = false;
                }
            }, 3000);
        });

        // Añadir CSS para el efecto ripple
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);

        // Parallax effect ligero en el fondo
        document.addEventListener('mousemove', function(e) {
            const mouseX = e.clientX / window.innerWidth;
            const mouseY = e.clientY / window.innerHeight;
            
            document.body.style.backgroundPosition = `${mouseX * 20}px ${mouseY * 20}px`;
        });
    </script>
</body>
</html>