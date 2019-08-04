/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Vector;
import model.Account;
import model.Book;
import model.Student;

/**
 *
 * @author nguye
 */
public class StudentDAO {

    public List<Student> search(String a) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "Select * from Students";
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        List<Student> s = new Vector();
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("studentName");
            String email = rs.getString("email");
            String phone = rs.getString("phoneNumber");
            String accid = rs.getString("account_id");
            s.add(new Student(id, name, email, phone, accid));
        }
        rs.close();
        conn.close();
        return s;
    }

    public List<Book> searchStudentBook(String a) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "select * from Books where isbn in (select book_isbn from Student_Books where student_account_id = '" + a + "')";
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        List<Book> s = new Vector();
        while (rs.next()) {
            String isbn = rs.getString("isbn");
            String title = rs.getString("title");
            String subject = rs.getString("subject");
            String publisher = rs.getString("publisher");
            String language = rs.getString("language");
            int npage = rs.getInt("numberOfPages");
            s.add(new Book(isbn, title, subject, publisher, language, npage));
        }
        rs.close();
        conn.close();
        return s;
    }

    public List<Book> search(int from, int to, String isbnIn) throws Exception {
        Vector<Book> stubooks = new Vector<>();
        Connection conn = new DBContext().getConnection();
        String sql = "{call GetStuBooks(?, ?, ?)}";
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setInt(1, from);
        ps.setInt(2, to);
        ps.setString(3, isbnIn);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String isbn = rs.getString("isbn");
            String title = rs.getString("title");
            String subject = rs.getString("subject");
            String publisher = rs.getString("publisher");
            String language = rs.getString("language");
            int npage = rs.getInt("numberOfPages");
            stubooks.add(new Book(isbn, title, subject, publisher, language, npage));
        }
        rs.close();
        conn.close();
        return stubooks;
    }

    public List<Book> searchStudentInfo(int from, int to) throws Exception {
        Vector<Book> stubooks = new Vector<>();
        Connection conn = new DBContext().getConnection();
        String sql = "{call GetStudents(?, ?)}";
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setInt(1, from);
        ps.setInt(2, to);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String isbn = rs.getString("isbn");
            String title = rs.getString("title");
            String subject = rs.getString("subject");
            String publisher = rs.getString("publisher");
            String language = rs.getString("language");
            int npage = rs.getInt("numberOfPages");
            stubooks.add(new Book(isbn, title, subject, publisher, language, npage));
        }
        rs.close();
        conn.close();
        return stubooks;
    }

    public List<Student> searchStudentInfo(String accountID) throws Exception {
        Vector<Student> stubooks = new Vector<>();
        Connection conn = new DBContext().getConnection();
        String sql = "select * from Students where account_id='" + accountID + "'";
        PreparedStatement ps = conn.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String studentName = rs.getString("studentName");
            String email = rs.getString("email");
            String phoneNumber = rs.getString("phoneNumber");
            String account_id = rs.getString("account_id");
            stubooks.add(new Student(id, studentName, email, phoneNumber, account_id));
        }
        rs.close();
        conn.close();
        return stubooks;
    }

    public void addBookReserve(Account a, Book b) throws Exception {
        if (!a.getRole().equalsIgnoreCase("student")) {
            return;
        }
        String id = a.getId();
        String isbn = b.getIsbn();
        Date returnDate = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(returnDate);
        cal.add(Calendar.DATE, 14); //minus number would decrement the days
        returnDate = cal.getTime();

        SimpleDateFormat sdf = new SimpleDateFormat();
        sdf.applyPattern("yyyy-MM-dd");
        System.out.println("new SimpleDateFormat().format(returnDate): " + sdf.format(returnDate));
        Connection conn = new DBContext().getConnection();
        String sql = "insert into student_books values ('" + id + "', '" + isbn + "', '" + sdf.format(returnDate) + "', 0)";
        conn.prepareStatement(sql).execute();
        conn.close();
    }
}
