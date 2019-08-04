/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paging;

import dao.LogDAO;
import java.io.Serializable;
import java.util.List;
import model.Log;

/**
 *
 * @author Hoang Cao
 */
public class LogPaging implements Serializable {

    private int pageSize; // số lượng sản phẩm trên một trang
    private int page; // số trang đang hiển thị
    private List<Log> logs;
    private int numPage;

    public LogPaging() {
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

    public List<Log> getLogs() throws Exception {
        int from = (page - 1) * pageSize + 1;
        int to = page * pageSize;
        return logs = new LogDAO().search(from, to);
    }

    public void setLogs(List<Log> logs) {
        this.logs = logs;
    }

    public int getNumPage() throws Exception {
        int n = new LogDAO().selectLogs().size();
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

}
