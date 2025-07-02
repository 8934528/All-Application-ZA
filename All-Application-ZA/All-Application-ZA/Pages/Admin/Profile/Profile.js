document.addEventListener('DOMContentLoaded', function () {
    // Initialize Bootstrap tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    // Mobile menu toggle (for smaller screens)
    const mobileMenuBtn = document.createElement('button');
    mobileMenuBtn.className = 'btn btn-primary mobile-menu-btn d-lg-none';
    mobileMenuBtn.innerHTML = '<i class="fas fa-bars"></i> Menu';
    mobileMenuBtn.style.position = 'fixed';
    mobileMenuBtn.style.bottom = '20px';
    mobileMenuBtn.style.right = '20px';
    mobileMenuBtn.style.zIndex = '1000';
    mobileMenuBtn.style.borderRadius = '50px';
    mobileMenuBtn.style.padding = '0.75rem 1.5rem';
    mobileMenuBtn.style.boxShadow = '0 5px 15px rgba(0, 0, 0, 0.2)';

    document.body.appendChild(mobileMenuBtn);

    mobileMenuBtn.addEventListener('click', function () {
        document.querySelector('.sidebar').classList.toggle('active');
    });

    // Close mobile menu when clicking on a link
    document.querySelectorAll('#admin-nav .nav-link').forEach(link => {
        link.addEventListener('click', function () {
            if (window.innerWidth < 992) {
                document.querySelector('.sidebar').classList.remove('active');
            }
        });
    });

    // Profile picture change functionality
    const changePictureBtn = document.getElementById('changePictureBtn');
    const profilePictureInput = document.getElementById('profilePictureInput');
    const profileImage = document.getElementById('profileImage');

    if (changePictureBtn && profilePictureInput) {
        changePictureBtn.addEventListener('click', function (e) {
            e.preventDefault();
            profilePictureInput.click();
        });

        profilePictureInput.addEventListener('change', function () {
            if (this.files && this.files[0]) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    profileImage.src = e.target.result;
                    showToast('Profile picture updated successfully!', 'success');
                };
                reader.readAsDataURL(this.files[0]);
            }
        });
    }

    // Profile form submission
    const profileForm = document.getElementById('profileForm');
    if (profileForm) {
        profileForm.addEventListener('submit', function (e) {
            e.preventDefault();

            // Get form values
            const firstName = document.getElementById('firstName').value;
            const lastName = document.getElementById('lastName').value;
            const email = document.getElementById('email').value;

            // Update profile display
            document.getElementById('profileName').textContent = `${firstName} ${lastName}`;
            document.getElementById('profileEmail').textContent = email;

            showToast('Profile updated successfully!', 'success');
        });
    }

    // Password form submission
    const passwordForm = document.getElementById('passwordForm');
    if (passwordForm) {
        passwordForm.addEventListener('submit', function (e) {
            e.preventDefault();

            const currentPassword = document.getElementById('currentPassword').value;
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            // Validate passwords match
            if (newPassword !== confirmPassword) {
                showToast('New passwords do not match!', 'danger');
                return;
            }

            // Validate password length
            if (newPassword.length < 8) {
                showToast('Password must be at least 8 characters long!', 'danger');
                return;
            }

            // In a real app, you would verify current password and update
            showToast('Password changed successfully!', 'success');

            // Reset form
            passwordForm.reset();
        });
    }

    // Toast notification function
    function showToast(message, type) {
        // Remove any existing toasts
        const existingToasts = document.querySelectorAll('.toast-container');
        existingToasts.forEach(toast => toast.remove());

        const toastContainer = document.createElement('div');
        toastContainer.className = 'toast-container position-fixed bottom-0 end-0 p-3';
        toastContainer.style.zIndex = '11';

        const toastEl = document.createElement('div');
        toastEl.className = `toast show align-items-center text-bg-${type} border-0`;
        toastEl.setAttribute('role', 'alert');
        toastEl.setAttribute('aria-live', 'assertive');
        toastEl.setAttribute('aria-atomic', 'true');

        toastEl.innerHTML = `
            <div class="d-flex">
                <div class="toast-body">
                    ${message}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        `;

        toastContainer.appendChild(toastEl);
        document.body.appendChild(toastContainer);

        // Auto-remove toast after 5 seconds
        setTimeout(() => {
            toastContainer.remove();
        }, 5000);
    }

    console.log("Profile page initialized successfully");
});