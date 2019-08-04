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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Log;

/**
 *
 * @author Hoang Cao
 */
public class AccountDAO {

    Connection con;

    public AccountDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeStatus(String id, String status) {
        String sql = "UPDATE [libraryMS].[dbo].[Accounts] SET status = ? WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, id);
            int count = ps.executeUpdate();
            System.out.println("Change Status Count: " + count);

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeRole(String id, String role) {
        String sql = "UPDATE [libraryMS].[dbo].[Accounts] SET role = ? WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, role);
            ps.setString(2, id);
            int count = ps.executeUpdate();
            System.out.println("Change Status Count: " + count);

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account selectAcccountById(String id) {
        Account acc = null;
        String sql = "SELECT * FROM [libraryMS].[dbo].[Accounts] WHERE id = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String password = rs.getString(2);
                String status = rs.getString(3);
                String role = rs.getString(4);
                acc = new Account(id, password, status, role);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return acc;
    }

    public ArrayList<Account> selectAllAccountsExceptAdmin() {
        ArrayList<Account> accounts = new ArrayList<>();

        String sql = "SELECT * FROM [libraryMS].[dbo].[Accounts] WHERE role != 'admin'";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String id = rs.getString(1);
                String password = rs.getString(2);
                String status = rs.getString(3);
                String role = rs.getString(4);
                accounts.add(new Account(id, password, status, role));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return accounts;
    }

    // Only select all accounts except ADMIN
    public List<Account> search2(int from, int to) throws Exception {
        Vector<Account> accounts = new Vector<>();
        Connection conn = new DBContext().getConnection();
        String sql = "{call GetRoles(?, ?)}";
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setInt(1, from);
        ps.setInt(2, to);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String id = rs.getString(1);
            String password = rs.getString(2);
            String status = rs.getString(3);
            String role2 = rs.getString(4);
            accounts.add(new Account(id, password, status, role2));
        }
        rs.close();
        conn.close();
        return accounts;
    }

    // Only select ACTIVE account
    public List<Account> search(int from, int to) throws Exception {
        Vector<Account> accounts = new Vector<>();
        Connection conn = new DBContext().getConnection();
        String sql = "{call GetAccounts(?, ?)}";
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setInt(1, from);
        ps.setInt(2, to);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String id = rs.getString(1);
            String password = rs.getString(2);
            String status = rs.getString(3);
            String role2 = rs.getString(4);
            accounts.add(new Account(id, password, status, role2));
        }
        rs.close();
        conn.close();
        return accounts;
    }

    // Only select ACTIVE account
    public List<Account> selectActiveAccounts() throws Exception {
        Vector<Account> accounts = new Vector<>();
        Connection conn = new DBContext().getConnection();
        String sql = "SELECT * FROM [libraryMS].[dbo].[Accounts] WHERE status = 'Active' and role != 'Admin'";
        PreparedStatement ps = conn.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String id = rs.getString(1);
            String password = rs.getString(2);
            String status = rs.getString(3);
            String role2 = rs.getString(4);
            accounts.add(new Account(id, password, status, role2));
        }
        rs.close();
        conn.close();
        return accounts;
    }
}
