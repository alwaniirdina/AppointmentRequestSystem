package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=devic width, initial-scale=1.0\">\n");
      out.write("    <title>Appointment Request System</title>\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            font-family: Arial, sans-serif;\n");
      out.write("            background-color: #e0f7fa; /* Adjusted background color */\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            display: flex;\n");
      out.write("            align-items: center;\n");
      out.write("            justify-content: center;\n");
      out.write("            height: 100vh;\n");
      out.write("        }\n");
      out.write("        .container {\n");
      out.write("            max-width: 400px;\n");
      out.write("            width: 100%;\n");
      out.write("            background: white;\n");
      out.write("            padding: 20px;\n");
      out.write("            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("        h1 {\n");
      out.write("            color: #333;\n");
      out.write("        }\n");
      out.write("        header {\n");
      out.write("            background-color: #00796b; /* Header background color */\n");
      out.write("            color: white;\n");
      out.write("            padding: 10px 0;\n");
      out.write("            width: 100%;\n");
      out.write("            text-align: center;\n");
      out.write("            position: fixed;\n");
      out.write("            top: 0;\n");
      out.write("        }\n");
      out.write("        input[type=\"text\"], input[type=\"password\"], select {\n");
      out.write("            width: 100%;\n");
      out.write("            padding: 10px;\n");
      out.write("            margin: 10px 0;\n");
      out.write("            border: 1px solid #ddd;\n");
      out.write("            box-sizing: border-box;\n");
      out.write("        }\n");
      out.write("        button {\n");
      out.write("            width: 100%;\n");
      out.write("            background-color: #4CAF50;\n");
      out.write("            color: white;\n");
      out.write("            border: none;\n");
      out.write("            padding: 10px;\n");
      out.write("            cursor: pointer;\n");
      out.write("        }\n");
      out.write("        button:hover {\n");
      out.write("            background-color: #45a049;\n");
      out.write("        }\n");
      out.write("        .register-link {\n");
      out.write("            margin-top: 10px;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <header>\n");
      out.write("        <h1>Appointment Request System</h1>\n");
      out.write("    </header>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h1>Login</h1>\n");
      out.write("        <form action=\"LoginServlet\" method=\"post\">\n");
      out.write("            <label for=\"username\">Username:</label>\n");
      out.write("            <input type=\"text\" id=\"username\" name=\"username\" required>\n");
      out.write("            <label for=\"password\">Password:</label>\n");
      out.write("            <input type=\"password\" id=\"password\" name=\"password\" required>\n");
      out.write("            <label for=\"role\">Role:</label>\n");
      out.write("            <select id=\"role\" name=\"role\" required>\n");
      out.write("                <option value=\"\">Select your role</option>\n");
      out.write("                <option value=\"student\">Student</option>\n");
      out.write("                <option value=\"lecturer\">Lecturer</option>\n");
      out.write("                <option value=\"admin\">Admin</option>\n");
      out.write("            </select>\n");
      out.write("            <button type=\"submit\">Login</button>\n");
      out.write("        </form>\n");
      out.write("        <div class=\"register-link\">\n");
      out.write("            <p>Don't have an account? <a href=\"register.jsp\">Register here</a></p>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
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
