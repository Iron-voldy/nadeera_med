package com.doctormanagement.servlet;

import com.doctormanagement.model.Doctor;
import com.doctormanagement.util.FileUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

@WebServlet("/createDoctor")
public class CreateDoctorServlet extends HttpServlet {
    private static final long MAX_FILE_SIZE = 5 * 1024 * 1024; // 5MB
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$");
    private static final Pattern PHONE_PATTERN = Pattern.compile("^\\d{10}$");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (ServletFileUpload.isMultipartContent(request)) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setFileSizeMax(MAX_FILE_SIZE);
            try {
                List<FileItem> items = upload.parseRequest(request);
                String name = null, specialty = null, phone = null, email = null, address = null, photoFileName = null;
                for (FileItem item : items) {
                    if (item.isFormField()) {
                        switch (item.getFieldName()) {
                            case "name": name = item.getString(); break;
                            case "specialty": specialty = item.getString(); break;
                            case "phone": phone = item.getString(); break;
                            case "email": email = item.getString(); break;
                            case "address": address = item.getString(); break;
                        }
                    } else if (item.getFieldName().equals("photo") && item.getSize() > 0) {
                        String contentType = item.getContentType();
                        if (!contentType.startsWith("image/") || !item.getName().matches(".*\\.(jpg|jpeg|png)$")) {
                            throw new ServletException("Only JPG, JPEG, or PNG images are allowed");
                        }
                        if (item.getSize() > MAX_FILE_SIZE) {
                            throw new ServletException("Image file size exceeds 5MB limit");
                        }
                        String uploadsDir = getServletContext().getRealPath("/Uploads");
                        if (uploadsDir == null) {
                            throw new ServletException("Cannot resolve Uploads directory path");
                        }
                        System.out.println("Uploads directory: " + uploadsDir); // Log directory
                        File uploadDir = new File(uploadsDir);
                        if (!uploadDir.exists()) uploadDir.mkdirs();
                        String originalFileName = item.getName();
                        photoFileName = System.currentTimeMillis() + "_" + originalFileName;
                        File uploadedFile = new File(uploadDir, photoFileName);
                        item.write(uploadedFile);
                        System.out.println("Uploaded file: " + uploadedFile.getAbsolutePath()); // Log file path
                    }
                }
                // Validate form fields
                if (name == null || name.trim().isEmpty()) {
                    throw new ServletException("Name is required");
                }
                if (specialty == null || specialty.trim().isEmpty()) {
                    throw new ServletException("Specialty is required");
                }
                if (phone == null || !PHONE_PATTERN.matcher(phone).matches()) {
                    throw new ServletException("Phone must be a 10-digit number");
                }
                if (email == null || !EMAIL_PATTERN.matcher(email).matches()) {
                    throw new ServletException("Invalid email format");
                }
                if (address == null || address.trim().isEmpty()) {
                    throw new ServletException("Address is required");
                }
                if (photoFileName == null) {
                    throw new ServletException("Photo is required");
                }
                String filePath = getServletContext().getRealPath("/WEB-INF/data/doctors.txt");
                if (filePath == null) {
                    throw new ServletException("Cannot resolve doctors.txt path");
                }
                int id = generateNewId(filePath);
                Doctor doctor = new Doctor(id, name.trim(), specialty.trim(), phone, email, address.trim(), photoFileName);
                FileUtil.addDoctor(doctor, filePath);
                response.sendRedirect("listDoctors");
            } catch (Exception e) {
                throw new ServletException("Error processing form: " + e.getMessage(), e);
            }
        } else {
            throw new ServletException("Multipart request expected");
        }
    }

    private int generateNewId(String filePath) throws IOException {
        List<Doctor> doctors = FileUtil.getAllDoctors(filePath);
        if (doctors.isEmpty()) {
            return 1;
        }
        return doctors.stream().mapToInt(Doctor::getId).max().getAsInt() + 1;
    }
}