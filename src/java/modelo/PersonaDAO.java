package modelo;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;

public class PersonaDAO implements Validar {
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    @Override
    public int validar(Persona per) {
        int r = 0;
        // Consulta a la base de datos que coincida con los campos ingresados en el Login.
        String sql = "SELECT * FROM usuarios WHERE usuario = ? AND contrasena = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql); 
            ps.setString(1, per.getUsuario());
            ps.setString(2, per.getContrasena());
            rs = ps.executeQuery();
            while (rs.next()) {                
                r = r + 1;
                per.setUsuario(rs.getString("usuario"));
                per.setContrasena(rs.getString("contrasena"));
            }
            if (r == 1) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            System.out.println("Error en validar: " + e.getMessage()); // imprime el error para depuración
            return 0; // agrega una devolución por defecto en caso de error
        }
    }
    
}

