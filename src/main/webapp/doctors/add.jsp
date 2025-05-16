<%-- src/main/webapp/doctors/add.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MediCare - Add Doctor</title>
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
                <jsp:param name="pageTitle" value="Add New Doctor" />
            </jsp:include>

            <div class="form-container">
                <h2 class="form-title">Add New Doctor</h2>

                <form id="doctor-form" action="${pageContext.request.contextPath}/createDoctor" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" id="name" name="name" class="form-control" required>
                        <span id="name-error" class="error-message"></span>
                    </div>

                    <div class="form-group">
                        <label for="specialty" class="form-label">Specialty</label>
                        <select id="specialty" name="specialty" class="form-control" required>
                            <option value="">Select a specialty</option>
                            <option value="Cardiology">Cardiology</option>
                            <option value="Dermatology">Dermatology</option>
                            <option value="Endocrinology">Endocrinology</option>
                            <option value="Gastroenterology">Gastroenterology</option>
                            <option value="Neurology">Neurology</option>
                            <option value="Obstetrics and Gynecology">Obstetrics and Gynecology</option>
                            <option value="Oncology">Oncology</option>
                            <option value="Ophthalmology">Ophthalmology</option>
                            <option value="Orthopedics">Orthopedics</option>
                            <option value="Pediatrics">Pediatrics</option>
                            <option value="Psychiatry">Psychiatry</option>
                            <option value="Urology">Urology</option>
                            <option value="Other">Other</option>
                        </select>
                        <span id="specialty-error" class="error-message"></span>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="form-group">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="tel" id="phone" name="phone" class="form-control" pattern="[0-9]{10}" required>
                            <span id="phone-error" class="error-message"></span>
                        </div>

                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" id="email" name="email" class="form-control" required>
                            <span id="email-error" class="error-message"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="address" class="form-label">Address</label>
                        <textarea id="address" name="address" class="form-control" rows="3" required></textarea>
                        <span id="address-error" class="error-message"></span>
                    </div>

                    <div class="form-group">
                        <label for="photo" class="form-label">Photo</label>
                        <div class="relative">
                            <input type="file" id="photo" name="photo" class="form-control" accept="image/jpeg,image/png" required>
                            <span id="photo-error" class="error-message"></span>
                        </div>
                        <div class="photo-preview-container">
                            <img id="photo-preview" class="photo-preview" alt="Photo Preview">
                        </div>
                    </div>

                    <div class="form-buttons">
                        <button type="button" class="btn btn-outline" onclick="window.location.href='${pageContext.request.contextPath}/listDoctors'">
                            Cancel
                        </button>
                        <button type="submit" class="btn btn-primary">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                            </svg>
                            Add Doctor
                        </button>
                    </div>
                </form>
            </div>

            <jsp:include page="../components/footer.jsp" />
        </div>
    </div>
</body>
</html>