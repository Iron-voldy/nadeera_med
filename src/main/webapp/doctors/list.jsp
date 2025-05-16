<%-- src/main/webapp/doctors/list.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MediCare - Doctor List</title>
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
                <jsp:param name="pageTitle" value="Doctor Management" />
            </jsp:include>

            <div class="page-header">
                <h2 class="page-title">Doctor List</h2>
                <a href="${pageContext.request.contextPath}/doctors/add.jsp" class="btn btn-primary">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                    </svg>
                    Add Doctor
                </a>
            </div>

            <div class="card mb-6">
                <div class="flex justify-between items-center mb-4">
                    <div class="search-box">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 search-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                        </svg>
                        <input type="text" id="doctorSearch" class="search-input" placeholder="Search doctors...">
                    </div>
                    <div class="flex space-x-2">
                        <button class="btn btn-outline btn-sm">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2.586a1 1 0 01-.293.707l-6.414 6.414a1 1 0 00-.293.707V17l-4 4v-6.586a1 1 0 00-.293-.707L3.293 7.293A1 1 0 013 6.586V4z"></path>
                            </svg>
                            Filter
                        </button>
                        <button class="btn btn-outline btn-sm">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12"></path>
                            </svg>
                            Export
                        </button>
                    </div>
                </div>

                <div class="overflow-x-auto">
                    <table class="data-table" id="doctorsTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Doctor</th>
                                <th>Specialty</th>
                                <th>Contact</th>
                                <th>Address</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="doctor" items="${doctors}">
                                <tr>
                                    <td>${doctor.id}</td>
                                    <td>
                                        <div class="flex items-center">
                                            <img src="${pageContext.request.contextPath}/Uploads/${doctor.photoFileName}" alt="${doctor.name}" class="avatar mr-3" onerror="this.src='${pageContext.request.contextPath}/assets/images/default-avatar.png'">
                                            <div>
                                                <div class="font-medium">${doctor.name}</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="specialty-badge">${doctor.specialty}</span></td>
                                    <td>
                                        <div>${doctor.phone}</div>
                                        <div class="text-sm text-gray-500">${doctor.email}</div>
                                    </td>
                                    <td>${doctor.address}</td>
                                    <td>
                                        <div class="table-actions">
                                            <a href="${pageContext.request.contextPath}/editDoctor?id=${doctor.id}" class="btn btn-outline btn-sm">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path>
                                                </svg>
                                                Edit
                                            </a>
                                            <a href="${pageContext.request.contextPath}/deleteDoctor?id=${doctor.id}" class="btn btn-danger btn-sm" onclick="return confirmDelete(${doctor.id}, '${doctor.name}')">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                                </svg>
                                                Delete
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <a href="#" class="pagination-item pagination-arrow">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                        </svg>
                    </a>
                    <a href="#" class="pagination-item active">1</a>
                    <a href="#" class="pagination-item">2</a>
                    <a href="#" class="pagination-item">3</a>
                    <a href="#" class="pagination-item pagination-arrow">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                        </svg>
                    </a>
                </div>
            </div>

            <jsp:include page="../components/footer.jsp" />
        </div>
    </div>

    <script>
        // Search functionality for doctors
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('doctorSearch');
            if (searchInput) {
                searchInput.addEventListener('keyup', function() {
                    const searchTerm = this.value.toLowerCase();
                    const table = document.getElementById('doctorsTable');
                    const rows = table.getElementsByTagName('tr');

                    // Start from index 1 to skip the header row
                    for (let i = 1; i < rows.length; i++) {
                        const rowData = rows[i].textContent.toLowerCase();
                        if (rowData.includes(searchTerm)) {
                            rows[i].style.display = '';
                        } else {
                            rows[i].style.display = 'none';
                        }
                    }
                });
            }
        });
    </script>
</body>
</html>