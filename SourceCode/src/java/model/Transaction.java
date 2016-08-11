/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Joy
 */
public class Transaction {
    private int transactionId;
    private int userId;
    private Date orderDate;
    private Address billAddress;
    private Address shipAddress;
    private OrderStatus orderStatus;
    private String creditCardNo;
    private BigDecimal totalPrice;
    private ArrayList<TransactionItem> transactionItems;
    
    /* not sure if this actually works */
    public boolean isBillShipEqual() {
        if(billAddress.equals(shipAddress))
            return true;
        else
            return false;
    }

    /**
     * @return the transactionId
     */
    public int getTransactionId() {
        return transactionId;
    }

    /**
     * @param transactionId the transactionId to set
     */
    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    /**
     * @return the userId
     */
    public int getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * @return the orderDate
     */
    public Date getOrderDate() {
        return orderDate;
    }

    /**
     * @param orderDate the orderDate to set
     */
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    /**
     * @return the billAddress
     */
    public Address getBillAddress() {
        return billAddress;
    }

    /**
     * @param billAddress the billAddress to set
     */
    public void setBillAddress(Address billAddress) {
        this.billAddress = billAddress;
    }

    /**
     * @return the shipAddress
     */
    public Address getShipAddress() {
        return shipAddress;
    }

    /**
     * @param shipAddress the shipAddress to set
     */
    public void setShipAddress(Address shipAddress) {
        this.shipAddress = shipAddress;
    }

    /**
     * @return the creditCardNo
     */
    public String getCreditCardNo() {
        return creditCardNo;
    }

    /**
     * @param creditCardNo the creditCardNo to set
     */
    public void setCreditCardNo(String creditCardNo) {
        this.creditCardNo = creditCardNo;
    }

    /**
     * @return the totalPrice
     */
    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    /**
     * @param totalPrice the totalPrice to set
     */
    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    /**
     * @return the transactionItems
     */
    public ArrayList<TransactionItem> getTransactionItems() {
        return transactionItems;
    }

    /**
     * @param transactionItems the transactionItems to set
     */
    public void setTransactionItems(ArrayList<TransactionItem> transactionItems) {
        this.transactionItems = transactionItems;
    }

    /**
     * @return the orderStatus
     */
    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    /**
     * @param orderStatus the orderStatus to set
     */
    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

}
