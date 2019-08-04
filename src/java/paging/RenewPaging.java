/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paging;

import dao.BookDAO;
import dao.Student_BooksDAO;
import java.io.Serializable;
import java.util.List;
import model.Book;
import model.Student_Books;

/**
 *
 * @author Hoang Cao
 */
public class RenewPaging implements Serializable {

    private int pageSize; // số lượng sản phẩm trên một trang
    private int page; // số trang đang hiển thị
    private List<Student_Books> books;
    private int numPage;
    private String search;

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public RenewPaging() {
        page = 1;
        pageSize = 5;
        search = "";
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

    public List<Student_Books> getBooks() throws Exception {
        int from = (page - 1) * pageSize + 1;
        int to = page * pageSize;
        return books = new Student_BooksDAO().search(from, to, search);
    }

    public void setBooks(List<Student_Books> books) {
        this.books = books;
    }

    public int getNumPage() throws Exception {
        int n = new Student_BooksDAO().selectAllStudentBooks(search).size();
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
