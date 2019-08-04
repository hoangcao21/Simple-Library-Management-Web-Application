/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.LogDAO;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Hoang Cao
 */
public class Log implements Serializable {

    private String no;
    private String account_id;
    private String role;
    private String operation;
    private Timestamp date_and_time;
    private ArrayList<Log> logs;

    public Log() {

    }

    // This constructor is used only for admin_homepage.jsp
    public Log(String no, String account_id, String role, String operation, Timestamp date_and_time) {
        this.no = no;
        this.account_id = account_id;
        this.role = role;
        this.operation = operation;
        this.date_and_time = date_and_time;
    }

    public Log(String account_id, String role, String operation, Timestamp date_and_time) {
        this.account_id = account_id;
        this.role = role;
        this.operation = operation;
        this.date_and_time = date_and_time;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getAccount_id() {
        return account_id;
    }

    public void setAccount_id(String account_id) {
        this.account_id = account_id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public Timestamp getDate_and_time() {
        return date_and_time;
    }

    public void setDate_and_time(Timestamp date_and_time) {
        this.date_and_time = date_and_time;
    }

    public ArrayList<Log> getLogs() {
        return logs = new LogDAO().selectLogs();
    }

    public void setLogs(ArrayList<Log> logs) {
        this.logs = logs;
    }

}
