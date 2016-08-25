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
    
    public boolean editProduct(int id, String name, String desc, String price) {
        ProductDB db = new ProductDB();
        boolean isEdited = db.editProduct(id, name, desc, price);
        if(isEdited) {
            return true;
        }
        return false;
    }
    
    public boolean deleteProduct(String name) {
        ProductDB db = new ProductDB();
        boolean isDeleted = db.deleteProduct(name);
        if(isDeleted) {
            return true;
        }
        return false;
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
    
}
