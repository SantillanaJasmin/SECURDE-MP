/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Joy
 */
public class DatabaseConnection {

    private Connection conn = null;
    private String userName = "root";
    private String password = "password";
    private String dbms = "mysql";
    private String serverName = "localhost";
    private int portNumber = 3306;
    private String dbName = "securde_db";

    /*
     public DatabaseConnection() {
     this.userName="securde"
     this.password="p@ssword";
     this.dbms="dbms";
     this.serverName="localhost";
     this.portNumber=3306;
     this.dbName="securde_mp";
     }
     */
    public Connection getConnection() throws SQLException {

        Properties connectionProps = new Properties();
        connectionProps.put("user", this.userName);
        connectionProps.put("password", this.password);

        if (this.dbms.equals("mysql")) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                
                conn = DriverManager.getConnection(
                        "jdbc:" + this.dbms + "://"
                                + this.serverName
                                + ":" + this.portNumber + "/"
                                + this.dbName,
                        connectionProps);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (this.dbms.equals("derby")) {
            conn = DriverManager.getConnection(
                    "jdbc:" + this.dbms + ":"
                    + this.dbName
                    + ";create=true",
                    connectionProps);
        }
        System.out.println("Connected to database");
        return conn;
    }

    public void closeConnection() throws SQLException{
        conn.close();
    }
}
