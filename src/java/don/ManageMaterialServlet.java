/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package don;

import com.ManageMaterialBean;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
@WebServlet(name = "ManageMaterialServlet", urlPatterns = {"/ManageMaterialServlet"})
public class ManageMaterialServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageMaterialServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageMaterialServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String appointmentIdStr = request.getParameter("getAppointmentId");

        if (appointmentIdStr != null && !appointmentIdStr.isEmpty()) {
            try {
                int appointmentId = Integer.parseInt(appointmentIdStr);
                ManageMaterialBean materialBean = new ManageMaterialBean();
                materialBean.setAppointmentId(appointmentId);

                boolean result = false;
                if ("Add File".equalsIgnoreCase(action)) {
                    Part filePart = request.getPart("file");
                    try (InputStream inputStream = filePart.getInputStream()) {
                        result = materialBean.addFile(inputStream);
                    }
                } else if ("Delete File".equalsIgnoreCase(action)) {
                    result = materialBean.deleteFile();
                }

                response.getWriter().println(result ? "Action successful." : "Action failed.");
            } catch (NumberFormatException e) {
                response.getWriter().println("Invalid appointment ID format.");
                e.printStackTrace();
            } catch (Exception e) {
                response.getWriter().println("Error: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            response.getWriter().println("Appointment ID is missing.");
        }
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
