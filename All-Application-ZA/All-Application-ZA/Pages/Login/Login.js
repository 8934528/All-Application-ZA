document.addEventListener('DOMContentLoaded', function () {
    // Mobile menu toggle
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const mainNav = document.querySelector('.main-nav');

    if (mobileMenuBtn && mainNav) {
        mobileMenuBtn.addEventListener('click', function () {
            this.classList.toggle('active');
            mainNav.classList.toggle('active');
        });
    }

    // Form input animations
    const formInputs = document.querySelectorAll('.form-control');
    formInputs.forEach(input => {
        input.addEventListener('focus', function () {
            this.parentElement.parentElement.querySelector('.underline').style.transform = 'scaleX(1)';
        });

        input.addEventListener('blur', function () {
            if (!this.value) {
                this.parentElement.parentElement.querySelector('.underline').style.transform = 'scaleX(0)';
            }
        });
    });

    // Add ripple effect to buttons
    function addRippleEffect(button) {
        button.addEventListener('click', function (e) {
            // Create ripple element
            const ripple = document.createElement('span');
            ripple.className = 'ripple-effect';

            // Position ripple at click location
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            ripple.style.width = ripple.style.height = `${size}px`;
            ripple.style.left = `${e.clientX - rect.left - size / 2}px`;
            ripple.style.top = `${e.clientY - rect.top - size / 2}px`;

            // Add ripple to button
            this.appendChild(ripple);

            // Remove ripple after animation
            setTimeout(() => ripple.remove(), 600);
        });
    }

    // Apply ripple effect to all buttons
    document.querySelectorAll('.submit-btn, .register-link').forEach(addRippleEffect);

    // Initialize page with fade-in effect
    document.body.style.opacity = '0';
    document.body.style.transition = 'opacity 0.5s ease';
    setTimeout(() => {
        document.body.style.opacity = '1';
    }, 100);
});

// Toast notification function
function showToast(type, message) {
    const toast = document.createElement('div');
    toast.className = `toast-notification ${type}`;
    toast.innerHTML = `
        <div class="toast-icon">
            ${type === 'success' ? '<i class="fas fa-check-circle"></i>' : '<i class="fas fa-exclamation-circle"></i>'}
        </div>
        <div class="toast-message">${message}</div>
        <div class="toast-close"><i class="fas fa-times"></i></div>
    `;

    document.body.appendChild(toast);

    // Auto-remove after 5 seconds
    setTimeout(() => {
        toast.classList.add('fade-out');
        setTimeout(() => toast.remove(), 300);
    }, 5000);

    // Manual close
    toast.querySelector('.toast-close').addEventListener('click', () => {
        toast.classList.add('fade-out');
        setTimeout(() => toast.remove(), 300);
    });
}

// Client-side form validation
function validateLoginForm() {
    let isValid = true;

    // Reset error messages
    document.querySelectorAll('.validation-error').forEach(el => el.textContent = '');

    // Username validation
    const username = document.getElementById('<%= txtUsername.ClientID %>');
    if (!username.value.trim()) {
        document.getElementById('usernameError').textContent = 'Username or email is required';
        isValid = false;
    }

    // Password validation
    const password = document.getElementById('<%= txtPassword.ClientID %>');
    if (!password.value.trim()) {
        document.getElementById('passwordError').textContent = 'Password is required';
        isValid = false;
    }

    return isValid;
}