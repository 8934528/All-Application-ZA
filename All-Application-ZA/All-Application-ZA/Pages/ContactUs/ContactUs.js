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

    // FAQ Accordion
    const faqItems = document.querySelectorAll('.faq-item');
    faqItems.forEach(item => {
        const question = item.querySelector('.faq-question');
        question.addEventListener('click', () => {
            item.classList.toggle('active');
        });
    });

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
    document.querySelectorAll('.submit-btn, .contact-btn, .cta-button').forEach(addRippleEffect);

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
function validateForm() {
    let isValid = true;

    // Reset error messages
    document.querySelectorAll('.validation-error').forEach(el => el.textContent = '');

    // Name validation
    const name = document.getElementById('<%= txtName.ClientID %>');
    if (!name.value.trim()) {
        document.getElementById('nameError').textContent = 'Name is required';
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

    // Subject validation
    const subject = document.getElementById('<%= txtSubject.ClientID %>');
    if (!subject.value.trim()) {
        document.getElementById('subjectError').textContent = 'Subject is required';
        isValid = false;
    }

    // Message validation
    const message = document.getElementById('<%= txtMessage.ClientID %>');
    if (!message.value.trim()) {
        document.getElementById('messageError').textContent = 'Message is required';
        isValid = false;
    }

    if (isValid) {
        // Show success message (in a real app, this would be handled by server-side code)
        document.querySelector('.form-container').style.display = 'none';
        const successMsg = document.getElementById('successMessage');
        successMsg.style.display = 'flex';
        successMsg.classList.add('animate__fadeIn');

        // Prevent actual postback for this demo
        return false;
    }

    return false; // Prevent form submission if validation fails
}