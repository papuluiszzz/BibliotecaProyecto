package DAO;

import DTO.UsuarioDTO;
import Model.Conexion;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Clase DAO para operaciones con usuarios
 * @author HAWLETH
 */
public class UsuarioDAO {
    
    /**
     * Crear un nuevo usuario
     * @param usuario UsuarioDTO con los datos del usuario
     * @return boolean true si se creó exitosamente
     */
    public boolean crearUsuario(UsuarioDTO usuario) {
        String sql = "INSERT INTO usuarios (nombre, documento, correo, telefono, contrasena, rol) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection con = Conexion.getNuevaConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getDocumento());
            ps.setString(3, usuario.getCorreo());
            ps.setString(4, usuario.getTelefono());
            // Encriptar la contraseña antes de guardarla
            ps.setString(5, BCrypt.hashpw(usuario.getContrasena(), BCrypt.gensalt()));
            ps.setString(6, usuario.getRol());
            
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
            
        } catch (SQLException e) {
            System.err.println("Error al crear usuario: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Obtener todos los usuarios
     * @return List<UsuarioDTO> lista de usuarios
     */
    public List<UsuarioDTO> obtenerTodosUsuarios() {
        List<UsuarioDTO> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuarios ORDER BY nombre";
        
        try (Connection con = Conexion.getNuevaConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                UsuarioDTO usuario = new UsuarioDTO();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setDocumento(rs.getString("documento"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setRol(rs.getString("rol"));
                // No incluimos la contraseña por seguridad
                
                usuarios.add(usuario);
            }
            
        } catch (SQLException e) {
            System.err.println("Error al obtener usuarios: " + e.getMessage());
            e.printStackTrace();
        }
        
        return usuarios;
    }
    
    /**
     * Obtener usuario por ID
     * @param id ID del usuario
     * @return UsuarioDTO usuario encontrado o null
     */
    public UsuarioDTO obtenerUsuarioPorId(int id) {
        String sql = "SELECT * FROM usuarios WHERE id = ?";
        
        try (Connection con = Conexion.getNuevaConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    UsuarioDTO usuario = new UsuarioDTO();
                    usuario.setId(rs.getInt("id"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setDocumento(rs.getString("documento"));
                    usuario.setCorreo(rs.getString("correo"));
                    usuario.setTelefono(rs.getString("telefono"));
                    usuario.setRol(rs.getString("rol"));
                    
                    return usuario;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Error al obtener usuario por ID: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    /**
     * Actualizar un usuario
     * @param usuario UsuarioDTO con los datos actualizados
     * @return boolean true si se actualizó exitosamente
     */
    public boolean actualizarUsuario(UsuarioDTO usuario) {
        String sql = "UPDATE usuarios SET nombre = ?, documento = ?, correo = ?, telefono = ?, rol = ? WHERE id = ?";
        
        try (Connection con = Conexion.getNuevaConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getDocumento());
            ps.setString(3, usuario.getCorreo());
            ps.setString(4, usuario.getTelefono());
            ps.setString(5, usuario.getRol());
            ps.setInt(6, usuario.getId());
            
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
            
        } catch (SQLException e) {
            System.err.println("Error al actualizar usuario: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Eliminar un usuario
     * @param id ID del usuario a eliminar
     * @return boolean true si se eliminó exitosamente
     */
    public boolean eliminarUsuario(int id) {
        String sql = "DELETE FROM usuarios WHERE id = ?";
        
        try (Connection con = Conexion.getNuevaConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
            
        } catch (SQLException e) {
            System.err.println("Error al eliminar usuario: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Validar credenciales de usuario para login
     * @param correo Correo del usuario
     * @param contrasena Contraseña sin encriptar
     * @return UsuarioDTO usuario si las credenciales son válidas, null si no
     */
    public UsuarioDTO validarCredenciales(String correo, String contrasena) {
        System.out.println("🔍 UsuarioDAO.validarCredenciales() - Validando: " + correo);
        
        String sql = "SELECT * FROM usuarios WHERE correo = ?";
        
        try (Connection con = Conexion.getNuevaConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            System.out.println("🔍 Consultando base de datos para: " + correo);
            ps.setString(1, correo);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String contrasenaEncriptada = rs.getString("contrasena");
                    System.out.println("🔍 Usuario encontrado en BD, verificando contraseña");
                    System.out.println("🔍 Contraseña en BD: " + contrasenaEncriptada.substring(0, Math.min(10, contrasenaEncriptada.length())) + "...");
                    
                    boolean esValida = false;
                    
                    // Verificar si la contraseña está encriptada con BCrypt
                    if (contrasenaEncriptada.startsWith("$2a$") || 
                        contrasenaEncriptada.startsWith("$2b$") || 
                        contrasenaEncriptada.startsWith("$2y$")) {
                        // Contraseña encriptada con BCrypt
                        try {
                            esValida = BCrypt.checkpw(contrasena, contrasenaEncriptada);
                            System.out.println("🔍 Validando con BCrypt: " + esValida);
                        } catch (Exception e) {
                            System.err.println("❌ Error al validar con BCrypt: " + e.getMessage());
                            esValida = false;
                        }
                    } else {
                        // Contraseña en texto plano
                        esValida = contrasena.equals(contrasenaEncriptada);
                        System.out.println("🔍 Validando texto plano: " + esValida);
                        
                        // Si coincide, actualizar a BCrypt para mayor seguridad
                        if (esValida) {
                            try {
                                String nuevaContrasenaEncriptada = BCrypt.hashpw(contrasena, BCrypt.gensalt());
                                String updateSql = "UPDATE usuarios SET contrasena = ? WHERE id = ?";
                                try (PreparedStatement updatePs = con.prepareStatement(updateSql)) {
                                    updatePs.setString(1, nuevaContrasenaEncriptada);
                                    updatePs.setInt(2, rs.getInt("id"));
                                    updatePs.executeUpdate();
                                    System.out.println("✅ Contraseña actualizada a BCrypt");
                                }
                            } catch (Exception e) {
                                System.err.println("⚠️ No se pudo actualizar contraseña a BCrypt: " + e.getMessage());
                            }
                        }
                    }
                    
                    if (esValida) {
                        System.out.println("✅ Contraseña válida");
                        UsuarioDTO usuario = new UsuarioDTO();
                        usuario.setId(rs.getInt("id"));
                        usuario.setNombre(rs.getString("nombre"));
                        usuario.setDocumento(rs.getString("documento"));
                        usuario.setCorreo(rs.getString("correo"));
                        usuario.setTelefono(rs.getString("telefono"));
                        
                        // Normalizar el rol
                        String rol = rs.getString("rol");
                        System.out.println("🔍 Rol en BD: " + rol);
                        
                        // Mapear roles si es necesario
                        if ("lector".equals(rol)) {
                            rol = "usuario";
                            System.out.println("🔍 Rol convertido a: " + rol);
                        }
                        
                        usuario.setRol(rol);
                        System.out.println("✅ Usuario autenticado: " + usuario.getNombre() + " (" + usuario.getRol() + ")");
                        
                        return usuario;
                    } else {
                        System.out.println("❌ Contraseña incorrecta para: " + correo);
                    }
                } else {
                    System.out.println("❌ Usuario no encontrado en BD: " + correo);
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error SQL al validar credenciales: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("❌ Error general al validar credenciales: " + e.getMessage());
            e.printStackTrace();
        }
        
        System.out.println("❌ Credenciales no válidas para: " + correo);
        return null;
    }
    
    /**
     * Verificar si existe un usuario con el correo dado
     * @param correo Correo a verificar
     * @return boolean true si existe
     */
    public boolean existeCorreo(String correo) {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE correo = ?";
        
        try (Connection con = Conexion.getNuevaConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, correo);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Error al verificar correo: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Verificar si existe un usuario con el documento dado
     * @param documento Documento a verificar
     * @return boolean true si existe
     */
    public boolean existeDocumento(String documento) {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE documento = ?";
        
        try (Connection con = Conexion.getNuevaConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, documento);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Error al verificar documento: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Cambiar contraseña de usuario
     * @param idUsuario ID del usuario
     * @param nuevaContrasena Nueva contraseña
     * @return boolean true si se cambió exitosamente
     */
    public boolean cambiarContrasena(int idUsuario, String nuevaContrasena) {
        String sql = "UPDATE usuarios SET contrasena = ? WHERE id = ?";
        
        try (Connection con = Conexion.getNuevaConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, BCrypt.hashpw(nuevaContrasena, BCrypt.gensalt()));
            ps.setInt(2, idUsuario);
            
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
            
        } catch (SQLException e) {
            System.err.println("Error al cambiar contraseña: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Método de diagnóstico para verificar conexión y usuarios (TEMPORAL)
     */
    public void diagnosticarConexionYUsuarios() {
        System.out.println("=== DIAGNÓSTICO DE CONEXIÓN Y USUARIOS ===");
        
        try (Connection con = Conexion.getNuevaConexion()) {
            System.out.println("✅ Conexión a BD exitosa");
            
            // Verificar si la tabla usuarios existe
            String checkTableSql = "SHOW TABLES LIKE 'usuarios'";
            try (PreparedStatement ps = con.prepareStatement(checkTableSql);
                 ResultSet rs = ps.executeQuery()) {
                
                if (rs.next()) {
                    System.out.println("✅ Tabla 'usuarios' existe");
                } else {
                    System.out.println("❌ Tabla 'usuarios' NO existe");
                    return;
                }
            }
            
            // Contar usuarios
            String countSql = "SELECT COUNT(*) as total FROM usuarios";
            try (PreparedStatement ps = con.prepareStatement(countSql);
                 ResultSet rs = ps.executeQuery()) {
                
                if (rs.next()) {
                    int total = rs.getInt("total");
                    System.out.println("📊 Total de usuarios en BD: " + total);
                }
            }
            
            // Mostrar usuarios existentes
            String usersSql = "SELECT id, nombre, correo, rol, " +
                             "CASE WHEN contrasena LIKE '$2%' THEN 'BCrypt' ELSE 'Texto plano' END as tipo_contrasena " +
                             "FROM usuarios ORDER BY id";
            
            try (PreparedStatement ps = con.prepareStatement(usersSql);
                 ResultSet rs = ps.executeQuery()) {
                
                System.out.println("👥 Usuarios en la base de datos:");
                System.out.println("ID | Nombre | Correo | Rol | Tipo Contraseña");
                System.out.println("---|--------|--------|-----|----------------");
                
                while (rs.next()) {
                    System.out.printf("%d | %s | %s | %s | %s%n",
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("correo"),
                        rs.getString("rol"),
                        rs.getString("tipo_contrasena")
                    );
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error de conexión: " + e.getMessage());
            e.printStackTrace();
        }
        
        System.out.println("=== FIN DIAGNÓSTICO ===\n");
    }
}