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
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import model.Book;

/**
 *
 * @author nguye
 */
public class BookDAO {

    public List<Book> search(int from, int to, String search) throws Exception {
        Vector<Book> books = new Vector<>();
        Connection conn = new DBContext().getConnection();
        String sql = "{call GetBooks(?, ?, ?)}";
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setInt(1, from);
        ps.setInt(2, to);
        ps.setString(3, search);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String isbn = rs.getString(1);
            String title = rs.getString(2);
            String subject = rs.getString(3);
            String publisher = rs.getString(4);
            String language = rs.getString(5);
            int numberOfPages = rs.getInt(6);
            books.add(new Book(isbn, title, subject, publisher, language, numberOfPages));
        }
        rs.close();
        conn.close();
        return books;
    }

    public List<Book> selectByNname(String a) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "Select * from Books where title like '%" + a + "%'";
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

    public List<Book> selectByISBN(String a) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "Select * from Books where isbn like '%" + a + "%'";
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

    public List<Book> selectBySubject(String a) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "Select * from Books where subject like '%" + a + "%'";
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

    public List<Book> selectByAuthorName(String a) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "Select * from Books where publisher like '%" + a + "%'";
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

    public void removeBookByISBN(String isbn) throws SQLException, Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "delete from Books where isbn = '" + isbn + "'";
        conn.prepareStatement(sql).execute();
    }

    public void addBook(Book b) throws SQLException, Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "INSERT Books ([isbn], [title], [subject], [publisher], [language], [numberOfPages])"
                + " VALUES (N'" + b.getIsbn() + "', N'" + b.getTitle() + "', N'" + b.getSubject() + "', N'" + b.getPublisher() + "', N'" + b.getLanguage() + "', " + b.getNumberOfPages() + ")";
        conn.prepareStatement(sql).execute();
        conn.close();
    }

}
