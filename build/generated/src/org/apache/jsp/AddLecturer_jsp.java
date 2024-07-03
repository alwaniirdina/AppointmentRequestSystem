package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class AddLecturer_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Add Lecturer</title>\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                font-family: Arial, sans-serif;\n");
      out.write("                background-color: #f4f4f4;\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 20px;\n");
      out.write("            }\n");
      out.write("            .container {\n");
      out.write("                max-width: 400px;\n");
      out.write("                margin: auto;\n");
      out.write("                background: white;\n");
      out.write("                padding: 20px;\n");
      out.write("                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n");
      out.write("            }\n");
      out.write("            h1 {\n");
      out.write("                text-align: center;\n");
      out.write("                color: #333;\n");
      out.write("            }\n");
      out.write("            input[type=\"text\"], input[type=\"password\"], select {\n");
      out.write("                width: 100%;\n");
      out.write("                padding: 10px;\n");
      out.write("                margin: 10px 0;\n");
      out.write("                border: 1px solid #ddd;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("            button {\n");
      out.write("                width: 100%;\n");
      out.write("                background-color: #4CAF50;\n");
      out.write("                color: white;\n");
      out.write("                border: none;\n");
      out.write("                padding: 10px;\n");
      out.write("                cursor: pointer;\n");
      out.write("                margin-top: 10px;\n");
      out.write("            }\n");
      out.write("            button:hover {\n");
      out.write("                background-color: #45a049;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h1>Add Lecturer</h1>\n");
      out.write("            <form action=\"AddLecturerServlet\" method=\"post\">\n");
      out.write("                <label for=\"name\">Name:</label>\n");
      out.write("                <input type=\"text\" id=\"name\" name=\"name\" required><br>\n");
      out.write("                <label for=\"username\">Username:</label>\n");
      out.write("                <input type=\"text\" id=\"username\" name=\"username\" required><br>\n");
      out.write("                <label for=\"email\">Email:</label>\n");
      out.write("                <input type=\"email\" id=\"email\" name=\"email\" required><br>\n");
      out.write("                <label for=\"password\">Password:</label>\n");
      out.write("                <input type=\"password\" id=\"password\" name=\"password\" required><br>\n");
      out.write("                <label for=\"phone\">Phone No:</label>\n");
      out.write("                <input type=\"text\" id=\"phone\" name=\"phone\" required><br>\n");
      out.write("                <button type=\"submit\">Add Lecturer</button>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
