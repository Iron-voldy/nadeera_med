<%-- src/main/webapp/patients/list.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MediCare - Patients List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <div class="layout-container">
        <jsp:include page="../components/sidebar.jsp">
            <jsp:param name="currentPage" value="patients" />
        </jsp:include>

        <div class="content">
            <jsp:include page="../components/header.jsp">
                <jsp:param name="pageTitle" value="Patient Management" />
            </jsp:include>

            <div class="page-header">
                <h2 class="page-title">Patient List</h2>
                <a href="#" class="btn btn-primary">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                    </svg>
                    Add Patient
                </a>
            </div>

            <div class="card mb-6">
                <div class="flex justify-between items-center mb-4">
                    <div class="search-box">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 search-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                        </svg>
                        <input type="text" class="search-input" placeholder="Search patients...">
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
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Patient</th>
                                <th>Age</th>
                                <th>Gender</th>
                                <th>Contact</th>
                                <th>Last Visit</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Sample patient data - In a real application, this would be populated from a database -->
                            <tr>
                                <td>1</td>
                                <td>
                                    <div class="flex items-center">
                                        <img src="${pageContext.request.contextPath}/assets/images/default-avatar.png" alt="John Doe" class="avatar mr-3">
                                        <div>
                                            <div class="font-medium">John Doe</div>
                                            <div class="text-sm text-gray-500">Patient ID: P1001</div>
                                        </div>
                                    </div>
                                </td>
                                <td>45</td>
                                <td>Male</td>
                                <td>
                                    <div>071-1234567</div>
                                    <div class="text-sm text-gray-500">john.doe@example.com</div>
                                </td>
                                <td>2023-08-15</td>
                                <td>
                                    <div class="table-actions">
                                        <a href="#" class="btn btn-outline btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                                            </svg>
                                            View
                                        </a>
                                        <a href="#" class="btn btn-outline btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path>
                                            </svg>
                                            Edit
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>
                                    <div class="flex items-center">
                                        <img src="${pageContext.request.contextPath}/assets/images/default-avatar.png" alt="Jane Smith" class="avatar mr-3">
                                        <div>
                                            <div class="font-medium">Jane Smith</div>
                                            <div class="text-sm text-gray-500">Patient ID: P1002</div>
                                        </div>
                                    </div>
                                </td>
                                <td>32</td>
                                <td>Female</td>
                                <td>
                                    <div>071-9876543</div>
                                    <div class="text-sm text-gray-500">jane.smith@example.com</div>
                                </td>
                                <td>2023-09-22</td>
                                <td>
                                    <div class="table-actions">
                                        <a href="#" class="btn btn-outline btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                                            </svg>
                                            View
                                        </a>
                                        <a href="#" class="btn btn-outline btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path>
                                            </svg>
                                            Edit
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>
                                    <div class="flex items-center">
                                        <img src="${pageContext.request.contextPath}/assets/images/default-avatar.png" alt="David Wilson" class="avatar mr-3">
                                        <div>
                                            <div class="font-medium">David Wilson</div>
                                            <div class="text-sm text-gray-500">Patient ID: P1003</div>
                                        </div>
                                    </div>
                                </td>
                                <td>28</td>
                                <td>Male</td>
                                <td>
                                    <div>071-4567890</div>
                                    <div class="text-sm text-gray-500">david.wilson@example.com</div>
                                </td>
                                <td>2023-10-05</td>
                                <td>
                                    <div class="table-actions">
                                        <a href="#" class="btn btn-outline btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                                            </svg>
                                            View
                                        </a>
                                        <a href="#" class="btn btn-outline btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path>
                                            </svg>
                                            Edit
                                        </a>
                                    </div>
                                </td>
                            </tr>
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

            <div class="page-header">
                <h2 class="page-title">Recent Medical Records</h2>
                <a href="#" class="btn btn-outline">
                    View All Records
                </a>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-6">
                <div class="card">
                    <div class="flex items-center mb-4">
                        <img src="${pageContext.request.contextPath}/assets/images/default-avatar.png" alt="John Doe" class="avatar mr-3">
                        <div>
                            <div class="font-medium">John Doe</div>
                            <div class="text-sm text-gray-500">October 10, 2023</div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <span class="badge badge-primary">Annual Checkup</span>
                        <span class="badge badge-success ml-2">Completed</span>
                    </div>
                    <p class="text-gray-700 mb-4">General health assessment completed. Patient shows normal vital signs and lab results within reference ranges.</p>
                    <div class="flex justify-between items-center">
                        <span class="text-sm text-gray-500">Dr. Hasindu Wanninayake</span>
                        <a href="#" class="text-primary-600 text-sm font-medium">View Details</a>
                    </div>
                </div>

                <div class="card">
                    <div class="flex items-center mb-4">
                        <img src="${pageContext.request.contextPath}/assets/images/default-avatar.png" alt="Jane Smith" class="avatar mr-3">
                        <div>
                            <div class="font-medium">Jane Smith</div>
                            <div class="text-sm text-gray-500">September 22, 2023</div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <span class="badge badge-warning">Follow-up</span>
                        <span class="badge badge-success ml-2">Completed</span>
                    </div>
                    <p class="text-gray-700 mb-4">Follow-up appointment for previous treatment. Patient shows positive response to medication. Continue current regimen.</p>
                    <div class="flex justify-between items-center">
                        <span class="text-sm text-gray-500">Dr. Tharushi Wathsala</span>
                        <a href="#" class="text-primary-600 text-sm font-medium">View Details</a>
                    </div>
                </div>

                <div class="card">
                    <div class="flex items-center mb-4">
                        <img src="${pageContext.request.contextPath}/assets/images/default-avatar.png" alt="David Wilson" class="avatar mr-3">
                        <div>
                            <div class="font-medium">David Wilson</div>
                            <div class="text-sm text-gray-500">October 5, 2023</div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <span class="badge badge-danger">Emergency</span>
                        <span class="badge badge-success ml-2">Resolved</span>
                    </div>
                    <p class="text-gray-700 mb-4">Patient presented with acute symptoms. Emergency treatment provided. Condition stabilized. Recommend follow-up in 2 weeks.</p>
                    <div class="flex justify-between items-center">
                        <span class="text-sm text-gray-500">Dr. Hasindu Wanninayake</span>
                        <a href="#" class="text-primary-600 text-sm font-medium">View Details</a>
                    </div>
                </div>
            </div>

            <jsp:include page="../components/footer.jsp" />
        </div>
    </div>
</body>
</html>