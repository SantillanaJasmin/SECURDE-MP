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
    private boolean isAdded = false;

    public UserController() {

    }

    public boolean signIn(String username, String password) {
        UserDB userDB = new UserDB();
        User user = userDB.signIn(username);
        PasswordHashing ph = new PasswordHashing();
        if (user.getUsername().equals(username)) {
            if (ph.checkPassword(password, user.getPassword())) {
                if(user.isActive()) {
                    valid = true;
                    /* set attempts = 0 */
                    user.setAttempts(0);
                    userDB.setLoginAttempt(user);
                    System.out.println("Successfully signed in!");
                } else {
                    System.out.println("Account is not active, please contact administrator!");
                }
            } else { /* password is not correct */
                user.setAttempts(user.getAttempts() + 1);
                userDB.setLoginAttempt(user);
                System.out.println("Invalid username and/or password!");
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
        
        isAdded = userDB.addUser(user);
        
        if(isAdded == true) {
            System.out.println("Successfully added new user!");
        } else {
            System.out.println("Failed to add user!");
        }
        
        return isAdded;
    }
    
    public boolean setAccountActive(User user, boolean active) {
        boolean setActive = false;
        /* check first whether current user has this priviledge */
        UserDB db = new UserDB();
        int set = 0;
        if(active) {
            set = 1;
        }
        setActive = db.setActiveAccount(user.getUsername(), set);
        if(set == 1) {
            user.setAttempts(0);
            db.setLoginAttempt(user);
        }
        return setActive;
    }
    
    public User getUser(String username){
        UserDB userDB = new UserDB();
        return userDB.signIn(username);
    }
}
