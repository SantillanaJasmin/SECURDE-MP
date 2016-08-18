/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import jdbc.ProductDB;
import model.TransactionItem;

/**
 *
 * @author Joy
 */
public class TransactionController {
    private ArrayList<TransactionItem> cart;
    
    public TransactionController() {
        this.cart = new ArrayList<TransactionItem>();
    }
    
    public boolean addToCart(int productId, int quantity) {
        boolean added = false;
        
        
        return added;
    }
}
