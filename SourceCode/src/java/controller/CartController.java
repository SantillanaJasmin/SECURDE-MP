/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import jdbc.CartDB;
import jdbc.ProductDB;
import model.TransactionItem;

/**
 *
 * @author Joy
 */
public class CartController {
    private ArrayList<TransactionItem> cart;
    
    public CartController() {
        this.cart = new ArrayList<TransactionItem>();
    }
    
    public boolean addToCart(int userId, int productId, int quantity) {
        CartDB db = new CartDB();
        return db.addToCart(productId, userId, quantity);
    }
    
    public ArrayList<TransactionItem> getCart(int userId) {
        CartDB db = new CartDB();
        return db.getCart(userId);
    }
    
    public boolean removeFromCart(int userId, int productId, int quantity) {
        CartDB db = new CartDB();
        return db.removeFromCart(productId, userId, quantity);
    }
}
