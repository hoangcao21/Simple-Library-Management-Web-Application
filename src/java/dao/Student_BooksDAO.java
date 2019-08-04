/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student_Books;

/**
 *
 * @author nguye
 */
public class Student_BooksDAO {

    public List<Student_Books> search(int from, int to, String search) throws Exception {
        Vector<Student_Books> books = new Vector<>();
        Connection conn = new DBContext().getConnection();
        String sql = "{call GetStudentBooks(?, ?, ?)}";
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setInt(1, from);
        ps.setInt(2, to);
        ps.setString(3, search);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String isbn = rs.getString(1);
            String title = rs.getString(2);
            String publisher = rs.getString(3);
            java.sql.Date returnDate = rs.getDate(4);
            boolean overdue = rs.getBoolean(5);
            books.add(new Student_Books(isbn, title, publisher, returnDate, overdue));
        }
        rs.close();
        conn.close();
        System.out.println("Search student_books");
        return books;
    }

    public List<Student_Books> selectAllStudentBooks(String search) throws Exception {
        Vector<Student_Books> books = new Vector<>();
        Connection conn = new DBContext().getConnection();
        String sql = " SELECT b.isbn, b.title, b.publisher, sb.returnDate, sb.overdue\n"
                + "  from Student_Books sb, Books b\n"
                + "where sb.book_isbn = b.isbn and student_account_id = ? ORDER BY overdue desc";
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setString(1, search);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String isbn = rs.getString(1);
            String title = rs.getString(2);
            String publisher = rs.getString(3);
            java.sql.Date returnDate = rs.getDate(4);
            boolean overdue = rs.getBoolean(5);
            books.add(new Student_Books(isbn, title, publisher, returnDate, overdue));
        }
        rs.close();
        conn.close();
        System.out.println("Select all student_books");
        return books;
    }

    public void changeOverdue(String isbn, String overdue, String returnDate, String studentId) {
        String sql = "UPDATE [libraryMS].[dbo].[Student_Books] SET overdue = ?, returnDate = ? WHERE book_isbn = ? AND student_account_id = ?";
        SimpleDateFormat sdf = new SimpleDateFormat();
        sdf.applyPattern("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        java.util.Date temp;
        cal.setTime(new java.util.Date());
        cal.add(Calendar.DATE, 7);
        temp = cal.getTime();
        System.out.println("Check temp: " + temp);
        int t = 0;
        if (overdue.equalsIgnoreCase("true")) {
            t = 0;
        } else {
            t = 0;
        }
        try {
            PreparedStatement ps = new DBContext().getConnection().prepareStatement(sql);
            ps.setInt(1, t);
            ps.setDate(2, new java.sql.Date(temp.getTime()));
            ps.setString(3, isbn);
            ps.setString(4, studentId);
            int count = ps.executeUpdate();
            System.out.println("count = " + count);
        } catch (Exception ex) {
            Logger.getLogger(Student_BooksDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
