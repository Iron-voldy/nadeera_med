<%-- src/main/webapp/index.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MediCare - Medical Appointment System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body class="bg-gradient-to-r from-blue-50 to-indigo-50">
    <div class="min-h-screen flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-lg max-w-md w-full">
            <div class="text-center mb-8">
                <img src="${pageContext.request.contextPath}/assets/images/logo.svg" alt="MediCare Logo" class="h-16 mx-auto mb-4">
                <h1 class="text-3xl font-bold text-gray-800">MediCare</h1>
                <p class="text-gray-600 mt-2">Medical Appointment Scheduling System</p>
            </div>

            <div class="space-y-6">
                <a href="${pageContext.request.contextPath}/dashboard.jsp" class="btn btn-primary w-full flex items-center justify-center h-12">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                    </svg>
                    Go to Dashboard
                </a>

                <a href="${pageContext.request.contextPath}/listDoctors" class="btn btn-secondary w-full flex items-center justify-center h-12">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                    </svg>
                    Manage Doctors
                </a>

                <a href="${pageContext.request.contextPath}/appointments/list.jsp" class="btn btn-outline w-full flex items-center justify-center h-12">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                    </svg>
                    Schedule Appointments
                </a>
            </div>

            <div class="mt-8 text-center text-sm text-gray-500">
                <p>&copy; <%= java.time.LocalDate.now().getYear() %> MediCare. All rights reserved.</p>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>