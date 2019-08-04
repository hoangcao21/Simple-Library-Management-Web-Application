/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paging;

import dao.BookDAO;
import java.io.Serializable;
import java.util.List;
import model.Book;

/**
 *
 * @author Hoang Cao
 */
public class BookPaging implements Serializable {

    private int pageSize; // số lượng sản phẩm trên một trang
    private int page; // số trang đang hiển thị
    private List<Book> books;
    private int numPage;
    private BookDAO bookDAO;
    private String search;

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public BookPaging() {
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

    public List<Book> getBooks() throws Exception {
        int from = (page - 1) * pageSize + 1;
        int to = page * pageSize;
        return books = new BookDAO().search(from, to, search);
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    public int getNumPage() throws Exception {
        int n = new BookDAO().selectByNname(search).size();
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
