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
    private boolean valid = false;
    
    public UserController() {
        
    }
    
    public boolean signIn(String username, String password) {
        UserDB userDB = new UserDB();
        User user = userDB.signIn(username);
        PasswordHashing ph = new PasswordHashing();
        if(user.getUsername().equals(username)) {
            if(ph.checkPassword(password, user.getPassword())) {
                valid = true;
            } else { /* password is not correct */
                user.setAttempts(user.getAttempts()+1);
                userDB.setLoginAttempt(user);
            }
        } 
        
        return valid;
    }
    /* compile details of the user in the servlet */
    public boolean signUp(String firstName, String middleInitial, String lastName, 
            String username, String password, String email, int accountType) {
        UserDB userDB = new UserDB();
        PasswordHashing ph = new PasswordHashing();
        password = ph.PasswordHashing(password);
        User user = new User(firstName, middleInitial, lastName, 
                username, password, email, accountType);
        return userDB.addUser(user);
    }
}
