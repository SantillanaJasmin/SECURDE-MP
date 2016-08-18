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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.TransactionItem;

/**
 *
 * @author Joy
 */
public class CartDB {

    public int addToCart(int productId, int userId, int quantity) {
        int cartId = 0;
        PreparedStatement stmt = null;
        DatabaseConnection dbc = new DatabaseConnection();
        try {
            Connection conn = dbc.getConnection();
            String sql = "INSERT INTO cart (product_id, user_id, quantity) "
                    + " VALUES (?,?,?) ";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, productId);
            stmt.setInt(2, userId);
            stmt.setInt(3, quantity);
            
            cartId = stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return cartId;
    }
    
    public ArrayList<TransactionItem> getCart(int userId) {
        ArrayList<TransactionItem> cart = new ArrayList<TransactionItem>();
        
        DatabaseConnection dbc = new DatabaseConnection();
        try {
            Connection conn = dbc.getConnection();
            String sql = "SELECT * FROM getCart "
                    + " WHERE user_id = ? ";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            
            ResultSet result = null;
            result = stmt.executeQuery();
            TransactionItem item;
            
            while(result.next()) {
                item = new TransactionItem();
                item.setProductId(result.getInt("product_id"));
                item.setQuantity(result.getInt("quantity"));
                cart.add(item);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CartDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cart;
    } 
    
    public int deleteCart(int userId) {
        int deleted = 0;
        
        DatabaseConnection dbc = new DatabaseConnection();
        try {
            Connection conn = dbc.getConnection();
            String sql = "DELETE FROM cart WHERE user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            
            deleted = stmt.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(CartDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deleted;
    }
}
