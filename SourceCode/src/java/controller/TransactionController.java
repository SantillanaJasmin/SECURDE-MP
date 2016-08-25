/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import jdbc.CartDB;
import jdbc.ProductDB;
import jdbc.TransactionDB;
import model.Address;
import model.Transaction;
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
    
    public boolean addToCart(int userId, int productId, int quantity) {
        CartDB db = new CartDB();
        return db.addToCart(userId, productId, quantity);
    }
    
    public ArrayList<TransactionItem> getCart(int userId) {
        CartDB db = new CartDB();
        return db.getCart(userId);
    }
    
    public boolean checkOut(int userId, Address billAddress, Address shipAddress, String creditCardNo) throws SQLException {
        CartDB cartDB = new CartDB();
        ArrayList<TransactionItem> cart = cartDB.getCart(userId);
        Transaction transaction = new Transaction();
        transaction.setUserId(userId);
        transaction.setBillAddress(billAddress);
        transaction.setShipAddress(shipAddress);
        transaction.setCreditCardNo(creditCardNo);
        transaction.setTransactionItems(cart);
        /* calculate total */
        BigDecimal total = BigDecimal.ZERO;
        for(int i = 0; i < cart.size(); i++) {
            total.add(cart.get(i).getSubtotal());
        }
        transaction.setTotalPrice(total);
        TransactionDB transDB = new TransactionDB();
        return transDB.AddTransaction(transaction);
    }
    
    public ArrayList<TransactionItem> getSales() throws SQLException {
        TransactionDB db = new TransactionDB();
        return db.viewSales();
    }
}
