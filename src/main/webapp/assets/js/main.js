/* src/main/webapp/assets/js/main.js */
document.addEventListener('DOMContentLoaded', function() {
  // Mobile menu toggle
  const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
  const sidebar = document.querySelector('.sidebar');

  if (mobileMenuBtn) {
    mobileMenuBtn.addEventListener('click', function() {
      sidebar.classList.toggle('open');
    });
  }

  // Photo preview for doctor forms
  const photoInput = document.getElementById('photo');
  const photoPreview = document.getElementById('photo-preview');

  if (photoInput && photoPreview) {
    photoInput.addEventListener('change', function() {
      previewImage(this);
    });
  }

  // Form validation
  const doctorForm = document.getElementById('doctor-form');
  if (doctorForm) {
    doctorForm.addEventListener('submit', function(e) {
      if (!validateDoctorForm()) {
        e.preventDefault();
      }
    });
  }

  // Initialize any charts if present
  initializeCharts();
});

// Preview uploaded image
function previewImage(input) {
  const preview = document.getElementById('photo-preview');
  const errorMessage = document.getElementById('photo-error');

  if (preview) {
    preview.style.display = 'none';
  }

  if (errorMessage) {
    errorMessage.textContent = '';
  }

  if (input.files && input.files[0]) {
    const file = input.files[0];

    // Validate file type
    const validTypes = ['image/jpeg', 'image/png', 'image/jpg'];
    if (!validTypes.includes(file.type)) {
      if (errorMessage) {
        errorMessage.textContent = 'Only JPG or PNG images are allowed';
      }
      input.value = '';
      return;
    }

    // Validate file size (5MB max)
    const maxSize = 5 * 1024 * 1024;
    if (file.size > maxSize) {
      if (errorMessage) {
        errorMessage.textContent = 'Image size exceeds 5MB limit';
      }
      input.value = '';
      return;
    }

    const reader = new FileReader();
    reader.onload = function(e) {
      if (preview) {
        preview.src = e.target.result;
        preview.style.display = 'block';
      }
    };
    reader.readAsDataURL(file);
  }
}

// Validate doctor form
function validateDoctorForm() {
  let isValid = true;

  // Get form elements
  const name = document.getElementById('name');
  const specialty = document.getElementById('specialty');
  const phone = document.getElementById('phone');
  const email = document.getElementById('email');
  const address = document.getElementById('address');
  const photo = document.getElementById('photo');

  // Get error elements
  const nameError = document.getElementById('name-error');
  const specialtyError = document.getElementById('specialty-error');
  const phoneError = document.getElementById('phone-error');
  const emailError = document.getElementById('email-error');
  const addressError = document.getElementById('address-error');
  const photoError = document.getElementById('photo-error');

  // Clear previous errors
  if (nameError) nameError.textContent = '';
  if (specialtyError) specialtyError.textContent = '';
  if (phoneError) phoneError.textContent = '';
  if (emailError) emailError.textContent = '';
  if (addressError) addressError.textContent = '';
  if (photoError) photoError.textContent = '';

  // Validate name
  if (name && !name.value.trim()) {
    if (nameError) nameError.textContent = 'Name is required';
    isValid = false;
  }

  // Validate specialty
  if (specialty && !specialty.value.trim()) {
    if (specialtyError) specialtyError.textContent = 'Specialty is required';
    isValid = false;
  }

  // Validate phone (10 digits)
  if (phone && !phone.value.match(/^\d{10}$/)) {
    if (phoneError) phoneError.textContent = 'Phone must be a 10-digit number';
    isValid = false;
  }

  // Validate email
  if (email && !email.value.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)) {
    if (emailError) emailError.textContent = 'Invalid email format';
    isValid = false;
  }

  // Validate address
  if (address && !address.value.trim()) {
    if (addressError) addressError.textContent = 'Address is required';
    isValid = false;
  }

  // Validate photo (only for add form, not edit form)
  const isAddForm = !document.querySelector('input[name="id"]');
  if (isAddForm && photo && !photo.files.length) {
    if (photoError) photoError.textContent = 'Photo is required';
    isValid = false;
  }

  return isValid;
}

