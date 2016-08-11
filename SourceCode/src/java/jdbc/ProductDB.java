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
import model.Product;

/**
 *
 * @author Joy
 */
public class ProductDB {
    public int addProduct(Product product) {
        int id = 0;
        
        try {
            DatabaseConnection dbc = new DatabaseConnection();
            Connection conn = dbc.getConnection();
            String sql = "INSERT INTO product "
                    + "(product_category, product_name, product_desc, product_price)"
                    + " VALUES(?,?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(id, id);
            stmt.setString(2, product.getProductName());
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return id;
    }
    
    public String getCategory(int cat_id) {
        String category = null;
        
        try {
            DatabaseConnection dbc = new DatabaseConnection();
            Connection conn = dbc.getConnection();
            String sql = "SELECT category_name FROM category "
                    + "WHERE category_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, cat_id);
            
            ResultSet result;
            result = stmt.executeQuery();
            if(result!=null) {
                category = result.getString("category_name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }
    
    
}
