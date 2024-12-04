
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection con;
    public Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // Conexion a la base de datos 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/slg_system","root","");
        } catch (Exception e) {
        }
        System.out.println("Conexión exitosa a la base de datos.");
        return con;
    }
}
