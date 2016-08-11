/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Joy
 */
public enum OrderStatus {
    PENDING, /* customer ordered online */
    PAID, /* customer paid */
    SENT, /* company order to customer */
    DELIVERED /* customer received order */
    
    /* I am not sure how to fix this 
    @Override
    public String toString() {
        switch(this) {
            case PAID: return "PAID";
            case SENT: return "SENT";
            case DELIVERED: return "DELIVERED";
            case PENDING: 
            default: return "PENDING";
        }
    } */
}
