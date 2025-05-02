package com.doctormanagement.servlet;

import com.doctormanagement.model.Doctor;
import com.doctormanagement.util.FileUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listDoctors")
public class ListDoctorsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String filePath = getServletContext().getRealPath("/WEB-INF/data/doctors.txt");
            if (filePath == null) {
                throw new ServletException("Cannot resolve doctors.txt path");
            }
            List<Doctor> doctors = FileUtil.getAllDoctors(filePath);
            request.setAttribute("doctors", doctors);
            request.getRequestDispatcher("/list_doctors.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error retrieving doctor list: " + e.getMessage(), e);
        }
    }
}