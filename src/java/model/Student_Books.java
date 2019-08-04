/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Hoang Cao
 */
public class Student_Books implements Serializable {

    private String isbn;
    private String title;
    private String publisher;
    private Date returnDate;
    private boolean overdue;

    public Student_Books() {

    }

    public Student_Books(String isbn, String title, String publisher, Date returnDate, boolean overdue) {
        this.isbn = isbn;
        this.title = title;
        this.publisher = publisher;
        this.returnDate = returnDate;
        this.overdue = overdue;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public boolean isOverdue() {
        return overdue;
    }

    public void setOverdue(boolean overdue) {
        this.overdue = overdue;
    }

}
