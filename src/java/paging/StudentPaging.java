/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paging;

import dao.BookDAO;
import dao.StudentDAO;
import java.io.Serializable;
import java.util.List;
import model.Book;

/**
 *
 * @author Hoang Cao
 */
public class StudentPaging implements Serializable {

    private int pageSize; // số lượng sản phẩm trên một trang
    private int page; // số trang đang hiển thị
    private List<Book> students;
    private int numPage;
    private StudentDAO studentDao;

    public StudentPaging() {
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

    public List<Book> getStudents() throws Exception {
        int from = (page - 1) * pageSize + 1;
        int to = page * pageSize;
        return students = new StudentDAO().search(from, to, "012941910-9");
    }

    public void setStudents(List<Book> students) {
        this.students = students;
    }

    public int getNumPage(String a) throws Exception {
        int n = new BookDAO().selectByNname(a).size();
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
