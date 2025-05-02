<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.doctormanagement.model.Doctor" %>
<html>
<head>
    <title>Edit Doctor</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="max-w-lg mx-auto mt-10 p-6 bg-white rounded-lg shadow-md">
        <h2 class="text-2xl font-bold mb-6 text-center text-gray-800">Edit Doctor</h2>
        <% Doctor doctor = (Doctor) request.getAttribute("doctor"); %>
        <form action="updateDoctor" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= doctor.getId() %>">
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="name">Name</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500" id="name" type="text" name="name" value="<%= doctor.getName() %>" required>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="specialty">Specialty</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500" id="specialty" type="text" name="specialty" value="<%= doctor.getSpecialty() %>" required>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="phone">Phone</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500" id="phone" type="tel" name="phone" value="<%= doctor.getPhone() %>" required>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="email">Email</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500" id="email" type="email" name="email" value="<%= doctor.getEmail() %>" required>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="address">Address</label>
                <textarea class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500" id="address" name="address" rows="3" required><%= doctor.getAddress() %></textarea>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2">Current Photo</label>
                <img src="Uploads/<%= doctor.getPhotoFileName() %>" alt="Doctor Photo" class="h-24 w-24 rounded-full mb-2" onerror="this.src='Uploads/default.jpg'">
            </div>
            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="photo">Upload New Photo (Optional)</label>
                <input class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 focus:outline-none" id="photo" type="file" name="photo" accept="image/*">
            </div>
            <div class="flex items-center justify-center">
                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-6 rounded focus:outline-none focus:shadow-outline" type="submit">
                    Update Doctor
                </button>
            </div>
        </form>
    </div>
</body>
</html>