/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paging;

import dao.AccountDAO;
import dao.LogDAO;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author Hoang Cao
 */
public class RolePaging implements Serializable {

    private int pageSize; // số lượng sản phẩm trên một trang
    private int page; // số trang đang hiển thị
    private List<Account> accounts;
    private int numPage;
    private List<String> roles = new ArrayList<>();

    {
        roles.add("admin");
        roles.add("staff");
        roles.add("student");
    }

    public RolePaging() {
        page = 1;
        pageSize = 5;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public List<Account> getAccounts() throws Exception {
        int from = (page - 1) * pageSize + 1;
        int to = page * pageSize;
        return accounts = new AccountDAO().search2(from, to);
    }

    public void setAccounts(List<Account> accounts) {
        this.accounts = accounts;
    }

    public int getNumPage() throws Exception {
        int n = new AccountDAO().selectAllAccountsExceptAdmin().size();
        if (n < pageSize || (n % pageSize) != 0) {
            numPage = (n / pageSize) + 1;
        }
        if ((n % pageSize) == 0) {
            numPage = n / pageSize;
        }
        return numPage;
    }

    public void setNumPage(int numPage) {
        this.numPage = numPage;
    }

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }

}
