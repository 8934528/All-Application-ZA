// app.js - Main application script
document.addEventListener('DOMContentLoaded', function() {
    // Hide main content initially
    const mainContent = document.getElementById('main-content');
    const welcomeAnimation = document.getElementById('welcome-animation');
    
    // After 3 seconds, hide welcome animation and show main content
    setTimeout(function() {
        welcomeAnimation.style.opacity = '0';
        setTimeout(function() {
            welcomeAnimation.classList.add('hidden');
            mainContent.classList.remove('hidden');
            
            // Check if user is logged in
            const authToken = localStorage.getItem('authToken');
            if (authToken) {
                const user = JSON.parse(localStorage.getItem('user'));
                const authButtons = document.querySelector('.auth-buttons');
                if (authButtons) {
                    authButtons.innerHTML = `
                        <a href="../dashboard/${user.role === 'admin' ? 'admin' : 'student'}.html" class="btn btn-primary">Dashboard</a>
                        <button class="btn btn-danger">Logout</button>
                    `;
                }
            }
        }, 500);
    }, 3000);
    
    // Initialize other components
    if (typeof initAuthButtons === 'function') initAuthButtons();
    if (typeof loadUniversities === 'function') loadUniversities();
    if (typeof initModal === 'function') initModal();
    if (typeof setupAPSCalculator === 'function') setupAPSCalculator();
});