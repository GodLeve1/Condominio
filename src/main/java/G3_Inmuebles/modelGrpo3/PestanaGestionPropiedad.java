/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package G3_Inmuebles.modelGrpo3;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.*;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author joel.piuri
 */
public class PestanaGestionPropiedad {
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=Condominio;trustServerCertificate=true";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    public static void EnviarReguistro(String Cedula, String Nombre, String numeroBloque, String tipoPiso, int idEntero) {
        String query = "INSERT INTO GESTION_PROPIEDADES (CEDULA , NOMBRE , NUM_BLOQUE, TIPO_PISO, NUM_DEPARTAMENTO) VALUES (?, ?, ?, ?, ?)";
        
        try (
            Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement statement = connection.prepareStatement(query);
        ) {
            statement.setString(1, Cedula);
            statement.setString(2, Nombre);
            statement.setString(3, numeroBloque);
            statement.setString(4, tipoPiso);
            statement.setInt(5, idEntero);
            
            // Ejecutar la consulta para insertar la reserva
            statement.executeUpdate();
            System.out.println("Reserva enviada correctamente a la base de datos.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    
    
    
    }
    
}
