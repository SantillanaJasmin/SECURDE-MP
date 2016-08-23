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

    public boolean addToCart(int productId, int userId, int quantity) {
        boolean added = false;
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
            
            int result = stmt.executeUpdate();
            if(result == 1)
                added = true;
        } catch (SQLException ex) {
            Logger.getLogger(CartDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return added;
    }
    
    public boolean removeFromCart(int productId, int userId, int quantity) {
        boolean added = false;
        PreparedStatement stmt = null;
        DatabaseConnection dbc = new DatabaseConnection();
        try {
            Connection conn = dbc.getConnection();
            String sql = "DELETE FROM cart "
                    + " WHERE product_id = ? AND user_id = ? ";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, productId);
            stmt.setInt(2, userId);
            
            int result = stmt.executeUpdate();
            if(result == 1)
                added = true;
        } catch (SQLException ex) {
            Logger.getLogger(CartDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return added;
    }
    
    public ArrayList<TransactionItem> getCart(int userId) {
        ArrayList<TransactionItem> cart = new ArrayList<TransactionItem>();
        
        DatabaseConnection dbc = new DatabaseConnection();
        try {
            Connection conn = dbc.getConnection();
            String sql = "SELECT product_name, product_price, quantity, "
                    + " (product_price*quantity) AS subtotal FROM cart, product "
                    + " WHERE cart.product_id = product.product_id "
                    + " AND user_id = ? ";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            
            ResultSet result = null;
            result = stmt.executeQuery();
            TransactionItem item;
            
            while(result.next()) {
                item = new TransactionItem();
                item.setProductName(result.getString("product_name"));
                item.setQuantity(result.getInt("quantity"));
                item.setPrice(result.getBigDecimal("product_price"));
                item.setSubtotal(result.getBigDecimal("subtotal"));
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
