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
import model.Address;
import model.Transaction;
import model.TransactionItem;

/**
 *
 * @author Joy
 */
public class TransactionDB {
    
    private Connection conn;
    
    public TransactionDB() throws SQLException {
        DatabaseConnection dbc = new DatabaseConnection();
        this.conn = dbc.getConnection();
    }
    
    public boolean AddTransaction(Transaction transaction) throws SQLException {
        boolean successful = false;
        PreparedStatement stmt = null;
        PreparedStatement addItemStmt = null;
        try {
            conn.setAutoCommit(false);
            /* add address to table */
            int billAddress, shipAddress;
            
            billAddress = addAddress(transaction.getBillAddress());
            
            if(transaction.isBillShipEqual()) {
                shipAddress = billAddress;
            } else {
                shipAddress = addAddress(transaction.getShipAddress());
            }
            
            /* add transaction to table */
            String addTransaction = "INSERT INTO product "
                    + " (user_id, order_date, bill_address, ship_address, "
                    + " order_status, credit_card_no, total_price) "
                    + " VALUES (?,CURDATE(),?,?,?,?,?) ";
            stmt = conn.prepareStatement(addTransaction);
            stmt.setInt(1, transaction.getUserId());
            stmt.setInt(2, billAddress);
            stmt.setInt(3, shipAddress);
            stmt.setString(4, transaction.getOrderStatus().toString());
            stmt.setString(5, transaction.getCreditCardNo());
            stmt.setBigDecimal(6, transaction.getTotalPrice());
            
            int trans_id = stmt.executeUpdate();
            /* add items to table */
            ArrayList<TransactionItem> transactionItems = transaction.getTransactionItems();
            String addItemSQL = "INSERT INTO transactionitems "
                    + " (transaction_id, product_id, product_quantity, subtotal) "
                    + " VALUES (?,?,?,?) ";
            addItemStmt = conn.prepareStatement(addItemSQL);
            TransactionItem item;
            for(int i = 0; i < transactionItems.size(); i++) {
                item = transactionItems.get(i);
                addItemStmt.setInt(1, trans_id);
                addItemStmt.setInt(2, item.getProductId());
                addItemStmt.setInt(3, item.getQuantity());
                addItemStmt.setBigDecimal(4, item.getSubtotal());
            }
            
            conn.commit();
        } catch (SQLException e ) {
            if (conn != null) {
                try {
                    System.err.print("Transaction is being rolled back");
                    conn.rollback();
                } catch(SQLException excep) {
                }
            }
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (addItemStmt != null) {
                addItemStmt.close();
            }
            conn.setAutoCommit(true);
        }
        
        return successful;
    }
    
    public int addAddress(Address address) {
        int id = 0;
   
        try {
            String sql = "INSERT INTO address (house_no, street, subdivision, "
                    + " city, postal_code, country) "
                    + " VALUES (?,?,?,?,?,?) ";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, address.getHouseNo());
            stmt.setString(2, address.getStreet());
            stmt.setString(3, address.getSubdivision());
            stmt.setString(4, address.getCity());
            stmt.setString(5, address.getPostalCode());
            stmt.setString(6, address.getCountry());
            
            id = stmt.executeUpdate(); // if id = 0 then address is not added
            
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDB.class.getName()).log(Level.SEVERE, null, ex);
        }   
        
        return id;
    }
    
    public ArrayList<TransactionItem> viewSales() {
        ArrayList<TransactionItem> sales = new ArrayList<TransactionItem>();
        DatabaseConnection dbc = new DatabaseConnection();
        try {
            Connection conn = dbc.getConnection();
            String sql = "SELECT product.product_id, product_name, "
                    + " product_price, SUM(product_quantity) AS quantity, "
                    + " SUM(sub_total) AS total "
                    + " FROM transactionitems, product "
                    + " WHERE transactionitems.product_id = product.product_id "
                    + " GROUP BY product.product_id;";
            Statement stmt = conn.createStatement();
            
            ResultSet result = null;
            result = stmt.executeQuery(sql);
            TransactionItem item;
            
            while(result.next()) {
                item = new TransactionItem();
                item.setProductId(result.getInt("product_id"));
                item.setProductName(result.getString("product_name"));
                item.setQuantity(result.getInt("quantity"));
                item.setPrice(result.getBigDecimal("product_price"));
                item.setSubtotal(result.getBigDecimal("total"));
                sales.add(item);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CartDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sales;
    }
}
