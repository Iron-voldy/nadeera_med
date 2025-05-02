package com.doctormanagement.servlet;

import com.doctormanagement.model.Doctor;
import com.doctormanagement.util.FileUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editDoctor")
public class EditDoctorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String filePath = getServletContext().getRealPath("/WEB-INF/data/doctors.txt");
        Doctor doctor = FileUtil.getDoctorById(id, filePath);
        request.setAttribute("doctor", doctor);
        request.getRequestDispatcher("edit_doctor.jsp").forward(request, response);
    }
}