// Initialize charts for dashboard
function initializeCharts() {
  const appointmentChartCanvas = document.getElementById('appointmentChart');
  if (appointmentChartCanvas) {
    const ctx = appointmentChartCanvas.getContext('2d');

    // Sample data - Replace with actual data in a real application
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    const appointmentData = [65, 72, 86, 78, 75, 82, 90, 85, 92, 98, 105, 112];

    // Create gradient
    const gradient = ctx.createLinearGradient(0, 0, 0, 300);
    gradient.addColorStop(0, 'rgba(79, 70, 229, 0.4)');
    gradient.addColorStop(1, 'rgba(79, 70, 229, 0)');

    // Chart configuration
    new Chart(ctx, {
      type: 'line',
      data: {
        labels: months,
        datasets: [{
          label: 'Appointments',
          data: appointmentData,
          borderColor: '#4f46e5',
          backgroundColor: gradient,
          borderWidth: 3,
          pointBackgroundColor: '#ffffff',
          pointBorderColor: '#4f46e5',
          pointBorderWidth: 2,
          pointRadius: 4,
          tension: 0.3,
          fill: true
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false
          },
          tooltip: {
            mode: 'index',
            intersect: false,
            backgroundColor: '#ffffff',
            titleColor: '#1e293b',
            bodyColor: '#64748b',
            borderColor: '#e2e8f0',
            borderWidth: 1,
            padding: 12,
            boxPadding: 6,
            usePointStyle: true,
            titleFont: {
              size: 14,
              weight: 'bold'
            },
            callbacks: {
              label: function(context) {
                return `Appointments: ${context.parsed.y}`;
              }
            }
          }
        },
        scales: {
          x: {
            grid: {
              display: false
            },
            ticks: {
              color: '#64748b',
              font: {
                size: 11
              }
            }
          },
          y: {
            grid: {
              borderDash: [2, 2],
              color: '#e2e8f0'
            },
            ticks: {
              color: '#64748b',
              font: {
                size: 11
              },
              stepSize: 20
            }
          }
        }
      }
    });
  }

  const specialtyChartCanvas = document.getElementById('specialtyChart');
  if (specialtyChartCanvas) {
    const ctx = specialtyChartCanvas.getContext('2d');

    // Sample data - Replace with actual data in a real application
    const specialties = ['Cardiology', 'Dermatology', 'Neurology', 'Pediatrics', 'Orthopedics', 'Other'];
    const doctorCounts = [8, 6, 5, 7, 4, 10];

    // Chart configuration
    new Chart(ctx, {
      type: 'doughnut',
      data: {
        labels: specialties,
        datasets: [{
          data: doctorCounts,
          backgroundColor: [
            '#4f46e5', // Primary
            '#14b8a6', // Secondary
            '#f59e0b', // Warning
            '#22c55e', // Success
            '#ef4444', // Danger
            '#64748b'  // Light
          ],
          borderWidth: 2,
          borderColor: '#ffffff'
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              padding: 20,
              boxWidth: 10,
              color: '#1e293b',
              font: {
                size: 11
              }
            }
          },
          tooltip: {
            backgroundColor: '#ffffff',
            titleColor: '#1e293b',
            bodyColor: '#64748b',
            borderColor: '#e2e8f0',
            borderWidth: 1,
            padding: 12,
            boxPadding: 6,
            usePointStyle: true,
            callbacks: {
              label: function(context) {
                return `${context.label}: ${context.parsed} doctors`;
              }
            }
          }
        },
        cutout: '65%'
      }
    });
  }
}

// Confirm delete
function confirmDelete(doctorId, doctorName) {
  return confirm(`Are you sure you want to delete Dr. ${doctorName}?`);
}