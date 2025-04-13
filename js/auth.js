// auth.js - Authentication functionality
document.addEventListener('DOMContentLoaded', function() {
    // Check if user is logged in
    const authToken = localStorage.getItem('authToken');
    if (authToken && window.location.pathname.includes('auth/')) {
        window.location.href = '../dashboard/student.html';
    }

    // Login Form Handler
    const loginForm = document.getElementById('login-form');
    if (loginForm) {
        loginForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            
            // Mock authentication - in a real app, this would be an API call
            if (email && password) {
                // Simulate API call delay
                setTimeout(() => {
                    localStorage.setItem('authToken', 'mock-token-123');
                    localStorage.setItem('user', JSON.stringify({
                        name: 'John Doe',
                        email: email,
                        role: 'student'
                    }));
                    
                    // Redirect based on user role
                    const user = JSON.parse(localStorage.getItem('user'));
                    if (user.role === 'admin') {
                        window.location.href = '../dashboard/admin.html';
                    } else {
                        window.location.href = '../dashboard/student.html';
                    }
                }, 500);
            } else {
                alert('Please enter both email and password');
            }
        });
    }

    // Registration Form Handler
    const registerForm = document.getElementById('register-form');
    if (registerForm) {
        registerForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = {
                fullname: document.getElementById('fullname').value,
                email: document.getElementById('email').value,
                idNumber: document.getElementById('id-number').value,
                password: document.getElementById('password').value
            };
            
            if (formData.password !== document.getElementById('confirm-password').value) {
                alert('Passwords do not match');
                return;
            }
            
            // Mock registration - in a real app, this would be an API call
            if (formData.fullname && formData.email && formData.idNumber && formData.password) {
                // Simulate API call delay
                setTimeout(() => {
                    localStorage.setItem('authToken', 'mock-token-123');
                    localStorage.setItem('user', JSON.stringify({
                        name: formData.fullname,
                        email: formData.email,
                        idNumber: formData.idNumber,
                        role: 'student'
                    }));
                    
                    window.location.href = '../dashboard/student.html';
                }, 500);
            } else {
                alert('Please fill in all fields');
            }
        });
    }

    // Logout Handler
    const logoutButtons = document.querySelectorAll('.btn-danger');
    logoutButtons.forEach(button => {
        button.addEventListener('click', function() {
            localStorage.removeItem('authToken');
            localStorage.removeItem('user');
            window.location.href = '../index.html';
        });
    });
});