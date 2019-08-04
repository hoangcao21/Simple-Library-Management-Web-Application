/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author nguye
 */
public class Student {

    int id;
    String name, email, phone;
    String account_id;

    public Student() {
    }

    public Student(int id, String name, String email, String phone, String accid) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.account_id = accid;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getAccount_id() {
        return account_id;
    }

}
