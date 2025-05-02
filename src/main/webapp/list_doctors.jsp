<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List of Doctors</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="max-w-7xl mx-auto mt-10 p-6 bg-white rounded-lg shadow-md">
        <h1 class="text-2xl font-bold mb-6 text-center text-gray-800">List of Doctors</h1>
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Photo</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Specialty</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Phone</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Address</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                <c:forEach var="doctor" items="${doctors}">
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <img src="Uploads/${doctor.photoFileName}" alt="Doctor Photo" class="h-12 w-12 rounded-full" onerror="this.src='Uploads/default.jpg'">
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">${doctor.id}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${doctor.name}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${doctor.specialty}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${doctor.phone}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${doctor.email}</td>
                        <td class="px-6 py-4">${doctor.address}</td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <a href="editDoctor?id=${doctor.id}" class="text-blue-600 hover:text-blue-900">Edit</a>
                            <a href="deleteDoctor?id=${doctor.id}" class="text-red-600 hover:text-red-900 ml-2" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="mt-6 text-center">
            <a href="add_doctor.jsp" class="text-blue-600 hover:text-blue-900 font-medium">Add New Doctor</a>
        </div>
    </div>
</body>
</html>