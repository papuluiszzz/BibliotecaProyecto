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
   --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
   --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
   --success-gradient: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
   --info-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
   --warning-gradient: linear-gradient(135deg, #f8b500 0%, #ffc837 100%);
   --danger-gradient: linear-gradient(135deg, #ff416c 0%, #ff4b2b 100%);
   --dark-gradient: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
   
   --glass-bg: rgba(255, 255, 255, 0.25);
   --glass-border: rgba(255, 255, 255, 0.18);
   --shadow-light: 0 8px 32px rgba(31, 38, 135, 0.37);
   --shadow-medium: 0 16px 48px rgba(31, 38, 135, 0.25);
   --shadow-heavy: 0 24px 64px rgba(31, 38, 135, 0.4);
   
   --border-radius: 20px;
   --border-radius-sm: 12px;
   --transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
   --glow: 0 0 20px rgba(102, 126, 234, 0.6);
}

* {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
}

body {
   font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
   background: linear-gradient(135deg, #667eea 0%, #764ba2 25%, #f093fb 50%, #f5576c 75%, #4facfe 100%);
   background-size: 400% 400%;
   animation: gradientShift 15s ease infinite;
   min-height: 100vh;
   line-height: 1.6;
   color: #2c3e50;
}

@keyframes gradientShift {
   0% { background-position: 0% 50%; }
   50% { background-position: 100% 50%; }
   100% { background-position: 0% 50%; }
}

/* Glassmorphism Navbar */
.modern-navbar {
   background: rgba(255, 255, 255, 0.1);
   backdrop-filter: blur(20px);
   -webkit-backdrop-filter: blur(20px);
   border-bottom: 1px solid rgba(255, 255, 255, 0.2);
   box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
   position: sticky;
   top: 0;
   z-index: 1000;
}

.navbar {
   background: rgba(255, 255, 255, 0.1) !important;
   backdrop-filter: blur(20px);
   -webkit-backdrop-filter: blur(20px);
   border-bottom: 1px solid rgba(255, 255, 255, 0.2);
   box-shadow: var(--shadow-light);
}

.navbar-brand {
   font-weight: 800;
   font-size: 1.5rem;
   background: linear-gradient(45deg, #fff, #f8f9fa);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
   background-clip: text;
   filter: drop-shadow(0 2px 4px rgba(0,0,0,0.3));
}

.navbar-nav .nav-link {
   color: rgba(255, 255, 255, 0.9) !important;
   font-weight: 500;
   padding: 0.75rem 1.5rem !important;
   border-radius: var(--border-radius-sm);
   transition: var(--transition);
   margin: 0 0.25rem;
   position: relative;
   overflow: hidden;
}

.navbar-nav .nav-link::before {
   content: '';
   position: absolute;
   top: 0;
   left: -100%;
   width: 100%;
   height: 100%;
   background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
   transition: left 0.5s;
}

.navbar-nav .nav-link:hover::before,
.navbar-nav .nav-link.active::before {
   left: 100%;
}

.navbar-nav .nav-link:hover,
.navbar-nav .nav-link.active {
   background: rgba(255, 255, 255, 0.2);
   color: white !important;
   transform: translateY(-2px);
   box-shadow: var(--shadow-light);
}

.dropdown-menu {
   background: rgba(255, 255, 255, 0.9);
   backdrop-filter: blur(20px);
   -webkit-backdrop-filter: blur(20px);
   border: 1px solid rgba(255, 255, 255, 0.3);
   border-radius: var(--border-radius-sm);
   box-shadow: var(--shadow-medium);
}

.dropdown-item {
   padding: 0.75rem 1.5rem;
   border-radius: var(--border-radius-sm);
   margin: 0.25rem;
   transition: var(--transition);
   color: #2c3e50;
}

.dropdown-item:hover {
   background: var(--primary-gradient);
   color: white;
   transform: translateX(5px);
}

/* Hero Header with Floating Elements */
.content-header {
   background: linear-gradient(135deg, rgba(102, 126, 234, 0.9) 0%, rgba(118, 75, 162, 0.9) 100%);
   padding: 5rem 0;
   margin-bottom: 3rem;
   position: relative;
   overflow: hidden;
}

.content-header::before {
   content: '';
   position: absolute;
   top: -50%;
   left: -50%;
   width: 200%;
   height: 200%;
   background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="a" cx="50%" cy="50%"><stop offset="0%" style="stop-color:rgba(255,255,255,0.3)"/><stop offset="100%" style="stop-color:rgba(255,255,255,0)"/></radialGradient></defs><circle cx="200" cy="200" r="100" fill="url(%23a)"/><circle cx="800" cy="300" r="150" fill="url(%23a)"/><circle cx="300" cy="700" r="80" fill="url(%23a)"/><circle cx="700" cy="800" r="120" fill="url(%23a)"/></svg>');
   animation: floatElements 20s ease-in-out infinite;
   opacity: 0.6;
}

@keyframes floatElements {
   0%, 100% { transform: translate(0, 0) rotate(0deg); }
   33% { transform: translate(-20px, -30px) rotate(5deg); }
   66% { transform: translate(20px, -10px) rotate(-5deg); }
}

.content-header .container {
   position: relative;
   z-index: 2;
}

.content-header h1 {
   font-size: 3.5rem;
   font-weight: 800;
   margin-bottom: 1rem;
   color: white;
   text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
   animation: slideInLeft 1s ease-out;
}

.content-header p {
   font-size: 1.3rem;
   font-weight: 300;
   color: rgba(255, 255, 255, 0.9);
   animation: slideInRight 1s ease-out 0.2s both;
}

@keyframes slideInLeft {
   from {
       opacity: 0;
       transform: translateX(-50px);
   }
   to {
       opacity: 1;
       transform: translateX(0);
   }
}

@keyframes slideInRight {
   from {
       opacity: 0;
       transform: translateX(50px);
   }
   to {
       opacity: 1;
       transform: translateX(0);
   }
}

/* 3D Buttons with Glow Effects */
.btn {
   border-radius: var(--border-radius-sm);
   padding: 1rem 2.5rem;
   font-weight: 600;
   text-transform: uppercase;
   letter-spacing: 1px;
   transition: var(--transition);
   border: none;
   position: relative;
   overflow: hidden;
   box-shadow: var(--shadow-light);
}

.btn::before {
   content: '';
   position: absolute;
   top: 0;
   left: -100%;
   width: 100%;
   height: 100%;
   background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
   transition: left 0.6s;
}

.btn:hover::before {
   left: 100%;
}

.btn-light {
   background: rgba(255, 255, 255, 0.9);
   color: #2c3e50;
   border: 1px solid rgba(255, 255, 255, 0.3);
}

.btn-light:hover {
   background: white;
   transform: translateY(-5px) scale(1.05);
   box-shadow: var(--shadow-heavy);
   color: #2c3e50;
}

.btn-primary {
   background: var(--primary-gradient);
   color: white;
}

.btn-primary:hover {
   transform: translateY(-5px) scale(1.05);
   box-shadow: var(--shadow-heavy), var(--glow);
   color: white;
}

.btn-success {
   background: var(--success-gradient);
   color: white;
}

.btn-success:hover {
   transform: translateY(-5px) scale(1.05);
   box-shadow: var(--shadow-heavy), 0 0 20px rgba(17, 153, 142, 0.6);
   color: white;
}

.btn-outline-primary {
   border: 2px solid rgba(102, 126, 234, 0.8);
   color: #667eea;
   background: rgba(255, 255, 255, 0.1);
   backdrop-filter: blur(10px);
}

.btn-outline-primary:hover {
   background: var(--primary-gradient);
   border-color: transparent;
   color: white;
   transform: translateY(-3px) scale(1.02);
   box-shadow: var(--glow);
}

.btn-outline-success {
   border: 2px solid rgba(17, 153, 142, 0.8);
   color: #11998e;
   background: rgba(255, 255, 255, 0.1);
   backdrop-filter: blur(10px);
}

.btn-outline-success:hover {
   background: var(--success-gradient);
   border-color: transparent;
   color: white;
   transform: translateY(-3px) scale(1.02);
   box-shadow: 0 0 20px rgba(17, 153, 142, 0.6);
}

/* Floating Cards with 3D Effects */
.stats-card {
   background: var(--glass-bg);
   backdrop-filter: blur(20px);
   -webkit-backdrop-filter: blur(20px);
   border: 1px solid var(--glass-border);
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
   transition: transform 0.4s ease;
}

.stats-card:hover {
   transform: translateY(-15px) rotateX(10deg) rotateY(5deg);
   box-shadow: var(--shadow-heavy);
   background: rgba(255, 255, 255, 0.3);
}

.stats-card:hover::before {
   transform: scaleX(1);
}

.stats-card .card-body {
   padding: 2.5rem 2rem;
}

.stats-card i {
   font-size: 4rem;
   margin-bottom: 1.5rem;
   background: var(--primary-gradient);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
   background-clip: text;
   filter: drop-shadow(0 4px 8px rgba(102, 126, 234, 0.3));
   animation: iconFloat 3s ease-in-out infinite;
}

@keyframes iconFloat {
   0%, 100% { transform: translateY(0px); }
   50% { transform: translateY(-10px); }
}

.stats-card h3 {
   font-size: 3rem;
   font-weight: 800;
   margin-bottom: 0.5rem;
   background: var(--dark-gradient);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
   background-clip: text;
}

/* Enhanced Prestamo Cards */
.prestamo-card {
   background: var(--glass-bg);
   backdrop-filter: blur(20px);
   -webkit-backdrop-filter: blur(20px);
   border: 1px solid var(--glass-border);
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
   transition: transform 0.4s ease;
}

.prestamo-card:hover {
   transform: translateY(-15px) scale(1.03);
   box-shadow: var(--shadow-heavy);
   background: rgba(255, 255, 255, 0.35);
}

.prestamo-card:hover::before {
   transform: scaleX(1);
}

.book-icon {
   font-size: 5rem;
   background: var(--info-gradient);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
   background-clip: text;
   margin-bottom: 2rem;
   filter: drop-shadow(0 4px 8px rgba(102, 126, 234, 0.4));
   animation: bookPulse 4s ease-in-out infinite;
}

@keyframes bookPulse {
   0%, 100% { 
       transform: scale(1) rotateY(0deg); 
       filter: drop-shadow(0 4px 8px rgba(102, 126, 234, 0.4));
   }
   50% { 
       transform: scale(1.1) rotateY(10deg); 
       filter: drop-shadow(0 8px 16px rgba(102, 126, 234, 0.6));
   }
}

.prestamo-card:hover .book-icon {
   animation: bookSpin 0.6s ease-in-out;
}

@keyframes bookSpin {
   0% { transform: rotateY(0deg); }
   100% { transform: rotateY(360deg); }
}

/* Enhanced Cards */
.card {
   background: var(--glass-bg);
   backdrop-filter: blur(20px);
   -webkit-backdrop-filter: blur(20px);
   border: 1px solid var(--glass-border);
   border-radius: var(--border-radius);
   box-shadow: var(--shadow-light);
   transition: var(--transition);
}

.card:hover {
   transform: translateY(-8px);
   box-shadow: var(--shadow-medium);
   background: rgba(255, 255, 255, 0.3);
}

.card-header {
   border-radius: var(--border-radius) var(--border-radius) 0 0;
   border-bottom: 1px solid rgba(255, 255, 255, 0.2);
   padding: 2rem;
   position: relative;
   overflow: hidden;
}

.card-header::before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   bottom: 0;
   background: var(--info-gradient);
   z-index: 1;
}

.card-header.bg-success::before {
   background: var(--success-gradient);
}

.card-header * {
   position: relative;
   z-index: 2;
   color: white;
}

.card-body {
   padding: 2rem;
}

.card-footer {
   border-top: 1px solid rgba(255, 255, 255, 0.2);
   border-radius: 0 0 var(--border-radius) var(--border-radius);
   padding: 2rem;
   background: rgba(255, 255, 255, 0.05);
}

/* Animated Badges */
.badge {
   border-radius: 50px;
   padding: 0.8rem 1.8rem;
   font-weight: 700;
   text-transform: uppercase;
   letter-spacing: 1px;
   font-size: 0.8rem;
   box-shadow: var(--shadow-light);
   position: relative;
   overflow: hidden;
}

.badge::before {
   content: '';
   position: absolute;
   top: 50%;
   left: 50%;
   width: 0;
   height: 0;
   background: rgba(255, 255, 255, 0.3);
   border-radius: 50%;
   transform: translate(-50%, -50%);
   transition: all 0.6s ease;
}

.badge:hover::before {
   width: 300%;
   height: 300%;
}

.badge-activo {
   background: var(--warning-gradient);
   color: white;
   animation: pulseGlow 2s infinite;
}

@keyframes pulseGlow {
   0%, 100% { 
       transform: scale(1);
       box-shadow: var(--shadow-light), 0 0 0 0 rgba(248, 181, 0, 0.4);
   }
   50% { 
       transform: scale(1.05);
       box-shadow: var(--shadow-medium), 0 0 0 10px rgba(248, 181, 0, 0);
   }
}

.badge-devuelto {
   background: var(--success-gradient);
   color: white;
}

.badge-vencido {
   background: var(--danger-gradient);
   color: white;
   animation: urgentPulse 1.5s infinite;
}

@keyframes urgentPulse {
   0%, 100% { 
       transform: scale(1);
       box-shadow: var(--shadow-light), 0 0 0 0 rgba(255, 65, 108, 0.7);
   }
   50% { 
       transform: scale(1.1);
       box-shadow: var(--shadow-heavy), 0 0 0 15px rgba(255, 65, 108, 0);
   }
}

/* Enhanced Text Effects */
.text-vencido {
   color: #ff416c !important;
   font-weight: 800;
   animation: textAlarm 1s infinite;
   text-shadow: 0 0 10px rgba(255, 65, 108, 0.5);
}

@keyframes textAlarm {
   0%, 50% { opacity: 1; transform: scale(1); }
   51%, 100% { opacity: 0.7; transform: scale(1.05); }
}

.card-title {
   font-weight: 700;
   font-size: 1.4rem;
   background: var(--dark-gradient);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
   background-clip: text;
   transition: var(--transition);
}

.prestamo-card:hover .card-title {
   background: var(--info-gradient);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
   background-clip: text;
   transform: scale(1.05);
}

/* Enhanced Alerts */
.alert {
   border-radius: var(--border-radius-sm);
   border: none;
   padding: 1.5rem 2rem;
   margin-bottom: 2rem;
   backdrop-filter: blur(10px);
   -webkit-backdrop-filter: blur(10px);
   animation: slideInAlert 0.6s ease-out;
   position: relative;
   overflow: hidden;
}

@keyframes slideInAlert {
   from {
       opacity: 0;
       transform: translateY(-30px) scale(0.95);
   }
   to {
       opacity: 1;
       transform: translateY(0) scale(1);
   }
}

.alert::before {
   content: '';
   position: absolute;
   top: 0;
   left: -100%;
   width: 100%;
   height: 100%;
   background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
   animation: alertShimmer 2s infinite;
}

@keyframes alertShimmer {
   0% { left: -100%; }
   50%, 100% { left: 100%; }
}

.alert-success {
   background: rgba(17, 153, 142, 0.2);
   color: #0d7377;
   border: 1px solid rgba(17, 153, 142, 0.4);
   box-shadow: 0 0 20px rgba(17, 153, 142, 0.2);
}

.alert-danger {
   background: rgba(255, 65, 108, 0.2);
   color: #d63384;
   border: 1px solid rgba(255, 65, 108, 0.4);
   box-shadow: 0 0 20px rgba(255, 65, 108, 0.2);
}

.alert-info {
   background: rgba(102, 126, 234, 0.2);
   color: #4c63d2;
   border: 1px solid rgba(102, 126, 234, 0.4);
   box-shadow: 0 0 20px rgba(102, 126, 234, 0.2);
}

/* Enhanced Modal */
.modal-content {
   background: var(--glass-bg);
   backdrop-filter: blur(30px);
   -webkit-backdrop-filter: blur(30px);
   border: 1px solid var(--glass-border);
   border-radius: var(--border-radius);
   box-shadow: var(--shadow-heavy);
   animation: modalAppear 0.4s ease-out;
}

@keyframes modalAppear {
   from {
       opacity: 0;
       transform: scale(0.8) translateY(-50px);
   }
   to {
       opacity: 1;
       transform: scale(1) translateY(0);
   }
}

.modal-header {
   border-bottom: 1px solid rgba(255, 255, 255, 0.2);
   padding: 2rem;
}

.modal-body {
   padding: 2.5rem;
}

.modal-footer {
   border-top: 1px solid rgba(255, 255, 255, 0.2);
   padding: 2rem;
}

/* Empty State Enhancement */
.empty-state {
   text-align: center;
   padding: 5rem 3rem;
   background: var(--glass-bg);
   backdrop-filter: blur(20px);
   -webkit-backdrop-filter: blur(20px);
   border-radius: var(--border-radius);
   margin: 3rem 0;
   border: 1px solid var(--glass-border);
   animation: fadeInScale 0.8s ease-out;
}

@keyframes fadeInScale {
   from {
       opacity: 0;
       transform: scale(0.9);
   }
   to {
       opacity: 1;
       transform: scale(1);
   }
}

.empty-state i {
   font-size: 8rem;
   margin-bottom: 2rem;
   background: var(--info-gradient);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
   background-clip: text;
   filter: drop-shadow(0 4px 8px rgba(102, 126, 234, 0.3));
   animation: emptyIconFloat 4s ease-in-out infinite;
}

@keyframes emptyIconFloat {
   0%, 100% { transform: translateY(0px) rotateY(0deg); }
   25% { transform: translateY(-20px) rotateY(90deg); }
   50% { transform: translateY(0px) rotateY(180deg); }
   75% { transform: translateY(-10px) rotateY(270deg); }
}

/* Card Entry Animations */
.prestamo-card {
   opacity: 0;
   transform: translateY(50px) rotateX(10deg);
   animation: cardEntrance 0.8s ease-out forwards;
}

.prestamo-card:nth-child(odd) { animation-delay: 0.1s; }
.prestamo-card:nth-child(even) { animation-delay: 0.2s; }
.prestamo-card:nth-child(3n) { animation-delay: 0.3s; }
.prestamo-card:nth-child(4n) { animation-delay: 0.4s; }
.prestamo-card:nth-child(5n) { animation-delay: 0.5s; }
.prestamo-card:nth-child(6n) { animation-delay: 0.6s; }

@keyframes cardEntrance {
   to {
       opacity: 1;
       transform: translateY(0) rotateX(0deg);
   }
}

/* Responsive Design */
@media (max-width: 768px) {
   .content-header h1 {
       font-size: 2.5rem;
   }
   
   .prestamo-card:hover {
       transform: translateY(-8px) scale(1.01);
   }
   
   .book-icon {
       font-size: 3.5rem;
   }
   
   .stats-card:hover {
       transform: translateY(-8px);
   }
   
   .btn {
       padding: 0.8rem 2rem;
   }
   
   .card-body,
   .card-header,
   .card-footer {
       padding: 1.5rem;
   }
   
   .modal-body {
       padding: 2rem;
   }
}

/* Additional Micro-interactions */
.btn-close {
   transition: var(--transition);
}

.btn-close:hover {
   transform: rotate(90deg) scale(1.1);
}

/* Loading Animation for Buttons */
.btn.loading {
   pointer-events: none;
   position: relative;
   overflow: hidden;
}

.btn.loading::after {
   content: '';
   position: absolute;
   width: 20px;
   height: 20px;
   border: 2px solid rgba(255,255,255,.3);
   border-radius: 50%;
   border-top-color: #fff;
   animation: buttonSpin 1s linear infinite;
   right: 1rem;
   top: 50%;
   transform: translateY(-50%);
}

@keyframes buttonSpin {
   to { transform: translateY(-50%) rotate(360deg); }
}

/* Navbar Toggler Enhancement */
.navbar-toggler {
   border: 1px solid rgba(255, 255, 255, 0.3);
   background: rgba(255, 255, 255, 0.1);
   backdrop-filter: blur(10px);
}

.navbar-toggler:hover {
   background: rgba(255, 255, 255, 0.2);
   transform: scale(1.05);
}

/* Enhanced Scrollbar */
::-webkit-scrollbar {
   width: 12px;
}

::-webkit-scrollbar-track {
   background: rgba(255, 255, 255, 0.1);
   border-radius: 10px;
}

::-webkit-scrollbar-thumb {
   background: var(--primary-gradient);
   border-radius: 10px;
   border: 2px solid transparent;
   background-clip: content-box;
}

::-webkit-scrollbar-thumb:hover {
   background: var(--info-gradient);
   background-clip: content-box;
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