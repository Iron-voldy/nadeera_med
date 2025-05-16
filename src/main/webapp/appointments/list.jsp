<%-- src/main/webapp/appointments/list.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MediCare - Appointments</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <div class="layout-container">
        <jsp:include page="../components/sidebar.jsp">
            <jsp:param name="currentPage" value="appointments" />
        </jsp:include>

        <div class="content">
            <jsp:include page="../components/header.jsp">
                <jsp:param name="pageTitle" value="Appointment Management" />
            </jsp:include>

            <div class="page-header">
                <h2 class="page-title">Appointment Calendar</h2>
                <a href="#" class="btn btn-primary">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                    </svg>
                    New Appointment
                </a>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-4 gap-6 mb-6">
                <div class="lg:col-span-3">
                    <div class="card">
                        <div class="flex justify-between items-center mb-4">
                            <div class="flex space-x-2">
                                <button class="btn btn-outline btn-sm">Today</button>
                                <button class="btn btn-outline btn-sm">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                                    </svg>
                                </button>
                                <button class="btn btn-outline btn-sm">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                                    </svg>
                                </button>
                            </div>
                            <h3 class="text-lg font-medium">October 2023</h3>
                            <div class="flex space-x-2">
                                <button class="btn btn-outline btn-sm">Month</button>
                                <button class="btn btn-outline btn-sm">Week</button>
                                <button class="btn btn-outline btn-sm">Day</button>
                            </div>
                        </div>

                        <div class="border rounded-lg overflow-hidden">
                            <table class="w-full">
                                <thead>
                                    <tr>
                                        <th class="py-2 px-3 text-center border-b border-r">Sun</th>
                                        <th class="py-2 px-3 text-center border-b border-r">Mon</th>
                                        <th class="py-2 px-3 text-center border-b border-r">Tue</th>
                                        <th class="py-2 px-3 text-center border-b border-r">Wed</th>
                                        <th class="py-2 px-3 text-center border-b border-r">Thu</th>
                                        <th class="py-2 px-3 text-center border-b border-r">Fri</th>
                                        <th class="py-2 px-3 text-center border-b">Sat</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="h-24">
                                        <td class="border-r border-b p-1 text-gray-400">30</td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">1</div>
                                            <div class="bg-blue-100 text-blue-800 text-xs p-1 rounded mb-1">09:00 - John Doe</div>
                                            <div class="bg-green-100 text-green-800 text-xs p-1 rounded">14:30 - Jane Smith</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">2</div>
                                            <div class="bg-purple-100 text-purple-800 text-xs p-1 rounded">11:00 - David Wilson</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">3</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">4</div>
                                            <div class="bg-blue-100 text-blue-800 text-xs p-1 rounded">10:15 - Sarah Johnson</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">5</div>
                                        </td>
                                        <td class="border-b p-1">
                                            <div class="text-sm mb-1">6</div>
                                        </td>
                                    </tr>
                                    <tr class="h-24">
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">7</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">8</div>
                                            <div class="bg-yellow-100 text-yellow-800 text-xs p-1 rounded">13:45 - Michael Brown</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">9</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">10</div>
                                            <div class="bg-blue-100 text-blue-800 text-xs p-1 rounded mb-1">09:30 - Emily Wilson</div>
                                            <div class="bg-green-100 text-green-800 text-xs p-1 rounded">15:00 - Robert Davis</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">11</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">12</div>
                                        </td>
                                        <td class="border-b p-1">
                                            <div class="text-sm mb-1">13</div>
                                        </td>
                                    </tr>
                                    <tr class="h-24">
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">14</div>
                                        </td>
                                        <td class="border-r border-b p-1 bg-blue-50">
                                            <div class="text-sm mb-1 font-medium">15</div>
                                            <div class="bg-red-100 text-red-800 text-xs p-1 rounded mb-1">08:00 - Medical Staff Meeting</div>
                                            <div class="bg-blue-100 text-blue-800 text-xs p-1 rounded mb-1">10:30 - John Doe</div>
                                            <div class="bg-purple-100 text-purple-800 text-xs p-1 rounded">16:15 - Lisa Thompson</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">16</div>
                                            <div class="bg-green-100 text-green-800 text-xs p-1 rounded">11:45 - Karen Wilson</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">17</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">18</div>
                                            <div class="bg-blue-100 text-blue-800 text-xs p-1 rounded">14:00 - David Miller</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">19</div>
                                        </td>
                                        <td class="border-b p-1">
                                            <div class="text-sm mb-1">20</div>
                                        </td>
                                    </tr>
                                    <tr class="h-24">
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">21</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">22</div>
                                            <div class="bg-blue-100 text-blue-800 text-xs p-1 rounded">09:15 - Jane Smith</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">23</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">24</div>
                                            <div class="bg-green-100 text-green-800 text-xs p-1 rounded">13:30 - William Johnson</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">25</div>
                                        </td>
                                        <td class="border-r border-b p-1">
                                            <div class="text-sm mb-1">26</div>
                                            <div class="bg-yellow-100 text-yellow-800 text-xs p-1 rounded">11:00 - Sarah Davis</div>
                                        </td>
                                        <td class="border-b p-1">
                                            <div class="text-sm mb-1">27</div>
                                        </td>
                                    </tr>
                                    <tr class="h-24">
                                        <td class="border-r p-1">
                                            <div class="text-sm mb-1">28</div>
                                        </td>
                                        <td class="border-r p-1">
                                            <div class="text-sm mb-1">29</div>
                                            <div class="bg-blue-100 text-blue-800 text-xs p-1 rounded mb-1">10:00 - Thomas Wilson</div>
                                            <div class="bg-purple-100 text-purple-800 text-xs p-1 rounded">15:30 - Maria Rodriguez</div>
                                        </td>
                                        <td class="border-r p-1">
                                            <div class="text-sm mb-1">30</div>
                                        </td>
                                        <td class="border-r p-1">
                                            <div class="text-sm mb-1">31</div>
                                            <div class="bg-green-100 text-green-800 text-xs p-1 rounded">09:45 - Robert Johnson</div>
                                        </td>
                                        <td class="border-r p-1 text-gray-400">
                                            <div class="text-sm mb-1">1</div>
                                        </td>
                                        <td class="border-r p-1 text-gray-400">
                                            <div class="text-sm mb-1">2</div>
                                        </td>
                                        <td class="p-1 text-gray-400">
                                            <div class="text-sm mb-1">3</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="lg:col-span-1">
                    <div class="card mb-6">
                        <h3 class="text-lg font-medium mb-4">Today's Appointments</h3>
                        <div class="space-y-4">
                            <div class="border-l-4 border-blue-500 pl-3 py-2">
                                <div class="font-medium">John Doe</div>
                                <div class="text-sm text-gray-500">10:30 AM - 11:00 AM</div>
                                <div class="flex items-center mt-2">
                                    <img src="${pageContext.request.contextPath}/assets/images/default-avatar.png" alt="Dr. Hasindu" class="h-6 w-6 rounded-full mr-2">
                                    <span class="text-sm">Dr. Hasindu Wanninayake</span>
                                </div>
                            </div>

                            <div class="border-l-4 border-purple-500 pl-3 py-2">
                                <div class="font-medium">Lisa Thompson</div>
                                <div class="text-sm text-gray-500">4:15 PM - 4:45 PM</div>
                                <div class="flex items-center mt-2">
                                    <img src="${pageContext.request.contextPath}/assets/images/default-avatar.png" alt="Dr. Tharushi" class="h-6 w-6 rounded-full mr-2">
                                    <span class="text-sm">Dr. Tharushi Wathsala</span>
                                </div>
                            </div>

                            <hr class="my-4">

                            <div class="border-l-4 border-red-500 pl-3 py-2">
                                <div class="font-medium">Medical Staff Meeting</div>
                                <div class="text-sm text-gray-500">8:00 AM - 9:00 AM</div>
                                <div class="text-sm text-gray-600 mt-2">Conference Room A</div>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <h3 class="text-lg font-medium mb-4">Quick Actions</h3>
                        <div class="space-y-2">
                            <a href="#" class="btn btn-outline w-full flex items-center justify-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                </svg>
                                Schedule Appointment
                            </a>
                            <a href="#" class="btn btn-outline w-full flex items-center justify-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                </svg>
                                Generate Reports
                            </a>
                            <a href="#" class="btn btn-outline w-full flex items-center justify-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path>
                                </svg>
                                Send Reminders
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mb-6">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-lg font-medium">Upcoming Appointments</h3>
                    <div class="flex space-x-2">
                        <button class="btn btn-outline btn-sm">View All</button>
                        <button class="btn btn-outline btn-sm">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2.586a1 1 0 01-.293.707l-6.414 6.414a1 1 0 00-.293.707V17l-4 4v-6.586a1 1 0 00-.293-.707L3.293 7.293A1 1 0 013 6.586V4z"></path>
                            </svg>
                            Filter
                        </button>
                    </div>
                </div>

                <div class="overflow-x-auto">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Patient</th>
                                <th>Date & Time</th>
                                <th>Type</th>
                                <th>Doctor</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="flex items-center">
                                        <img src="${pageContext.request.contextPath}/assets/images/default-avatar.png" alt="John Doe" class="avatar mr-3">
                                        <div>
                                            <div class="font-medium">John Doe</div>
                                            <div class="text-sm text-gray-500">ID: P1001</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div>Oct 15, 2023</div>
                                    <div class="text-sm text-gray-500">10:30 AM</div>
                                </td>
                                <td><span class="badge badge-primary">Follow-up</span></td>
                                <td>
                                    <div class="flex items-center">
                                        <img src="${pageContext.request.contextPath}/Uploads/1746149585150_images (43).jpeg" alt="Dr. Hasindu" class="h-8 w-8 rounded-full mr-2" onerror="this.src='${pageContext.request.contextPath}/assets/images/default-avatar.png'">
                                        <span>Dr. Hasindu Wanninayake</span>
                                    </div>
                                </td>
                                <td><span class="badge badge-success">Confirmed</span></td>
                                <td>
                                    <div class="table-actions">
                                        <a href="#" class="btn btn-outline btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path>
                                            </svg>
                                        </a>
                                        <a href="#" class="btn btn-outline btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                            </svg>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="flex items-center">
                                        <img src="${pageContext.request.contextPath}/assets/images/default-avatar.png" alt="Lisa Thompson" class="avatar mr-3">
                                        <div>
                                            <div class="font-medium">Lisa Thompson</div>
                                            <div class="text-sm text-gray-500">ID: P1005</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div>Oct 15, 2023</div>
                                    <div class="text-sm text-gray-500">4:15 PM</div>
                                </td>
                                <td><span class="badge badge-warning">Consultation</span></td>
                                <td>
                                    <div class="flex items-center">
                                        <img src="${pageContext.request.contextPath}/Uploads/monnankulama" alt="Dr. Tharushi" class="h-8 w-8 rounded-full mr-2" onerror="this.src='${pageContext.request.contextPath}/assets/images/default-avatar.png'">
                                        <span>Dr. Tharushi Wathsala</span>
                                    </div>
                                </td>
                                <td><span class="badge badge-success">Confirmed</span></td>
                                <td>
                                    <div class="table-actions">
                                        <a href="#" class="btn btn-outline btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path>
                                            </svg>
                                        </a>
                                        <a href="#" class="btn btn-outline btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                            </svg>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="flex items-center">
                                        <img src="${pageContext.request.contextPath}/assets/images/default-avatar.png" alt="James Wilson" class="avatar mr-3">
                                        <div>
                                            <div class="font-medium">James Wilson</div>
                                            <div class="text-sm text-gray-500">ID: P1010</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div>Oct 16, 2023</div>
                                    <div class="text-sm text-gray-500">11:45 AM</div>
                                </td>
                                <td><span class="badge badge-danger">Emergency</span></td>
                                <td>
                                    <div class="flex items-center">
                                        <img src="${pageContext.request.contextPath}/Uploads/1746149585150_images (43).jpeg" alt="Dr. Hasindu" class="h-8 w-8 rounded-full mr-2" onerror="this.src='${pageContext.request.contextPath}/assets/images/default-avatar.png'">
                                        <span>Dr. Hasindu Wanninayake</span>
                                    </div>
                                </td>
                                <td><span class="badge badge-warning">Pending</span></td>
                                <td>
                                    <div class="table-actions">
                                        <a href="#" class="btn btn-outline btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path>
                                            </svg>
                                        </a>
                                        <a href="#" class="btn btn-outline btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                            </svg>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <jsp:include page="../components/footer.jsp" />
        </div>
    </div>
</body>
</html>