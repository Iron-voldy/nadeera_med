<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Doctor</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .error { color: red; font-size: 0.875rem; }
        #photo-preview { display: none; }
    </style>
</head>
<body class="bg-gray-100">
    <div class="max-w-lg mx-auto mt-10 p-6 bg-white rounded-lg shadow-md">
        <h2 class="text-2xl font-bold mb-6 text-center text-gray-800">Add New Doctor</h2>
        <form id="add-doctor-form" action="createDoctor" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="name">Name</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500" id="name" type="text" name="name" required>
                <span id="name-error" class="error"></span>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="specialty">Specialty</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500" id="specialty" type="text" name="specialty" required>
                <span id="specialty-error" class="error"></span>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="phone">Phone</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500" id="phone" type="tel" name="phone" pattern="[0-9]{10}" required>
                <span id="phone-error" class="error"></span>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="email">Email</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500" id="email" type="email" name="email" required>
                <span id="email-error" class="error"></span>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="address">Address</label>
                <textarea class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500" id="address" name="address" rows="3" required></textarea>
                <span id="address-error" class="error"></span>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="photo">Photo</label>
                <input class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 focus:outline-none" id="photo" type="file" name="photo" accept="image/jpeg,image/png" required onchange="previewImage(this)">
                <span id="photo-error" class="error"></span>
                <img id="photo-preview" class="h-24 w-24 rounded-full mt-2" alt="Photo Preview">
            </div>
            <div class="flex items-center justify-center">
                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-6 rounded focus:outline-none focus:shadow-outline" type="submit">
                    Add Doctor
                </button>
            </div>
        </form>
    </div>
    <script>
        function previewImage(input) {
            const preview = document.getElementById('photo-preview');
            const file = input.files[0];
            const error = document.getElementById('photo-error');
            error.textContent = '';
            preview.style.display = 'none';

            if (file) {
                const fileType = file.type;
                const fileSize = file.size;
                const validTypes = ['image/jpeg', 'image/png'];
                const maxSize = 5 * 1024 * 1024; // 5MB

                if (!validTypes.includes(fileType)) {
                    error.textContent = 'Only JPG or PNG images are allowed';
                    input.value = '';
                    return;
                }
                if (fileSize > maxSize) {
                    error.textContent = 'Image size exceeds 5MB limit';
                    input.value = '';
                    return;
                }

                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                };
                reader.readAsDataURL(file);
            }
        }

        function validateForm() {
            let isValid = true;
            const name = document.getElementById('name').value.trim();
            const specialty = document.getElementById('specialty').value.trim();
            const phone = document.getElementById('phone').value;
            const email = document.getElementById('email').value;
            const address = document.getElementById('address').value.trim();
            const photo = document.getElementById('photo').files[0];

            document.getElementById('name-error').textContent = '';
            document.getElementById('specialty-error').textContent = '';
            document.getElementById('phone-error').textContent = '';
            document.getElementById('email-error').textContent = '';
            document.getElementById('address-error').textContent = '';
            document.getElementById('photo-error').textContent = '';

            if (!name) {
                document.getElementById('name-error').textContent = 'Name is required';
                isValid = false;
            }
            if (!specialty) {
                document.getElementById('specialty-error').textContent = 'Specialty is required';
                isValid = false;
            }
            if (!phone.match(/^\d{10}$/)) {
                document.getElementById('phone-error').textContent = 'Phone must be a 10-digit number';
                isValid = false;
            }
            if (!email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)) {
                document.getElementById('email-error').textContent = 'Invalid email format';
                isValid = false;
            }
            if (!address) {
                document.getElementById('address-error').textContent = 'Address is required';
                isValid = false;
            }
            if (!photo) {
                document.getElementById('photo-error').textContent = 'Photo is required';
                isValid = false;
            }

            return isValid;
        }
    </script>
</body>
</html>