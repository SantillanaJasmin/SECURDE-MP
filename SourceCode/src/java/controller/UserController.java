/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import jdbc.UserDB;
import model.User;

/**
 *
 * @author Joy
 */
public class UserController {
    
    public boolean signIn(String username, String password) {
        boolean valid = false;
        UserDB userDB = new UserDB();
        User user = userDB.signIn(username);
        PasswordHashing ph = new PasswordHashing();
        if(user.getUsername().contentEquals(username)) {
            if(ph.checkPassword(password, user.getPassword())) {
                valid = true;
            } else { /* password is not correct */
                user.setAttempts(user.getAttempts()+1);
                userDB.setLoginAttempt(user);
            }
        } 
        
        return valid;
    }
}
