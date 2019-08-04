package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_005fgreen_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>Library Management System</title>\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"/LibraryMS/library.png\" type=\"image/png\" sizes=\"16x16\">\r\n");
      out.write("        <style>\r\n");
      out.write("            #header-text {\r\n");
      out.write("                color: white;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            #header {\r\n");
      out.write("                text-align: center;\r\n");
      out.write("                color: white;\r\n");
      out.write("                text-shadow: 0px 0px 8px rgba(149, 255, 74, 1);\r\n");
      out.write("                -webkit-user-select: none;  /* Chrome all / Safari all */\r\n");
      out.write("                -moz-user-select: none;     /* Firefox all */\r\n");
      out.write("                -ms-user-select: none;      /* IE 10+ */\r\n");
      out.write("                user-select: none;  \r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .flex-container {\r\n");
      out.write("                display: flex;\r\n");
      out.write("\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            body {\r\n");
      out.write("                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\r\n");
      out.write("                margin: 0px;\r\n");
      out.write("                background-repeat: no-repeat;\r\n");
      out.write("                background: #11998e;\r\n");
      out.write("                /* fallback for old browsers */\r\n");
      out.write("                background: -webkit-linear-gradient(to right, #38ef7d, #11998e);\r\n");
      out.write("                /* Chrome 10-25, Safari 5.1-6 */\r\n");
      out.write("                background: linear-gradient(to right, #38ef7d, #11998e);\r\n");
      out.write("                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .main-content {\r\n");
      out.write("                border: 4px solid black;\r\n");
      out.write("                background-color: white;\r\n");
      out.write("                padding-top: 60px;\r\n");
      out.write("                border-radius: 20px;\r\n");
      out.write("                padding-bottom: 60px;\r\n");
      out.write("                padding-left: 150px;\r\n");
      out.write("                padding-right: 150px;\r\n");
      out.write("            }\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"flex-container\" style=\"flex-direction: column;\">\r\n");
      out.write("            <div id=\"header\">\r\n");
      out.write("                <h1 id=\"header-text\">FPT Library Management System</h1>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"flex-container\" style=\"flex-direction: row; margin-top: 2%;\">\r\n");
      out.write("\r\n");
      out.write("                <div style=\"margin: auto;\">\r\n");
      out.write("                    <form class=\"main-content\" style=\"float:right;\" action=\"/LibraryMS/LoginServlet\">\r\n");
      out.write("                        <h3><span style=\"color:darkorange;\">User</span> login:</h3>\r\n");
      out.write("                        <label>Your ID:&nbsp;&nbsp;&nbsp;</label>\r\n");
      out.write("                        <input type=\"text\" name=\"account_id\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.account_id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("                        <br>\r\n");
      out.write("                        <br>\r\n");
      out.write("                        <label>Password:</label>\r\n");
      out.write("                        <input type=\"password\" name=\"password\">\r\n");
      out.write("                        <br>\r\n");
      out.write("                        <br>\r\n");
      out.write("                        <input type=\"submit\" value=\"Submit\">\r\n");
      out.write("                        <br>\r\n");
      out.write("                        <br>\r\n");
      out.write("                        <br>\r\n");
      out.write("                        <h5 style=\"color:red;margin:0px;\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h5>\r\n");
      out.write("                        <br>\r\n");
      out.write("                        <br>\r\n");
      out.write("                        <br>\r\n");
      out.write("                        <p style=\"text-align: center\">&COPY; 2019 FPT University.</p>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
