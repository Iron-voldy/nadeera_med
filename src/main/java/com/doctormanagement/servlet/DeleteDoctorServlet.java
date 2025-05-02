package com.doctormanagement.servlet;

import com.doctormanagement.util.FileUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteDoctor")
public class DeleteDoctorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String filePath = getServletContext().getRealPath("/WEB-INF/data/doctors.txt");
        FileUtil.deleteDoctor(id, filePath);
        response.sendRedirect("listDoctors");
    }
}