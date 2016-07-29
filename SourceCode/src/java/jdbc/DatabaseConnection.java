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

/**
 *
 * @author Joy
 */
public class DatabaseConnection {

    private String userName = "root";
    private String password = "password";
    private String dbms = "dbms";
    private String serverName = "localhost";
    private int portNumber = 3306;
    private String dbName = "talaria_db";

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

        Connection conn = null;
        Properties connectionProps = new Properties();
        connectionProps.put("user", this.userName);
        connectionProps.put("password", this.password);

        if (this.dbms.equals("mysql")) {
            conn = DriverManager.getConnection(
                    "jdbc:" + this.dbms + "://"
                    + this.serverName
                    + ":" + this.portNumber + "/",
                    connectionProps);
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
}
