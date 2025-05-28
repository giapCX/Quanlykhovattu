
package model;

import java.util.ArrayList;


public class Account {
    private String username;
    private String password;
    private String classify_account;
    private ArrayList<Role> roles = new ArrayList<>();

    public Account() {
    }

    public Account(String username, String password, String classify_account) {
        this.username = username;
        this.password = password;
        this.classify_account = classify_account;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getClassify_account() {
        return classify_account;
    }

    public void setClassify_account(String classify_account) {
        this.classify_account = classify_account;
    }
    
    public ArrayList<Role> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<Role> roles) {
        this.roles = roles;
    }

}