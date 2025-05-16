<%-- src/main/webapp/doctors/edit.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.doctormanagement.model.Doctor" %>
<html>
<head>
    <title>MediCare - Edit Doctor</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <div class="layout-container">
        <jsp:include page="../components/sidebar.jsp">
            <jsp:param name="currentPage" value="doctors" />
        </jsp:include>

        <div class="content">
            <jsp:include page="../components/header.jsp">
                <jsp:param name="pageTitle" value="Edit Doctor" />
            </jsp:include>

            <div class="form-container">
                <h2 class="form-title">Edit Doctor Information</h2>

                <% Doctor doctor = (Doctor) request.getAttribute("doctor"); %>
                <form id="doctor-form" action="${pageContext.request.contextPath}/updateDoctor" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="<%= doctor.getId() %>">

                    <div class="form-group">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" id="name" name="name" class="form-control" value="<%= doctor.getName() %>" required>
                        <span id="name-error" class="error-message"></span>
                    </div>

                    <div class="form-group">
                        <label for="specialty" class="form-label">Specialty</label>
                        <select id="specialty" name="specialty" class="form-control" required>
                            <option value="">Select a specialty</option>
                            <option value="Cardiology" <%= doctor.getSpecialty().equals("Cardiology") ? "selected" : "" %>>Cardiology</option>
                            <option value="Dermatology" <%= doctor.getSpecialty().equals("Dermatology") ? "selected" : "" %>>Dermatology</option>
                            <option value="Endocrinology" <%= doctor.getSpecialty().equals("Endocrinology") ? "selected" : "" %>>Endocrinology</option>
                            <option value="Gastroenterology" <%= doctor.getSpecialty().equals("Gastroenterology") ? "selected" : "" %>>Gastroenterology</option>
                            <option value="Neurology" <%= doctor.getSpecialty().equals("Neurology") ? "selected" : "" %>>Neurology</option>
                            <option value="Obstetrics and Gynecology" <%= doctor.getSpecialty().equals("Obstetrics and Gynecology") ? "selected" : "" %>>Obstetrics and Gynecology</option>
                            <option value="Oncology" <%= doctor.getSpecialty().equals("Oncology") ? "selected" : "" %>>Oncology</option>
                            <option value="Ophthalmology" <%= doctor.getSpecialty().equals("Ophthalmology") ? "selected" : "" %>>Ophthalmology</option>
                            <option value="Orthopedics" <%= doctor.getSpecialty().equals("Orthopedics") ? "selected" : "" %>>Orthopedics</option>
                            <option value="Pediatrics" <%= doctor.getSpecialty().equals("Pediatrics") ? "selected" : "" %>>Pediatrics</option>
                            <option value="Psychiatry" <%= doctor.getSpecialty().equals("Psychiatry") ? "selected" : "" %>>Psychiatry</option>
                            <option value="Urology" <%= doctor.getSpecialty().equals("Urology") ? "selected" : "" %>>Urology</option>
                            <option value="Other" <%= !doctor.getSpecialty().matches("Cardiology|Dermatology|Endocrinology|Gastroenterology|Neurology|Obstetrics and Gynecology|Oncology|Ophthalmology|Orthopedics|Pediatrics|Psychiatry|Urology") ? "selected" : "" %>>Other</option>
                        </select>
                        <span id="specialty-error" class="error-message"></span>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="form-group">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="tel" id="phone" name="phone" class="form-control" value="<%= doctor.getPhone() %>" pattern="[0-9]{10}" required>
                            <span id="phone-error" class="error-message"></span>
                        </div>

                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" id="email" name="email" class="form-control" value="<%= doctor.getEmail() %>" required>
                            <span id="email-error" class="error-message"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="address" class="form-label">Address</label>
                        <textarea id="address" name="address" class="form-control" rows="3" required><%= doctor.getAddress() %></textarea>
                        <span id="address-error" class="error-message"></span>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Current Photo</label>
                        <div class="photo-preview-container">
                            <img src="${pageContext.request.contextPath}/Uploads/<%= doctor.getPhotoFileName() %>" alt="Doctor Photo" class="photo-preview" style="display: block;" onerror="this.src='${pageContext.request.contextPath}/assets/images/default-avatar.png'">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="photo" class="form-label">Upload New Photo (Optional)</label>
                        <input type="file" id="photo" name="photo" class="form-control" accept="image/jpeg,image/png">
                        <span id="photo-error" class="error-message"></span>
                        <div class="photo-preview-container">
                            <img id="photo-preview" class="photo-preview" alt="New Photo Preview">
                        </div>
                    </div>

                    <div class="form-buttons">
                        <button type="button" class="btn btn-outline" onclick="window.location.href='${pageContext.request.contextPath}/listDoctors'">
                            Cancel
                        </button>
                        <button type="submit" class="btn btn-primary">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                            </svg>
                            Update Doctor
                        </button>
                    </div>
                </form>
            </div>

            <jsp:include page="../components/footer.jsp" />
        </div>
    </div>
</body>
</html>