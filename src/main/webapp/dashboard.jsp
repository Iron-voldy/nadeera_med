<%-- src/main/webapp/dashboard.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.doctormanagement.model.Doctor" %>
<%@ page import="com.doctormanagement.util.FileUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.stream.Collectors" %>
<html>
<head>
    <title>MediCare - Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <div class="layout-container">
        <jsp:include page="components/sidebar.jsp">
            <jsp:param name="currentPage" value="dashboard" />
        </jsp:include>

        <div class="content">
            <jsp:include page="components/header.jsp">
                <jsp:param name="pageTitle" value="Dashboard" />
            </jsp:include>

            <%
                // Get doctor count
                String filePath = application.getRealPath("/WEB-INF/data/doctors.txt");
                List<Doctor> doctors = FileUtil.getAllDoctors(filePath);
                int doctorCount = doctors.size();

                // Count doctors by specialty
                Map<String, Long> specialtyCounts = doctors.stream()
                    .collect(Collectors.groupingBy(Doctor::getSpecialty, Collectors.counting()));

                // Fake data for dashboard statistics
                int patientCount = 125;
                int appointmentCount = 42;
                int todayAppointments = 8;
            %>

            <div class="dashboard-cards">
                <div class="card stat-card">
                    <div class="stat-icon" style="background-color: rgba(79, 70, 229, 0.1); color: #4f46e5;">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                        </svg>
                    </div>
                    <h3 class="stat-title">Total Doctors</h3>
                    <p class="stat-value"><%= doctorCount %></p>
                    <p class="stat-change positive-change">+2 this month</p>
                </div>

                <div class="card stat-card">
                    <div class="stat-icon" style="background-color: rgba(20, 184, 166, 0.1); color: #14b8a6;">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
                        </svg>
                    </div>
                    <h3 class="stat-title">Total Patients</h3>
                    <p class="stat-value"><%= patientCount %></p>
                    <p class="stat-change positive-change">+15 this month</p>
                </div>

                <div class="card stat-card">
                    <div class="stat-icon" style="background-color: rgba(245, 158, 11, 0.1); color: #f59e0b;">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                        </svg>
                    </div>
                    <h3 class="stat-title">Monthly Appointments</h3>
                    <p class="stat-value"><%= appointmentCount %></p>
                    <p class="stat-change positive-change">+8% vs last month</p>
                </div>

                <div class="card stat-card">
                    <div class="stat-icon" style="background-color: rgba(34, 197, 94, 0.1); color: #22c55e;">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </div>
                    <h3 class="stat-title">Today's Appointments</h3>
                    <p class="stat-value"><%= todayAppointments %></p>
                    <p class="stat-change">2 remaining</p>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
                <div class="card chart-card">
                    <div class="chart-header">
                        <h3 class="chart-title">Appointment Trends</h3>
                        <div class="chart-actions">
                            <button class="btn btn-outline btn-sm">This Year</button>
                        </div>
                    </div>
                    <div style="height: 300px;">
                        <canvas id="appointmentChart"></canvas>
                    </div>
                </div>

                <div class="card chart-card">
                    <div class="chart-header">
                        <h3 class="chart-title">Doctors by Specialty</h3>
                        <div class="chart-actions">
                            <button class="btn btn-outline btn-sm">View All</button>
                        </div>
                    </div>
                    <div style="height: 300px;">
                        <canvas id="specialtyChart"></canvas>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="chart-header">
                    <h3 class="chart-title">Recent Doctors</h3>
                    <a href="${pageContext.request.contextPath}/listDoctors" class="btn btn-outline btn-sm">View All</a>
                </div>
                <div class="overflow-x-auto">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Doctor</th>
                                <th>Specialty</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                // Display up to 5 recent doctors
                                int count = 0;
                                for (Doctor doctor : doctors) {
                                    if (count++ >= 5) break;
                            %>
                                <tr>
                                    <td>
                                        <div class="flex items-center">
                                            <img src="Uploads/<%= doctor.getPhotoFileName() %>" alt="<%= doctor.getName() %>" class="avatar mr-3" onerror="this.src='assets/images/default-avatar.png'">
                                            <div>
                                                <div class="font-medium"><%= doctor.getName() %></div>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="specialty-badge"><%= doctor.getSpecialty() %></span></td>
                                    <td><%= doctor.getPhone() %></td>
                                    <td><%= doctor.getEmail() %></td>
                                    <td>
                                        <div class="table-actions">
                                            <a href="editDoctor?id=<%= doctor.getId() %>" class="btn btn-outline btn-sm">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path>
                                                </svg>
                                                Edit
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

            <jsp:include page="components/footer.jsp" />
        </div>
    </div>
</body>
</html>