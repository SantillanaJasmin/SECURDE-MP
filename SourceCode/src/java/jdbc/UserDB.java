/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Name;
import model.User;

/**
 *
 * @author Joy
 */
public class UserDB {
    private User user;
    private DatabaseConnection dbc;
    private Connection conn;
    private PreparedStatement stmt;
    
    public UserDB() {
        user = new User();
        dbc = new DatabaseConnection();
        conn = null;
        stmt = null;
    }
    
    public User signIn(String username) {  
        try {
            conn = (Connection) dbc.getConnection();
            String sql = "SELECT * FROM useraccount "
                    + " WHERE user_name = ? AND active = 1";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            
            ResultSet result = stmt.executeQuery();
            
            if(result.next()) {
                user.setUserId(result.getInt("user_id"));
                user.setAttempts(result.getInt("attempts"));
                user.setUsername(result.getString("user_name"));
                user.setPassword(result.getString("password"));
                user.setAccountType(result.getInt("account_type_id"));
                user.setEmail(result.getString("email"));
                Name name = new Name();
                name.setFirstName(result.getString("first_name"));
                name.setMiddleInitial(result.getString("middle_initial"));
                name.setLastName(result.getString("last_name"));
                user.setName(name);
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if(stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se) {
            }
            try {
                if(conn != null) {
                    conn.close();
                }
            } catch(SQLException se){
                se.printStackTrace();
            }
        }
        return user;
    }
    
    /* this is for failed login attempts */
    public boolean setLoginAttempt(User user) {
        boolean updated = false;
        Connection conn = null;
        PreparedStatement stmt = null;
        int result = 0;
        
        try {
            DatabaseConnection dbc = new DatabaseConnection();
            conn = dbc.getConnection();
            String sql = "UPDATE useraccount SET attempt = ? "
                    + " WHERE username = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, user.getAttempts());
            stmt.setString(2, user.getUsername());
            
            result = stmt.executeUpdate();
            if(result == 1) {
                updated = true;
            } 
            
            if(user.getAttempts() > 5) {
                sql = "UPDATE useraccount SET active = ? "
                        + " WHERE username = ?";
                stmt.setInt(1, 0); 
                stmt.setString(2, user.getUsername());
                
                int lockout = stmt.executeUpdate();
                if(lockout == 1) {
                    // lockout account
                }
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if(stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se) {
            }
            try {
                if(conn != null) {
                    conn.close();
                }
            } catch(SQLException se){
                se.printStackTrace();
            }
        }
        return updated;
    }
    
    public boolean addUser(User user) {
        boolean added = false;
        Connection conn = null;
        PreparedStatement stmt = null;
        int result = 0;
        
        try {
            DatabaseConnection dbc = new DatabaseConnection();
            conn = dbc.getConnection();
            String sql = "INSERT INTO useraccount "
                    + "(user_name, password, account_type_id, first_name,"
                    + " middle_initial, last_name, email, attempts, active) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, 0, 1)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setInt(3, user.getAccountType());
            Name name = user.getName();
            stmt.setString(4, name.getFirstName());
            stmt.setString(5, name.getMiddleInitial());
            stmt.setString(6, name.getLastName());
            stmt.setString(7, user.getEmail());
            
            result = stmt.executeUpdate();
            if(result == 1) {
                added = true;
            } 
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if(stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se) {
            }
            try {
                if(conn != null) {
                    conn.close();
                }
            } catch(SQLException se){
                se.printStackTrace();
            }
        }
        return added;
    }
}
