/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.Date;
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
public class LogDAO {

    Connection con;

    public LogDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(LogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertLog(Log log) {
        String sql = "INSERT INTO [libraryMS].[dbo].[Log] VALUES(?, ?, ?, ?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, log.getAccount_id());
            ps.setString(2, log.getRole());
            ps.setString(3, log.getOperation());
            ps.setTimestamp(4, log.getDate_and_time());
            int count = ps.executeUpdate();
            System.out.println("Insert LOG count: " + count);

        } catch (SQLException ex) {
            Logger.getLogger(LogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Log> selectLogs() {
        ArrayList<Log> logs = new ArrayList<>();
        String sql = "SELECT * FROM [libraryMS].[dbo].[Log] ORDER BY date_and_time";

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String account_id = rs.getString(1);
                String role = rs.getString(2);
                String operation = rs.getString(3);
                Timestamp date_and_time = rs.getTimestamp(4);
                logs.add(new Log(account_id, role, operation, date_and_time));
            }

        } catch (SQLException ex) {
            Logger.getLogger(LogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return logs;
    }

    public List<Log> search(int from, int to) throws Exception {
        Vector<Log> logs = new Vector<>();
        Connection conn = new DBContext().getConnection();
        String sql = "{call GetLogs(?, ?)}";
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setInt(1, from);
        ps.setInt(2, to);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String no = rs.getString(1);
            String account_id = rs.getString(2);
            String role = rs.getString(3);
            String operation = rs.getString(4);
            Timestamp date_and_time = rs.getTimestamp(5);
            logs.add(new Log(no, account_id, role, operation, date_and_time));
        }
        rs.close();
        conn.close();
        return logs;
    }
}
