/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import jdbc.ProductDB;
import model.Product;
import model.Review;

/**
 *
 * @author Joy
 */
public class ProductController {
    /* add check user type*/
    public boolean addProduct(String category, String name, String description, double price) {
        ProductDB db = new ProductDB();
        BigDecimal prices = BigDecimal.valueOf(price);
        Product product = new Product();
        product.setProductName(name);
        product.setProductCategory(category);
        product.setProductDescription(description);
        product.setProductPrice(prices);
        
        int categoryId = db.getCategoryId(category);
        
        boolean added = false;
        if(db.addProduct(product, categoryId) == 1)
            added = true;
        
        return added;
    }
    
    public ArrayList<Product> getProducts() {
        ProductDB db = new ProductDB();
        return db.getProducts();
    }
    
    public ArrayList<Product> getProduct(String category) {
        ProductDB db = new ProductDB();
        return db.getProducts(category);
    }
    
    public ArrayList<Review> getProductReviews(int productId) {
        ProductDB db = new ProductDB();
        return db.getProductReviews(productId);
    }
    
    public Product getProduct(int productId) {
        ProductDB db = new ProductDB();
        return db.getProduct(productId);
    }
    
    public boolean editProduct(Product product, String name, String description, 
            double price) {
        ProductDB db = new ProductDB();
        if(name != null) {
            product.setProductName(name);
        }
        if(description != null) {
            product.setProductDescription(description);
        }
        if(price != 0) {
            BigDecimal prices = BigDecimal.valueOf(price);
            product.setProductPrice(prices);
        }
        return db.editProduct(product);
    }
}
