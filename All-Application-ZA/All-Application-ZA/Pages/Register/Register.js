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
            this.parentElement.querySelector('.underline').style.width = '100%';
        });

        input.addEventListener('blur', function () {
            if (!this.value) {
                this.parentElement.querySelector('.underline').style.width = '0';
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
    document.querySelectorAll('.submit-btn, .success-link').forEach(addRippleEffect);

    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                window.scrollTo({
                    top: target.offsetTop - 80,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Initialize page with fade-in effect
    document.body.style.opacity = '0';
    document.body.style.transition = 'opacity 0.5s ease';
    setTimeout(() => {
        document.body.style.opacity = '1';
    }, 100);
});

// Custom form validation
function validateRegisterForm() {
    let isValid = true;

    // Reset error messages
    document.querySelectorAll('.validation-error').forEach(el => el.textContent = '');

    // First Name validation
    const firstName = document.getElementById('<%= txtFirstName.ClientID %>');
    if (!firstName.value.trim()) {
        document.getElementById('firstNameError').textContent = 'First name is required';
        isValid = false;
    }

    // Last Name validation
    const lastName = document.getElementById('<%= txtLastName.ClientID %>');
    if (!lastName.value.trim()) {
        document.getElementById('lastNameError').textContent = 'Last name is required';
        isValid = false;
    }

    // ID Number validation
    const idNumber = document.getElementById('<%= txtIDNumber.ClientID %>');
    if (!idNumber.value.trim()) {
        document.getElementById('idNumberError').textContent = 'ID/Passport number is required';
        isValid = false;
    }

    // Date of Birth validation
    const dob = document.getElementById('<%= txtDOB.ClientID %>');
    if (!dob.value) {
        document.getElementById('dobError').textContent = 'Date of birth is required';
        isValid = false;
    }

    // Email validation
    const email = document.getElementById('<%= txtEmail.ClientID %>');
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email.value.trim()) {
        document.getElementById('emailError').textContent = 'Email is required';
        isValid = false;
    } else if (!emailRegex.test(email.value)) {
        document.getElementById('emailError').textContent = 'Invalid email format';
        isValid = false;
    }

    // Phone validation
    const phone = document.getElementById('<%= txtPhone.ClientID %>');
    if (!phone.value.trim()) {
        document.getElementById('phoneError').textContent = 'Phone number is required';
        isValid = false;
    }

    // Address validation
    const address = document.getElementById('<%= txtAddress.ClientID %>');
    if (!address.value.trim()) {
        document.getElementById('addressError').textContent = 'Address is required';
        isValid = false;
    }

    // Province validation
    const province = document.getElementById('<%= ddlProvince.ClientID %>');
    if (!province.value) {
        document.getElementById('provinceError').textContent = 'Province is required';
        isValid = false;
    }

    // Username validation
    const username = document.getElementById('<%= txtUsername.ClientID %>');
    if (!username.value.trim()) {
        document.getElementById('usernameError').textContent = 'Username is required';
        isValid = false;
    }

    // Password validation
    const password = document.getElementById('<%= txtPassword.ClientID %>');
    if (!password.value.trim()) {
        document.getElementById('passwordError').textContent = 'Password is required';
        isValid = false;
    } else if (password.value.length < 8) {
        document.getElementById('passwordError').textContent = 'Password must be at least 8 characters';
        isValid = false;
    }