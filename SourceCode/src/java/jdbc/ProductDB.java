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
import model.Product;
import model.Review;

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
            stmt.setInt(1, getCategoryId(product.getProductCategory()));
            stmt.setString(2, product.getProductName());
            stmt.setString(3, product.getProductDescription());
            stmt.setBigDecimal(4, product.getProductPrice());
            
            id = stmt.executeUpdate(); // if id = 0 then product is not added
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return id;
    }
    
    public int getCategoryId(String category) {
        int cat_id = 0;
        try {
            DatabaseConnection dbc = new DatabaseConnection();
            Connection conn = dbc.getConnection();
            String sql = "SELECT category_id FROM category "
                    + "WHERE category_name = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, category);
            
            ResultSet result;
            result = stmt.executeQuery();
            if(result!=null) {
                cat_id = result.getInt("category_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cat_id;
    }
    
    public ArrayList<Product> getProducts() {
        ArrayList<Product> productList = new ArrayList<Product>();
        try {
            DatabaseConnection dbc = new DatabaseConnection();
            Connection conn = dbc.getConnection();
            String sql = "SELECT * FROM product, category "
                    + " WHERE product.product_category = category.category_id ";
            Statement stmt = conn.createStatement();
            
            ResultSet result;
            result = stmt.executeQuery(sql);
            Product product;
            while(result.next()) {
                product = new Product();
                product.setProductId(result.getInt("product_id"));
                product.setProductName(result.getString("product_name"));
                product.setProductCategory(result.getString("category_name"));
                product.setProductDescription(result.getString("product_desc"));
                product.setProductPrice(result.getBigDecimal("product_price"));
                productList.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }
    /* get products with filter of category */
    public ArrayList<Product> getProducts(String category) {
        ArrayList<Product> productList = new ArrayList<Product>();
        try {
            DatabaseConnection dbc = new DatabaseConnection();
            Connection conn = dbc.getConnection();
            String sql = "SELECT * FROM product, category "
                    + " WHERE product.product_category = category.category_id "
                    + " AND category.category_name = ? ";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, category);
            ResultSet result;
            result = stmt.executeQuery();
            Product product;
            while(result.next()) {
                product = new Product();
                product.setProductId(result.getInt("product_id"));
                product.setProductName(result.getString("product_name"));
                product.setProductCategory(result.getString("category_name"));
                product.setProductDescription(result.getString("product_desc"));
                product.setProductPrice(result.getBigDecimal("product_price"));
                productList.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }
    
    public ArrayList<String> getCategory() {
        ArrayList<String> categoryList = new ArrayList<String>();
        
        try {
            DatabaseConnection dbc = new DatabaseConnection();
            Connection conn = dbc.getConnection();
            String sql = "SELECT category_name FROM category ";
            Statement stmt = conn.createStatement();
            
            ResultSet result;
            result = stmt.executeQuery(sql);
            String category;
            if(result.next()) {
                category = result.getString("category_name");
                categoryList.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categoryList;
    }
    
    public ArrayList<Review> getProductReviews(int productId) {
        ArrayList<Review> reviewList = new ArrayList<Review>();
        
        try {
            DatabaseConnection dbc = new DatabaseConnection();
            Connection conn = dbc.getConnection();
            String sql = "SELECT * FROM review, useraccount "
                    + " WHERE review.user_id = useraccount.user_id "
                    + " AND review_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, productId);
            
            ResultSet result;
            result = stmt.executeQuery();
            Review review;
            if(result.next()) {
                review = new Review();
                review.setReviewId(result.getInt("review_id"));
                review.setProductId(result.getInt("product_id"));
                review.setUsername(result.getString("username"));
                review.setReviewRate(result.getInt("review_rate"));
                review.setContent(result.getString("content"));
                reviewList.add(review);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return reviewList;
    }
}
