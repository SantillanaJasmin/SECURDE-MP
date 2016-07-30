/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.BCrypt;

/**
 *
 * @author Joy
 */
public class PasswordHashing {
    public String PasswordHashing(String password) {
        System.out.println("Password: "+password);
        String hashed = BCrypt.hashpw(password, BCrypt.gensalt(12));
        System.out.println("Hashed: "+hashed);
        return hashed;
    }
    
    public boolean checkPassword(String candidate, String hashed) {
        boolean valid = false;
        if(BCrypt.checkpw(candidate, hashed)) {
            valid = true;
            System.out.println("It matches");
        } else {
            System.out.println("It does not match");
        }
        return valid;
    }
        
}
