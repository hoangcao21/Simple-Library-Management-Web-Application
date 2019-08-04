/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import dao.LogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Log;

/**
 *
 * @author Hoang Cao
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // LOGIN
        String account_id = (String) request.getParameter("account_id");
        String password = (String) request.getParameter("password");

        // LOGOUT
        String logout = (String) request.getParameter("logout");

        LogDAO logDAO = new LogDAO();
        AccountDAO accountDAO = new AccountDAO();
        String url = "login_green.jsp";
        String error = "ERROR: Invalid user ID or password!!!";
        HttpSession session = request.getSession();
        int check = 0;

        /* 
        * BEGIN:
        *   LOGOUT
         */
        if (logout != null) {
            if (logout.equals("YES")) {
                System.out.println("LOGOUT = YES");
                session.removeAttribute("account");
                session.invalidate();
                check = 1;

                // Account ID parameter is received from admin_homepage.jsp
                String accountid = (String) request.getParameter("accountid");
                String role = (String) request.getParameter("role");

                // Log the operation to the database
                logDAO.insertLog(new Log(accountid, role, "LOGOUT", new java.sql.Timestamp(new java.util.Date().getTime())));
                System.out.println("Check Date: " + new java.sql.Timestamp(new java.util.Date().getTime()).toString());

                // Change status to INACTIVE
                accountDAO.changeStatus(accountid, "Inactive");
            }
        }
        /* 
        * END:
        *   LOGOUT
         */


 /* 
        * BEGIN:
        *   LOGIN
         */
        if (account_id == null || password == null || account_id.matches("\\s+") || password.equals("\\s+")) {
            if (check == 0) {
                request.setAttribute("error", error);
            }
        }

        if (account_id != null) {
            Account acc = new AccountDAO().selectAcccountById(account_id);
            if (acc == null) {
                request.setAttribute("error", error);
            } else {
                if (!acc.getPassword().equals(password)) {
                    request.setAttribute("error", error);
                } else { // If user and password is correct, then forward to homepage
                    url = acc.getRole() + "/" + acc.getRole() + "_homepage.jsp";
                    session.setAttribute("account", acc);

                    // Log the operation to the database
                    logDAO.insertLog(new Log(acc.getId(), acc.getRole(), "LOGIN", new java.sql.Timestamp(new java.util.Date().getTime())));

                    // Change status to ACTIVE
                    accountDAO.changeStatus(acc.getId(), "Active");
                }
            }
        }
        /* 
        * END:
        *   LOGIN
         */

        request.getRequestDispatcher(url).forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
